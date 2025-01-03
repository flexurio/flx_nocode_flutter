import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_production/src/app/model/production_order.dart';
import 'package:flexurio_chiron_production/src/app/model/production_stage_process.dart';
import 'package:flexurio_chiron_production/src/app/model/work_hour_shift.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

enum WorkHourType implements ColorType {
  empty('', '', Colors.transparent),
  regular('Regular', 'REGULAR', Colors.green),
  overtime('Overtime', 'OVERTIME', Colors.blue);

  const WorkHourType(this.label, this.id, this.color);

  final String id;

  @override
  final String label;

  @override
  final Color color;

  static List<WorkHourType> get list => [
        WorkHourType.regular,
        WorkHourType.overtime,
      ];

  static WorkHourType fromString(String id) {
    if (id == WorkHourType.empty.id) {
      return WorkHourType.empty;
    }
    if (id == WorkHourType.regular.id) {
      return WorkHourType.regular;
    }
    if (id == WorkHourType.overtime.id) {
      return WorkHourType.overtime;
    }
    throw ArgumentError();
  }
}

@freezed
class Schedule with _$Schedule {
  factory Schedule(
    int id,
    @JsonKey(name: 'quantity_man') int quantityMan,
    @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
    DateTime startTime,
    @JsonKey(name: 'end_time', fromJson: isoDateToDateTime) DateTime endTime,
    @JsonKey(name: 'actual_start_time', fromJson: isoDateToDateTime)
    DateTime actualStartTime,
    @JsonKey(name: 'actual_end_time', fromJson: isoDateToDateTime)
    DateTime actualEndTime,
    @JsonKey(name: 'yield') double yield,
    @JsonKey(name: 'over_time') int overTime,
    @JsonKey(name: 'notes') String notes,
    @JsonKey(name: 'work_hour_type', fromJson: WorkHourType.fromString)
    WorkHourType workHourType,
    @JsonKey(name: 'is_close', defaultValue: false) bool isClose,
    @JsonKey(name: 'is_toll', defaultValue: false) bool isToll,
    @JsonKey(
      name: 'production_order',
      fromJson: ProductionOrder.fromJson,
    )
    ProductionOrder productionOrder,
    @JsonKey(
      name: 'product',
      fromJson: Product.fromJson,
    )
    Product product,
    @JsonKey(
      name: 'work_hour_shift',
      fromJson: WorkHourShift.fromJson,
    )
    WorkHourShift workHourShift,
    @JsonKey(
      name: 'production_stage_process',
      fromJson: ProductionStageProcess.fromJson,
    )
    ProductionStageProcess productionStageProcess,
    @JsonKey(
      name: 'unit',
      fromJson: MaterialUnit.fromJson,
    )
    MaterialUnit materialUnit,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
  ) = _Schedule;
  const Schedule._();

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}
