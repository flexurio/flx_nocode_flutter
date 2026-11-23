import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/features/component/models/component_field_array.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/create_page_controller.dart';

class ComponentFieldArrayController extends GetxController {
  final ComponentFieldArray component;
  JsonMap contextData;

  ComponentFieldArrayController({
    required this.component,
    required this.contextData,
  });

  final rows = <JsonMap>[].obs;
  final rowKeys = <String>[].obs;

  int _rowKeyCounter = 0;
  bool _notifyScheduled = false;
  StreamSubscription<Map<String, dynamic>>? _referenceDataSubscription;
  String? _lastSyncedSignature;

  String get targetId =>
      (component.referenceId != null && component.referenceId!.isNotEmpty)
          ? component.referenceId!
          : component.id;

  bool get isReadOnly {
    if (component.readOnly || !component.enabled) return true;
    final action = contextData['dataAction'];
    if (action != null && action.toString().endsWith('.view')) return true;
    if (contextData['readOnly'] == true) return true;
    return false;
  }

  bool get canAddRow {
    if (isReadOnly || !component.rowActions.allowAdd) return false;
    final maxRows = component.constraints.maxRows;
    if (maxRows != null && rows.length >= maxRows) return false;
    return true;
  }

  bool get canDeleteRow => !isReadOnly && component.rowActions.allowDelete;

  @override
  void onInit() {
    super.onInit();
    _loadInitialRows();

    final pageCtrl = _findPageController();
    if (pageCtrl != null) {
      final refKey = component.referenceId;
      if (refKey != null && refKey.isNotEmpty) {
        _referenceDataSubscription = pageCtrl.initialData.listen((_) {
          final incoming = pageCtrl.initialData[refKey];
          final incomingSig = _signature(incoming);
          if (incomingSig == _lastSyncedSignature) return;
          final parsed = _tryParseRowList(incoming);
          if (parsed != null) {
            _replaceRows(parsed, emitChange: false);
            _lastSyncedSignature = _signature(rows);
          }
        });
      }
    }
  }

  @override
  void onClose() {
    _referenceDataSubscription?.cancel();
    super.onClose();
  }

  void updateContextData(JsonMap newData) {
    contextData = newData;
    final refKey = component.referenceId;
    if (refKey != null && refKey.isNotEmpty) {
      final incoming = _buildEffectiveContext()[refKey];
      final incomingSig = _signature(incoming);
      if (incomingSig != _lastSyncedSignature) {
        final parsed = _tryParseRowList(incoming);
        if (parsed != null) {
          _replaceRows(parsed, emitChange: false);
          _lastSyncedSignature = _signature(rows);
        }
      }
    }
  }

  CreatePageController? _findPageController() {
    final layoutFormId = (contextData['rootLayoutFormId'] ??
        contextData['layoutFormId']) as String?;
    if (layoutFormId != null) {
      final tag = 'create_page_$layoutFormId';
      if (Get.isRegistered<CreatePageController>(tag: tag)) {
        return Get.find<CreatePageController>(tag: tag);
      }
    }
    if (Get.isRegistered<CreatePageController>()) {
      return Get.find<CreatePageController>();
    }
    return null;
  }

  JsonMap _buildEffectiveContext() {
    final effectiveContext = Map<String, dynamic>.from(contextData);
    final pageCtrl = _findPageController();
    if (pageCtrl != null) {
      effectiveContext.addAll(pageCtrl.initialData);
    }

    final allControllers = (contextData['allControllers'] as Map?)
        ?.cast<String, TextEditingController>();
    if (allControllers != null) {
      final controllerValues = <String, dynamic>{};
      for (final entry in allControllers.entries) {
        controllerValues[entry.key] = entry.value.text;
      }
      effectiveContext.addAll(controllerValues);
      final formMap = effectiveContext['form'];
      if (formMap is Map) {
        effectiveContext['form'] = {
          ...Map<String, dynamic>.from(formMap),
          ...controllerValues,
        };
      } else {
        effectiveContext['form'] = controllerValues;
      }
    }
    return effectiveContext;
  }

  void _loadInitialRows() {
    final effectiveContext = _buildEffectiveContext();

    List<JsonMap>? resolved;

    // 1. Check referenceId / targetId in effective context (e.g. update/view
    //    mode or shared wizard step data).
    if (effectiveContext.containsKey(targetId)) {
      resolved = _tryParseRowList(effectiveContext[targetId]);
    }

    // 2. Fallback to component.initialValue (List, JSON string, or template).
    if (resolved == null && component.initialValue != null) {
      final rawInitial = component.initialValue;
      if (rawInitial is String) {
        final interpolated = rawInitial.contains('{{')
            ? rawInitial.interpolateJavascript(effectiveContext)
            : rawInitial;
        resolved = _tryParseRowList(interpolated);
      } else {
        resolved = _tryParseRowList(rawInitial);
      }
    }

    _replaceRows(resolved ?? const <JsonMap>[], emitChange: true);
  }

  List<JsonMap>? _tryParseRowList(dynamic value) {
    if (value == null) return null;
    if (value is List) {
      return value
          .whereType<Map>()
          .map<JsonMap>((e) => Map<String, dynamic>.from(e))
          .toList();
    }
    if (value is String) {
      final trimmed = value.trim();
      if (trimmed.isEmpty) return null;
      try {
        final decoded = jsonDecode(trimmed);
        if (decoded is List) {
          return decoded
              .whereType<Map>()
              .map<JsonMap>((e) => Map<String, dynamic>.from(e))
              .toList();
        }
      } catch (_) {}
    }
    return null;
  }

  String _nextRowKey() {
    _rowKeyCounter++;
    return '${component.id}_row_$_rowKeyCounter';
  }

  void _replaceRows(List<JsonMap> nextRows, {required bool emitChange}) {
    rows.assignAll(nextRows.map((r) => Map<String, dynamic>.from(r)));
    rowKeys.assignAll(List.generate(nextRows.length, (_) => _nextRowKey()));
    if (emitChange) {
      notifyChanged();
    }
  }

  /// Appends a new row initialized from [ComponentFieldArray.defaultRow]
  /// (with JS interpolation) or empty column keys.
  void addRow() {
    if (!canAddRow) return;
    final effectiveContext = _buildEffectiveContext();
    final newRow = <String, dynamic>{};

    for (final col in component.columns) {
      if (col.body.isNotEmpty) {
        newRow[col.body] = '';
      }
    }

    if (component.defaultRow != null) {
      for (final entry in component.defaultRow!.entries) {
        final val = entry.value;
        if (val is String && val.contains('{{')) {
          try {
            newRow[entry.key] = val.interpolateJavascript(effectiveContext);
          } catch (_) {
            newRow[entry.key] = val;
          }
        } else {
          newRow[entry.key] = val;
        }
      }
    }

    rows.add(newRow);
    rowKeys.add(_nextRowKey());
    notifyChanged();
  }

  /// Removes the row at [index], preserving stable keys for remaining rows.
  void removeRow(int index) {
    if (!canDeleteRow) return;
    if (index < 0 || index >= rows.length) return;
    rows.removeAt(index);
    rowKeys.removeAt(index);
    notifyChanged();
  }

  /// Updates the row at [index] with [newData].
  void onRowChanged(int index, JsonMap newData) {
    if (index < 0 || index >= rows.length) return;
    rows[index] = Map<String, dynamic>.from(newData);
    notifyChanged();
  }

  /// Resolves a cell value using direct key or dot notation.
  dynamic resolveValue(JsonMap row, String path) {
    if (path.isEmpty) return null;
    if (row.containsKey(path)) return row[path];
    final parts = path.split('.');
    dynamic current = row;
    for (final part in parts) {
      if (current is Map && current.containsKey(part)) {
        current = current[part];
      } else {
        return null;
      }
    }
    return current;
  }

  /// Validates collection-level constraints (`min_rows`, `max_rows`, `unique_by`).
  String? validateCollection() {
    final c = component.constraints;
    final labelPrefix =
        component.label.isNotEmpty ? '${component.label}: ' : '';

    if (c.minRows != null && rows.length < c.minRows!) {
      return '${labelPrefix}Minimal ${c.minRows} baris diperlukan';
    }

    if (c.maxRows != null && rows.length > c.maxRows!) {
      return '${labelPrefix}Maksimal ${c.maxRows} baris diperbolehkan';
    }

    if (c.uniqueBy.isNotEmpty && rows.length > 1) {
      final seen = <String>{};
      for (final row in rows) {
        final keyParts = c.uniqueBy
            .map((field) => resolveValue(row, field)?.toString().trim() ?? '')
            .toList(growable: false);
        // Skip uniqueness check if all composite key parts are still empty
        // (required cell validators will handle empty cells).
        if (keyParts.every((p) => p.isEmpty)) continue;
        final composite = keyParts.join('\u001F');
        if (!seen.add(composite)) {
          return '${labelPrefix}Terdapat baris duplikat pada (${c.uniqueBy.join(', ')})';
        }
      }
    }

    return null;
  }

  String _signature(dynamic value) {
    try {
      return jsonEncode(value);
    } catch (_) {
      return value?.toString() ?? '';
    }
  }

  void notifyChanged() {
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      if (!_notifyScheduled) {
        _notifyScheduled = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _notifyScheduled = false;
          if (!isClosed) notifyChanged();
        });
      }
      return;
    }
    if (isClosed) return;

    try {
      final snapshot = rows
          .map<JsonMap>((r) => Map<String, dynamic>.from(r))
          .toList(growable: false);
      final encoded = jsonEncode(snapshot);
      _lastSyncedSignature = encoded;

      final allControllers =
          (contextData['allControllers'] as Map?)?.cast<String, TextEditingController>();
      if (allControllers != null && allControllers.containsKey(targetId)) {
        final ctrl = allControllers[targetId];
        if (ctrl != null && ctrl.text != encoded) {
          ctrl.text = encoded;
        }
      }

      final pageCtrl = _findPageController();
      if (pageCtrl != null) {
        final currentVal = pageCtrl.initialData[targetId];
        if (_signature(currentVal) != encoded) {
          pageCtrl.initialData[targetId] = snapshot;
        }
      }

      final callback = contextData['onFieldArrayChanged'];
      if (callback is Function) {
        callback(snapshot);
      }
    } catch (e) {
      debugPrint('[ComponentFieldArrayController] notifyChanged error: $e');
    }
  }
}
