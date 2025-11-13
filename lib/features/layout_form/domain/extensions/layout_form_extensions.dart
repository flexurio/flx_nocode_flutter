import 'dart:collection';

import 'package:flx_nocode_flutter/features/entity/models/group_layout.dart';
import 'package:flx_nocode_flutter/features/entity/models/rule.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

enum FormType {
  home,
  view,
  create,
  update;

  factory FormType.fromString(String? s) {
    if (s == null) return FormType.create;
    try {
      return FormType.values.byName(s);
    } catch (_) {
      throw ArgumentError('Invalid FormType: $s');
    }
  }
}

extension FormTypeExtension on FormType {
  bool get isHome => this == FormType.home;
}

extension LayoutFormDomainX on LayoutForm {
  FormType get formType => FormType.fromString(type);

  /// Returns (usedFields, availableFields) with unique, ordered entries.
  (List<String> usedFields, List<String> availableFields) getFieldByStatus(
    List<EntityField> fields,
  ) {
    final used = LinkedHashSet<String>();
    for (final g in groups) {
      used.addAll(g.usedFields());
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
    for (final g in groups) {
      s.addAll(g.usedFields());
    }
    return List.unmodifiable(s);
  }

  /// Validate invariants that aren’t covered by asserts (safe for release mode).
  void validate() {
    // 1) Require unique group IDs (if provided)
    final seen = <String>{};
    for (final g in groups) {
      final id = g.id.trim();
      if (id.isEmpty) {
        throw const FormatException('Each group must have a non-empty "id".');
      }
      if (!seen.add(id)) {
        throw FormatException('Duplicate group id "$id" detected.');
      }
    }

    // 2) Verify supported type values
    final allowed = {'create', 'update', 'view', 'home'};
    if (!allowed.contains(type)) {
      throw FormatException(
        'Invalid "type": "$type". Allowed: ${allowed.join(", ")}',
      );
    }
  }

  /// Evaluates visibility for this form against a given form state.
  /// If `visibleIf` is null => visible by default.
  bool isVisible(Map<String, dynamic> formState) {
    return visibleIf?.evaluate(formState) ?? true;
  }
}
