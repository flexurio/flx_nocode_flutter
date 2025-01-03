import 'package:freezed_annotation/freezed_annotation.dart';

part 'aging_schedule_ap.freezed.dart';
part 'aging_schedule_ap.g.dart';

@freezed
class AgingScheduleAP with _$AgingScheduleAP {
  const factory AgingScheduleAP({
    @JsonKey(name: 'supplier_name') required String supplierName,
    @JsonKey(name: 'remaining_debt_all') required int remainingDebtAll,
    @JsonKey(name: 'remaining_debt15') required int remainingDebt15,
    @JsonKey(name: 'remaining_debt30') required int remainingDebt30,
    @JsonKey(name: 'remaining_debt45') required int remainingDebt45,
    @JsonKey(name: 'remaining_debt60') required int remainingDebt60,
    @JsonKey(name: 'remaining_debt60_past') required int remainingDebt60Past,
    @JsonKey(name: 'remaining_debt_all_summary') required int remainingDebtAllSummary,
    @JsonKey(name: 'remaining_debt15_summary') required int remainingDebt15Summary,
    @JsonKey(name: 'remaining_debt30_summary') required int remainingDebt30Summary,
    @JsonKey(name: 'remaining_debt45_summary') required int remainingDebt45Summary,
    @JsonKey(name: 'remaining_debt60_summary') required int remainingDebt60Summary,
    @JsonKey(name: 'remaining_debt60_past_summary') required int remainingDebt60PastSummary,
    @JsonKey(name: 'remaining_debt_all_percent') required int remainingDebtAllPercent,
    @JsonKey(name: 'remaining_debt15_percent') required int remainingDebt15Percent,
    @JsonKey(name: 'remaining_debt30_percent') required int remainingDebt30Percent,
    @JsonKey(name: 'remaining_debt45_percent') required int remainingDebt45Percent,
    @JsonKey(name: 'remaining_debt60_percent') required int remainingDebt60Percent,
    @JsonKey(name: 'remaining_debt60_past_percent') required int remainingDebt60PastPercent,
    
  }) = _AgingScheduleAP;
  const AgingScheduleAP._();

  factory AgingScheduleAP.empty() => AgingScheduleAP(
    supplierName: '', 
    remainingDebtAll: 0, 
    remainingDebt15: 0, 
    remainingDebt30: 0, 
    remainingDebt45: 0,
    remainingDebt60: 0, 
    remainingDebt60Past: 0, 
    remainingDebtAllSummary: 0, 
    remainingDebt15Summary: 0, 
    remainingDebt30Summary: 0, 
    remainingDebt45Summary: 0, 
    remainingDebt60Summary: 0, 
    remainingDebt60PastSummary: 0, 
    remainingDebtAllPercent: 0, 
    remainingDebt15Percent: 0, 
    remainingDebt30Percent: 0, 
    remainingDebt45Percent: 0, 
    remainingDebt60Percent: 0, 
    remainingDebt60PastPercent: 0,
  );
  factory AgingScheduleAP.fromJson(Map<String, dynamic> json) => _$AgingScheduleAPFromJson(json);
}
