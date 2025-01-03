import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'work_hour_shift.freezed.dart';
part 'work_hour_shift.g.dart';

@freezed
class WorkHourShift with _$WorkHourShift {
  const factory WorkHourShift(
    int id,
    @JsonKey(name: 'start_period', fromJson: isoDateToDateTime)
    DateTime periodStart,
    @JsonKey(name: 'end_period', fromJson: isoDateToDateTime)
    DateTime periodEnd,
    String name,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
  ) = _WorkHourShift;
  const WorkHourShift._();

  factory WorkHourShift.empty() {
    return WorkHourShift(
      0,
      DateTime(0),
      DateTime(0),
      '',
      DateTime(0),
      DateTime(0),
    );
  }

  factory WorkHourShift.fromJson(Map<String, Object?> json) => _$WorkHourShiftFromJson(json);
}
