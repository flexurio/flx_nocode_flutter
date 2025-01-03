import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_stock_initial.freezed.dart';
part 'product_stock_initial.g.dart';

@freezed
class ProductStockInitial with _$ProductStockInitial {
  const factory ProductStockInitial({
    required String period,
    required String warehouse,
    @JsonKey(name: 'created_at', 
    fromJson: isoDateToDateTime,) required DateTime createdAt,
    @JsonKey(name: 'updated_at', 
    fromJson: isoDateToDateTime,) required DateTime updatedAt,
    @JsonKey(name: 'expired_date', 
    fromJson: isoDateToDateTime,) required DateTime expiredDate,
    @JsonKey(name: 'unit_id') required String unitId,
    @JsonKey(name: 'beginning_balance') required int beginningBalance,
    @JsonKey(name: 'ending_balance') required int endingBalance,
    @JsonKey(name: 'total_ending_balance') required int totalEndingBalance,
    required Product product,
    @JsonKey(name: 'batch_no_id') required String batchNoId,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_by_id') required int updatedById,
  }) = _ProductStockInitial;

  const ProductStockInitial._();

  factory ProductStockInitial.empty() => ProductStockInitial(
    period: '', 
    warehouse: '', 
    createdAt: DateTime(0), 
    updatedAt: DateTime(0), 
    expiredDate: DateTime(0), 
    unitId: '', 
    beginningBalance: 0, 
    endingBalance: 0, 
    totalEndingBalance: 0, 
    product: Product.empty(), 
    batchNoId: '', 
    createdById: 0,
    updatedById: 0,
  );

  factory ProductStockInitial.fromJson(Map<String, dynamic> json) => _$ProductStockInitialFromJson(json);
}
