import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_stock_card_batch.freezed.dart';
part 'product_stock_card_batch.g.dart';

@freezed
class ProductStockCardBatch with _$ProductStockCardBatch {
  const factory ProductStockCardBatch({
    @JsonKey(name: 'transaction_id') required String transactionId,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'batch_no') required String batchNo,
    @JsonKey(name: 'unit') required String unit,
    @JsonKey(name: 'date', fromJson: isoDateToDateTime) required DateTime date,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'beginning_balance') required int beginningBalance,
    @JsonKey(name: 'debit') required int debit,
    @JsonKey(name: 'credit') required int credit,
  }) = _ProductStockCardBatch;
  const ProductStockCardBatch._();

  factory ProductStockCardBatch.empty() => ProductStockCardBatch(
    transactionId: '', 
    productId: '',
    productName: '', 
    batchNo: '', 
    unit: '', 
    date: DateTime(0), 
    description: '', 
    beginningBalance: 0, 
    debit: 0, 
    credit: 0,
  );
  factory ProductStockCardBatch.fromJson(Map<String, dynamic> json) => _$ProductStockCardBatchFromJson(json);
}
