import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_reject.freezed.dart';
part 'purchase_order_reject.g.dart';

@freezed
class PurchaseOrderReject with _$PurchaseOrderReject {
  const factory PurchaseOrderReject({
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'material_request_old') required String materialRequestOld,
    @JsonKey(name: 'purchase_order_old') required String purchaseOrderOld,
    @JsonKey(name: 'purchase_order_new') required String purchaseOrderNew,
    @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
    required DateTime dateOfNeed,
    @JsonKey(name: 'material_name') required String materialName,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'qty') required double quantity,
    @JsonKey(name: 'price') required double price,
  }) = _PurchaseOrderReject;

  factory PurchaseOrderReject.fromJson(Map<String, dynamic> json) =>
      _$PurchaseOrderRejectFromJson(json);
}
