import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_receive_recap.freezed.dart';
part 'product_receive_recap.g.dart';

@freezed
class ProductReceiveRecap with _$ProductReceiveRecap {
  factory ProductReceiveRecap({
    required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    @JsonKey(name: 'barcode_no') required String barcodeNo,
    @JsonKey(name: 'barcode_origin_no') required String barcodeOriginNo,
    @JsonKey(name: 'barcode_result_no') required String barcodeResultNo,
    @JsonKey(name: 'vat_no') required int vatNo,
    @JsonKey(name: 'vat_total') required int vatTotal,
    required int qty,
    required String na,
    @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime) required DateTime expiredDate,
    required String status, required int price, @JsonKey(name: 'total_price') required int totalPrice, required String warehouse, @JsonKey(name: 'is_document_complete') required bool isDocumentComplete, @JsonKey(name: 'release_at', fromJson: isoDateToDateTime) required DateTime releaseAt, @JsonKey(name: 'release_by_id') required int releaseById, @JsonKey(name: 'is_partial') required bool isPartial, @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) required MaterialUnit unit, @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson) required ProductionOrder batchNo, @JsonKey(name: 'product', fromJson: Product.fromJson) required Product product, @JsonKey(name: 'product_received', fromJson: ProductReceive.fromJson) required ProductReceive productReceive, @JsonKey(name: 'is_doc_acc') bool? isDocAcc,
    @JsonKey(name: 'doc_acc_date', fromJson: dateTimeNullableFromJson) DateTime? docAccDate,
    @JsonKey(name: 'is_document_complete_at', fromJson: dateTimeNullableFromJson) DateTime? isDocumentCompleteAt,
    @JsonKey(name: 'is_document_complete_by_id') int? isDocumentCompleteById,
    @JsonKey(name: 'reject_at', fromJson: dateTimeNullableFromJson) DateTime? rejectAt,
    @JsonKey(name: 'reject_by_id') int? rejectById,
    @JsonKey(name: 'reject_reason') String? rejectReason,
  }) = _ProductReceiveRecap;

  factory ProductReceiveRecap.fromJson(Map<String, dynamic> json) => _$ProductReceiveRecapFromJson(json);
  const ProductReceiveRecap._();

  factory ProductReceiveRecap.empty() {
    final productReturnReceiveReport = ProductReceiveRecap(
      id: 0, 
      createdAt: DateTime(0), 
      createdById: 0, 
      updatedAt: DateTime(0), 
      updatedById: 0, 
      barcodeNo: '', 
      barcodeOriginNo: '', 
      barcodeResultNo: '', 
      vatNo: 0, 
      vatTotal: 0, 
      qty: 0, 
      na: '', 
      expiredDate: DateTime(0), 
      status: '', 
      price: 0, 
      totalPrice: 0, 
      warehouse: '', 
      isDocumentComplete: false, 
      isDocumentCompleteAt: DateTime(0), 
      releaseAt: DateTime(0), 
      releaseById: 0, 
      isPartial: false, 
      productReceive: ProductReceive.empty(),
      unit: MaterialUnit.empty(), 
      batchNo: ProductionOrder.empty(), 
      product: Product.empty(),
    );
    return productReturnReceiveReport;
  }
}
