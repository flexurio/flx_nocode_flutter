import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_detail.freezed.dart';
part 'schedule_detail.g.dart';

enum ScheduleDetailStatus implements ColorType {
  empty('', '', Colors.transparent),
  start('START', 'START', Colors.green),
  pending('PENDING', 'PENDING', Colors.blue),
  finish('FINISH', 'FINISH', Colors.blueGrey);

  const ScheduleDetailStatus(this.label, this.id, this.color);

  final String id;

  @override
  final String label;

  @override
  final Color color;

  static List<ScheduleDetailStatus> get list => [
        ScheduleDetailStatus.start,
        ScheduleDetailStatus.pending,
        ScheduleDetailStatus.finish,
      ];

  static ScheduleDetailStatus fromString(String id) {
    if (id == ScheduleDetailStatus.start.id) {
      return ScheduleDetailStatus.start;
    }
    if (id == ScheduleDetailStatus.pending.id) {
      return ScheduleDetailStatus.pending;
    }
    if (id == ScheduleDetailStatus.finish.id) {
      return ScheduleDetailStatus.finish;
    }
    return ScheduleDetailStatus.empty;
  }
}

@freezed
class ScheduleDetail with _$ScheduleDetail {
  factory ScheduleDetail(
    int id,
    String remarks,
    int cycle,
    @JsonKey(name: 'status', fromJson: ScheduleDetailStatus.fromString)
    ScheduleDetailStatus status,
    @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
    DateTime startTime,
    @JsonKey(name: 'end_time', fromJson: isoDateToDateTime) DateTime endTime,
    @JsonKey(name: 'is_valid', defaultValue: false) bool isValid,
    @JsonKey(name: 'pic_id') int picId,
    @JsonKey(name: 'schedule_header') int scheduleId,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
  ) = _ScheduleDetail;
  const ScheduleDetail._();

  factory ScheduleDetail.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDetailFromJson(json);

  factory ScheduleDetail.empty() => ScheduleDetail(
        0,
        '',
        0,
        ScheduleDetailStatus.empty,
        DateTime(0),
        DateTime(0),
        false,
        0,
        0,
        DateTime(0),
        DateTime(0),
      );
}
