import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal_estimation.freezed.dart';
part 'journal_estimation.g.dart';

enum JournalEstimationType implements ColorType {
  empty('', '', Colors.transparent),
  journal('JURNAL', 'JURNAL', Colors.green),
  umum('UMUM', 'UMUM', Colors.indigo),
  hpp('HPP', 'HPP', Colors.deepOrangeAccent);

  const JournalEstimationType(this.id, this.label, this.color);

  final String id;

  @override
  final String label;

  @override
  final Color color;

  static List<JournalEstimationType> get list => [
        JournalEstimationType.journal,
        JournalEstimationType.umum,
        JournalEstimationType.hpp,
      ];

  static JournalEstimationType fromString(String id) {
    if (id == JournalEstimationType.journal.id) {
      return JournalEstimationType.journal;
    }
    if (id == JournalEstimationType.hpp.id) {
      return JournalEstimationType.hpp;
    }
    if (id == JournalEstimationType.umum.id) {
      return JournalEstimationType.umum;
    }
    return JournalEstimationType.empty;
  }
}

@freezed
class JournalEstimation with _$JournalEstimation {
  factory JournalEstimation({
    required String id,
    required String name,
    @JsonKey(name: 'type', fromJson: JournalEstimationType.fromString)
    required JournalEstimationType type,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int upudatedById,
  }) = _JournalEstimation;
  const JournalEstimation._();

  factory JournalEstimation.fromJson(Map<String, dynamic> json) =>
      _$JournalEstimationFromJson(json);
}
