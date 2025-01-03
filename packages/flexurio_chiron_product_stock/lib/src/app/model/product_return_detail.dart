import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_check.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_detail.freezed.dart';
part 'product_return_detail.g.dart';

@freezed
class ProductReturnDetail with _$ProductReturnDetail {
  factory ProductReturnDetail({
    required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
    required ProductReturn productReturn,
    @JsonKey(name: 'product_id', fromJson: Product.fromJson)
    required Product product,
    @JsonKey(name: 'delivery_order_id') required String deliveryOrderId,
    @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
    required ProductionOrder batchNo,
    @JsonKey(name: 'unit_id', fromJson: MaterialUnit.fromJson)
    required MaterialUnit unit,
    @JsonKey(name: 'product_price') required double productPrice,
    @JsonKey(name: 'quantity') required int quantity,
    @JsonKey(name: 'quantity_remaining') required int quantityRemaining,
    @JsonKey(name: 'quantity_check') required int quantityCheck,
    @JsonKey(name: 'total_product_price') required double totalProductPrice,
    @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
    required DateTime expirationDate,
    @JsonKey(name: 'check_qc_at', fromJson: isoDateToDateTime)
    required DateTime checkQcAt,
    @JsonKey(name: 'check_qc_by_id') required int checkQcById,
    @JsonKey(name: 'quantity_return_note', defaultValue: 0)
    required int quantityReturnNote,
  }) = _ProductReturnDetail;

  int get quantityReturn => quantity - quantityReturnNote;

  const ProductReturnDetail._();

  factory ProductReturnDetail.empty() {
    return ProductReturnDetail(
      id: 0,
      createAt: DateTime(0),
      updatedAt: DateTime(0),
      productReturn: ProductReturn.empty(),
      product: Product.empty(),
      deliveryOrderId: '',
      batchNo: ProductionOrder.empty(),
      unit: MaterialUnit.empty(),
      productPrice: 0,
      quantity: 0,
      quantityReturnNote: 0,
      quantityRemaining: 0,
      quantityCheck: 0,
      totalProductPrice: 0,
      expirationDate: DateTime(0),
      checkQcAt: DateTime(0),
      checkQcById: 0,
    );
  }

  factory ProductReturnDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductReturnDetailFromJson(json);

  ProductReturnCheck toProductReturnCheck() {
    return ProductReturnCheck(
        id: id,
        createdAt: createAt,
        updatedAt: updatedAt,
        description: '',
        qtyWarehouseReturn: 0,
        qtyWarehouseRemaining: 0,
        qtyOutReturn: 0,
        qtyOutRemaining: 0,
        qualityCheckById: 0,
        qualityCheckDate: DateTime(0),
        status: ProductReturnCheckStatus.empty,
        productReturnId: productReturn,
        productId: product,
        batch: batchNo,
        unitId: unit,
        quantity: quantity);
  }
}
