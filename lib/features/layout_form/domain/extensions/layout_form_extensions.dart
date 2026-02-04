import 'dart:collection';

import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component.dart';
import 'package:flutter/widgets.dart';

extension LayoutFormDomainX on LayoutForm {
  bool get isHome => id.toLowerCase().trim() == 'home';
  bool get isView =>
      id.toLowerCase().trim().startsWith('view') ||
      id.toLowerCase().trim().startsWith('detail');
  bool get isCreate =>
      id.toLowerCase().trim().startsWith('create') ||
      id.toLowerCase().trim().startsWith('add');
  bool get isUpdate =>
      id.toLowerCase().trim().startsWith('update') ||
      id.toLowerCase().trim().startsWith('edit');

  /// Returns (usedFields, availableFields) with unique, ordered entries.
  (List<String> usedFields, List<String> availableFields) getFieldByStatus(
    List<EntityField> fields,
  ) {
    final used = LinkedHashSet<String>();
    for (final c in components) {
      _collectFields(c, used);
    }

    final available = <String>[];
    for (final f in fields) {
      if (!used.contains(f.reference)) {
        available.add(f.reference);
      }
    }
    return (used.toList(growable: false), List.unmodifiable(available));
  }

  /// Convenience: all unique field references used in this form.
  List<String> allFields() {
    final s = LinkedHashSet<String>();
    for (final c in components) {
      _collectFields(c, s);
    }
    return List.unmodifiable(s);
  }

  void _collectFields(Component c, Set<String> fields) {
    // For field-like components, the ID is the field reference
    if (c is ComponentTextField ||
        c is ComponentNumberField ||
        c is ComponentDatePicker ||
        c is ComponentCheckbox ||
        c is ComponentDropdown ||
        c is ComponentRadio ||
        c is ComponentSwitch ||
        c is ComponentFieldDisplay) {
      fields.add(c.id);
    }

    // Recurse into containers
    if (c is ComponentColumn) {
      for (final child in c.children) {
        _collectFields(child, fields);
      }
    } else if (c is ComponentRow) {
      for (final child in c.children) {
        _collectFields(child, fields);
      }
    } else if (c is ComponentContainer) {
      if (c.child != null) {
        _collectFields(c.child!, fields);
      }
    }
  }

  /// Validate invariants that aren’t covered by asserts (safe for release mode).
  void validate() {
    // 1) Require unique component IDs
    final seen = <String>{};
    for (final c in components) {
      _validateComponent(c, seen);
    }
  }

  void _validateComponent(Component c, Set<String> seen) {
    final id = c.id.trim();
    if (id.isEmpty) {
      throw const FormatException('Each component must have a non-empty "id".');
    }
    if (!seen.add(id)) {
      throw FormatException('Duplicate component id "$id" detected.');
    }

    if (c is ComponentColumn) {
      for (final child in c.children) {
        _validateComponent(child, seen);
      }
    } else if (c is ComponentRow) {
      for (final child in c.children) {
        _validateComponent(child, seen);
      }
    } else if (c is ComponentContainer) {
      if (c.child != null) {
        _validateComponent(c.child!, seen);
      }
    }
  }

  /// Evaluates visibility for this form against a given form state.
  /// If `visibleIf` is null => visible by default.
  bool isVisible(Map<String, dynamic> formState) {
    return visibleIf?.evaluate(formState) ?? true;
  }

  Widget renderComponent({
    required BuildContext context,
    required Component component,
    required Map<String, dynamic> data,
    required Map<String, TextEditingController> controllers,
    required List<Map<String, dynamic>> parentData,
    required DataAction dataAction,
  }) {
    return component.toWidget(
      data: data,
      controllers: controllers,
      parentData: parentData,
      dataAction: dataAction,
    );
  }

  DataAction get action {
    if (isHome) return DataAction.create;
    if (isUpdate) return DataAction.update;
    if (isView) return DataAction.view;
    if (isCreate) return DataAction.create;
    return DataAction.none;
  }
}
