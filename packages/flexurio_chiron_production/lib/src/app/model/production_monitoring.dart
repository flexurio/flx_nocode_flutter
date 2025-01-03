import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_monitoring.freezed.dart';
part 'production_monitoring.g.dart';

@freezed
class ProductionMonitoring with _$ProductionMonitoring {
  const factory ProductionMonitoring({
    @JsonKey(name: 'batch_no') required String batchNo,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'production_sub_stage_id') required int productionSubStageId,
    @JsonKey(name: 'production_sub_stage_name') required String productionSubStageName,
    @JsonKey(name: 'production_stage_name') required String productionStageName,
    required String ordinal,
    @JsonKey(name: 'machine_id') required int machineId,
    @JsonKey(name: 'machine_name') required String machineName,
    @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
    required DateTime startTime,
    @JsonKey(name: 'end_time', fromJson: isoDateToDateTime)
    required DateTime endTime,
    required String status,
    required String description,
    @JsonKey(name: 'quarantine_date', fromJson: dateTimeNullable)
    DateTime? quarantineDate,
    @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
    DateTime? expiredDate,
    @JsonKey(name: 'release_date', fromJson: dateTimeNullable)
    DateTime? releaseDate,
  }) = _ProductionMonitoring;
  const ProductionMonitoring._();

  factory ProductionMonitoring.fromJson(Map<String, dynamic> json) =>
      _$ProductionMonitoringFromJson(json);
}
