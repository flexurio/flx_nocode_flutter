import 'package:equatable/equatable.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_service_order.freezed.dart';
part 'production_service_order.g.dart';

@freezed
class ProductionServiceOrder extends Equatable with _$ProductionServiceOrder {
  const factory ProductionServiceOrder({
    required String id,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'batch_no') required String batchNo,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'customer', fromJson: Customer.fromJson)
    required Customer customer,
    @JsonKey(name: 'purchase_order_id') required String purchaseOrderId,
    required int quantity,
    @JsonKey(name: 'is_bulk') required bool isBulk,
    @JsonKey(
      name: 'product_status',
      fromJson: ProductionProductStatus.fromString,
    )
    required ProductionProductStatus productStatus,
    @JsonKey(
      name: 'scale',
      fromJson: ProductionProductScale.fromString,
    )
    required ProductionProductScale productScale,
    @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
    required DateTime expirationDate,
    @JsonKey(name: 'is_rework') required bool isRework,
    @JsonKey(name: 'is_cancel') required bool isCancel,
    required String description,
    @JsonKey(name: 'cancel_rework_by_id') required int? cancelReworkById,
    @JsonKey(name: 'cancel_rework_at', fromJson: dateTimeNullable)
    required DateTime? cancelReworkAt,
    @JsonKey(name: 'cancel_rework_reason') required String? cancelReworkReason,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
  }) = _ProductionServiceOrder;
  const ProductionServiceOrder._();

  factory ProductionServiceOrder.empty() => ProductionServiceOrder(
        id: '',
        createdAt: DateTime(0),
        updatedAt: DateTime(0),
        productId: '',
        batchNo: '',
        productName: '',
        customer: Customer.empty(),
        purchaseOrderId: '',
        quantity: 0,
        isBulk: false,
        productStatus: ProductionProductStatus.empty,
        productScale: ProductionProductScale.empty,
        expirationDate: DateTime(0),
        isRework: false,
        isCancel: false,
        description: '',
        cancelReworkById: 0,
        cancelReworkAt: DateTime(0),
        cancelReworkReason: '',
      );

  factory ProductionServiceOrder.fromJson(Map<String, Object?> json) =>
      _$ProductionServiceOrderFromJson(json);

  @override
  List<Object> get props => [id];
}
