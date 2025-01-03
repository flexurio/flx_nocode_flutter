import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_completed_petty_cash.freezed.dart';
part 'report_completed_petty_cash.g.dart';

@freezed
class ReportCompletedPettyCash with _$ReportCompletedPettyCash {
  const factory ReportCompletedPettyCash({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'department_id') required String? departmentId,
    @JsonKey(name: 'supplier_id') required String? supplierId,
    @JsonKey(name: 'realization_no', defaultValue: '') required String realizationNo,
    @JsonKey(name: 'purchase_order_id') required String purchaseOrderId,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'amount') required int amount,
    @JsonKey(name: 'price') required int price,
    @JsonKey(name: 'ppn') required int ppn,
    @JsonKey(name: 'pph') required int pph,
  }) = _ReportCompletedPettyCash;
  const ReportCompletedPettyCash._();

  factory ReportCompletedPettyCash.fromJson(Map<String, dynamic> json) =>
      _$ReportCompletedPettyCashFromJson(json);

  factory ReportCompletedPettyCash.empty() => ReportCompletedPettyCash(
        id: '',
        createdAt: DateTime(0),
        departmentId: '',
        supplierId: '',
        realizationNo: '',
        purchaseOrderId: '',
        description: '',
        status: '',
        amount: 0,
        price: 0,
        ppn: 0,
        pph: 0,
      );
}
