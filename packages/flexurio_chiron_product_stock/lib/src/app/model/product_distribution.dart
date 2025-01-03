import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_distribution.freezed.dart';
part 'product_distribution.g.dart';

@freezed
class ProductDistribution with _$ProductDistribution {
  factory ProductDistribution({
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'customer_name') required String customerName,
    @JsonKey(name: 'batch_no_id') required String batchNoId,
    @JsonKey(name: 'beginning_balance') required double beginningBalance,
    @JsonKey(name: 'debit') required double debit,
    @JsonKey(name: 'credit') required double credit,
    required DateTime? productIssueDate,
  }) = _ProductDistribution;
  factory ProductDistribution.fromJson(Map<String, dynamic> json) =>
      _$ProductDistributionFromJson(json);

  const ProductDistribution._();
}
