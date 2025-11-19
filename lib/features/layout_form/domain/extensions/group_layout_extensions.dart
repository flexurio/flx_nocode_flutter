import 'package:flx_nocode_flutter/features/entity/models/group_layout.dart';

extension GroupLayoutDomainX on GroupLayout {
  /// Collect all field references used in this group (unique, ordered).
  List<String> usedFields() {
    final seen = <String>{};
    for (final row in rows) {
      for (final f in row.fields) {
        if (seen.add(f)) {
          // no-op, hanya untuk menjaga urutan
        }
      }
    }
    return List.unmodifiable(seen);
  }

  /// Evaluate group visibility (default true when no rule).
  bool isVisible(Map<String, dynamic> formState) =>
      visibleIf?.evaluate(formState) ?? true;
}

extension RowLayoutDomainX on RowLayout {
  /// Evaluate row visibility (default true when no rule).
  bool isVisible(Map<String, dynamic> formState) =>
      visibleIf?.evaluate(formState) ?? true;
}
