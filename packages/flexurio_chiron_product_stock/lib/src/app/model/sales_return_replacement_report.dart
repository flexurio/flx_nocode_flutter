import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_return_replacement_report.freezed.dart';
part 'sales_return_replacement_report.g.dart';

@freezed
class SalesReturnReplacementReport with _$SalesReturnReplacementReport {
  factory SalesReturnReplacementReport({
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) required DateTime updatedAt,
    @JsonKey(name: 'batch_no') required String batchNo,
    @JsonKey(name: 'quantity') required int quantity,
    required String description,
    @JsonKey(name: 'delivery_order_id') required String deliveryOrderId,
    @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime) required DateTime deliveryOrderDate,
    @JsonKey(name: 'product_issue_date', fromJson: isoDateToDateTime) required DateTime productIssueDate,
    @JsonKey(name: 'unit_id') required String unitId,
    @JsonKey(name: 'product_price') required int productPrice,
    @JsonKey(name: 'total_product_price') required int totalProductPrice,
    @JsonKey(name: 'product_issue_quantity') required int productIssueQuantity,
    @JsonKey(name: 'product_issue_product_price') required int productIssueProductPrice,
    @JsonKey(name: 'product_issue_total_product_price') required int productIssueTotalProductPrice,
    @JsonKey(name: 'product_id', fromJson: Product.fromJson) required Product product,
    @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson) required ProductReturn productReturn,
  }) = _SalesReturnReplacementReport;

  factory SalesReturnReplacementReport.fromJson(Map<String, dynamic> json) => _$SalesReturnReplacementReportFromJson(json);

  const SalesReturnReplacementReport._();

  factory SalesReturnReplacementReport.empty() {
    final productReturnReceiveReport = SalesReturnReplacementReport(
      createdAt: DateTime(0), 
      updatedAt: DateTime(0), 
      batchNo: '', 
      quantity: 0, 
      description: '', 
      deliveryOrderId: '', 
      deliveryOrderDate: DateTime(0), 
      productIssueDate: DateTime(0), 
      unitId: '', 
      productPrice: 0, 
      totalProductPrice: 0, 
      productIssueQuantity: 0, 
      productIssueProductPrice: 0, 
      productIssueTotalProductPrice: 0, 
      product: Product.empty(),
      productReturn: ProductReturn.empty(),
    );
    return productReturnReceiveReport;
  }
}
