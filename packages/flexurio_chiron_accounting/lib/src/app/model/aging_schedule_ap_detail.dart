import 'package:freezed_annotation/freezed_annotation.dart';

part 'aging_schedule_ap_detail.freezed.dart';
part 'aging_schedule_ap_detail.g.dart';

@freezed
class AgingScheduleAPDetail with _$AgingScheduleAPDetail {
  const factory AgingScheduleAPDetail({
    @JsonKey(name: 'supplier_name') required String supplierName,
    @JsonKey(name: 'transaction_no') required String transactionNo,
    @JsonKey(name: 'remaining_debt_all') required int remainingDebtAll,
    @JsonKey(name: 'remaining_debt15') required int remainingDebt15,
    @JsonKey(name: 'remaining_debt30') required int remainingDebt30,
    @JsonKey(name: 'remaining_debt45') required int remainingDebt45,
    @JsonKey(name: 'remaining_debt60') required int remainingDebt60,
    @JsonKey(name: 'remaining_debt60_past') required int remainingDebt60_past,
  }) = _AgingScheduleAPDetail;
  const AgingScheduleAPDetail._();

  factory AgingScheduleAPDetail.empty() => AgingScheduleAPDetail(
    supplierName: '', 
    transactionNo: '', 
    remainingDebtAll: 0,
    remainingDebt15: 0,
    remainingDebt30: 0, 
    remainingDebt45: 0, 
    remainingDebt60: 0, 
    remainingDebt60_past: 0,
  );
  factory AgingScheduleAPDetail.fromJson(Map<String, dynamic> json) => _$AgingScheduleAPDetailFromJson(json);
}
