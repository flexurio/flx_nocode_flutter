import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_stock_mutation_report.freezed.dart';
part 'material_stock_mutation_report.g.dart';

@freezed
class MaterialStockMutationReport with _$MaterialStockMutationReport {
  factory MaterialStockMutationReport({
    @JsonKey(name: 'material') required String material,
    @JsonKey(name: 'material_unit') required String materialUnit,
    @JsonKey(name: 'quantity_begin') required int quantity,
    @JsonKey(name: 'quantity_in') required int quantityIn,
    @JsonKey(name: 'quantity_out') required int quantityOut,
    @JsonKey(name: 'quantity_end') required int quantityEnd
  }) = _MaterialStockMutationReport;

  const MaterialStockMutationReport._();

  factory MaterialStockMutationReport.fromJson(Map<String, dynamic> json) =>
      _$MaterialStockMutationReportFromJson(json);
}
