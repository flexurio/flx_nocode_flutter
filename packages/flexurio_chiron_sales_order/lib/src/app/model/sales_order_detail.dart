import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sales_order_detail.freezed.dart';
part 'sales_order_detail.g.dart';

@freezed
class SalesOrderDetail with _$SalesOrderDetail {
  const factory SalesOrderDetail({
    required int id,
    @JsonKey(name: 'qty') required int quantity,
    required double? price,
    required double? subtotal,
    @JsonKey(name: 'discount_value') required double discountValue,
    @JsonKey(name: 'discount_percent') required double discountPercent,
    @JsonKey(name: 'qty_delivery') required int qtyDelivery,
    required String warehouse,
    @JsonKey(name: 'sales_order_id') required String salesOrderId,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'batch_no_id') required String batchNoId,
    @JsonKey(name: 'unit_id') required String unitId,
    @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
    required ProductionOrder batchNo,
    @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
    required MaterialUnit unit,
    @JsonKey(name: 'is_history', defaultValue: '') String? isHistory,
    @JsonKey(fromJson: Product.fromJson) Product? product,
    @JsonKey(name: 'price_after_discount', defaultValue: 0)
    required double priceAfterDiscount,
  }) = _SalesOrderDetail;
  const SalesOrderDetail._();

  factory SalesOrderDetail.fromJson(Map<String, Object?> json) =>
      _$SalesOrderDetailFromJson(json);

  factory SalesOrderDetail.empty() => SalesOrderDetail(
        id: 0,
        discountValue: 0,
        quantity: 0,
        price: 0,
        subtotal: 0,
        discountPercent: 0,
        priceAfterDiscount: 0,
        qtyDelivery: 0,
        warehouse: '',
        salesOrderId: '',
        productId: '',
        batchNoId: '',
        unitId: '',
        isHistory: '',
        product: Product.empty(),
        batchNo: ProductionOrder.empty(),
        unit: MaterialUnit.empty(),
      );
}

class SalesOrderDetailInitial {
  SalesOrderDetailInitial({
    this.id,
    this.qty,
    this.price,
    this.subtotal,
    this.discountPercent,
    this.qtyDelivery,
    this.warehouse,
    this.salesOrderId,
    this.productId,
    this.batchNoId,
    this.unitId,
    this.product,
  });

  final int? id;
  final int? qty;
  final double? price;
  final double? subtotal;
  final double? discountPercent;
  final int? qtyDelivery;
  final String? warehouse;
  final String? salesOrderId;
  final String? productId;
  final String? batchNoId;
  final String? unitId;
  final Product? product;
}
