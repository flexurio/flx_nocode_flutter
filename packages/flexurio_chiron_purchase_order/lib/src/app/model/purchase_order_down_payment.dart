import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_down_payment.freezed.dart';
part 'purchase_order_down_payment.g.dart';

@freezed
class PurchaseOrderDownPayment with _$PurchaseOrderDownPayment {
  const factory PurchaseOrderDownPayment({
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'purchase_order_id') required String purchaseOrderId,
    required double amount,
    @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
    required DateTime dueDate,
    @JsonKey(name: 'is_used') required bool isUsed,
    @JsonKey(name: 'dp_usage') required int dpUsage,
    @JsonKey(name: 'dp_remaining', defaultValue: 0) required int dpRemaining,
  }) = _PurchaseOrderDownPayment;
  const PurchaseOrderDownPayment._();

  factory PurchaseOrderDownPayment.fromJson(Map<String, dynamic> json) =>
      _$PurchaseOrderDownPaymentFromJson(json);

  factory PurchaseOrderDownPayment.empty() => PurchaseOrderDownPayment(
        createdAt: DateTime(0),
        updatedAt: DateTime(0),
        createdById: 0,
        updatedById: 0,
        id: '',
        purchaseOrderId: '',
        amount: 0,
        dueDate: DateTime(0),
        isUsed: false,
        dpUsage: 0,
        dpRemaining: 0,
      );
}
