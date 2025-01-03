import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_receive_report.freezed.dart';
part 'product_return_receive_report.g.dart';

@freezed
class ProductReturnReceiveReport with _$ProductReturnReceiveReport {
  factory ProductReturnReceiveReport({
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) required DateTime updatedAt,
    @JsonKey(name: 'product_price') required int productPrice,
    @JsonKey(name: 'batch_no') required String batchNo,
    required int quantity,
    @JsonKey(name: 'quantity_remaining') required int quantityRemaining,
    @JsonKey(name: 'quantity_check') required int quantityCheck,
    @JsonKey(name: 'total_product_price') required int totalProductPrice,
    @JsonKey(name: 'check_qc_by_id') required int checkQcById, 
    @JsonKey(name: 'repack_at', fromJson: dateTimeNullable) DateTime? repackAt, 
    @JsonKey(name: 'repack_by_id') required int repackById, 
    required String status, 
    @JsonKey(name: 'quantity_quality_assurance_check') required int quantityQualityAssuranceCheck, 
    required String description, 
    @JsonKey(name: 'quality_assurance_check_by_id') required int qualityAssuranceCheckById, 
    @JsonKey(name: 'quality_assurance_check_date', fromJson: isoDateToDateTime) 
    required DateTime qualityAssuranceCheckDate, 
    @JsonKey(name: 'quantity_warehouse_return') 
    required int quantityWarehouseReturn, 
    @JsonKey(name: 'quantity_warehouse_remaining') 
    required int quantityWarehouseRemaining, 
    @JsonKey(name: 'quantity_out_return') required int quantityOutReturn,
    @JsonKey(name: 'quantity_out_remaining') required int quantityOutRemaining, 
    @JsonKey(name: 'unit_id') required String unitId, 
    @JsonKey(name: 'delivery_order_id') required String deliveryOrderId,
    @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson) required ProductReturn productReturn, 
    @JsonKey(name: 'product_id', fromJson: Product.fromJson) required Product productId, 
    @JsonKey(name: 'expiration_date', fromJson: dateTimeNullable) DateTime? expirationDate,
    @JsonKey(name: 'check_qc_at', fromJson: dateTimeNullable) DateTime? checkQcAt,
    @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullable) DateTime? deliveryOrderDate,
  }) = _ProductReturnReceiveReport;

  factory ProductReturnReceiveReport.fromJson(Map<String, dynamic> json) => _$ProductReturnReceiveReportFromJson(json);
  const ProductReturnReceiveReport._();

  factory ProductReturnReceiveReport.empty() {
    final productReturnReceiveReport = ProductReturnReceiveReport(
      createdAt: DateTime(0), 
      updatedAt: DateTime(0), 
      productPrice: 0, 
      batchNo: '', 
      quantity: 0, 
      quantityRemaining: 0, 
      quantityCheck: 0, 
      totalProductPrice: 0, 
      checkQcById: 0,
      repackById: 0, 
      status: '', 
      quantityQualityAssuranceCheck: 0, 
      description: '', 
      qualityAssuranceCheckById: 0, 
      qualityAssuranceCheckDate: DateTime(0),
      quantityWarehouseReturn: 0, 
      quantityWarehouseRemaining: 0, 
      quantityOutReturn: 0,
      quantityOutRemaining: 0, 
      unitId: '', 
      deliveryOrderId: '', 
      productReturn: ProductReturn.empty(), 
      productId: Product.empty(),
    );
    return productReturnReceiveReport;
  }
}
