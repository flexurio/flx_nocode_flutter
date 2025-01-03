import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_man_hour_production.freezed.dart';
part 'report_man_hour_production.g.dart';

@freezed
class ReportManHourProduction with _$ReportManHourProduction {
  factory ReportManHourProduction({
    @JsonKey(name: 'period') required String period,
    @JsonKey(name: 'product_id') required String productID,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'batch_no') required String batchNo,
    @JsonKey(name: 'man_hour') required int? manHour,
    @JsonKey(name: 'man_hour_weighing') required int? manHourWeight,
    @JsonKey(name: 'man_hour_production') required int? manHourProduction,
    @JsonKey(name: 'man_hour_packing') required int? manHourPacking,
    @JsonKey(name: 'standart') required int? standart,
    @JsonKey(name: 'achievement') required int? achievement,
  }) = _ReportManHourProduction;

  factory ReportManHourProduction.fromJson(Map<String, dynamic> json) => _$ReportManHourProductionFromJson(json);
  const ReportManHourProduction._();

  factory ReportManHourProduction.empty() {
    final reportManHourProduction = ReportManHourProduction(
      period: '', 
      productID: '', 
      productName: '',
      batchNo: '', 
      manHour: 0, 
      manHourWeight: 0, 
      manHourProduction: 0, 
      manHourPacking: 0, 
      standart: 0,
      achievement: 0,
    );
    return reportManHourProduction;
  }
}