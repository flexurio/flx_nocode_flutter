import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_issue_global.freezed.dart';
part 'product_issue_global.g.dart';

@freezed
class ProductIssueGlobal with _$ProductIssueGlobal {
  factory ProductIssueGlobal({
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    required String warehouse,
    @JsonKey(name: 'unit_id') required String unitId,
    required int qty,
  }) = _ProductIssueGlobal;
  const ProductIssueGlobal._();

  factory ProductIssueGlobal.fromJson(Map<String, dynamic> json) =>
      _$ProductIssueGlobalFromJson(json);
}
