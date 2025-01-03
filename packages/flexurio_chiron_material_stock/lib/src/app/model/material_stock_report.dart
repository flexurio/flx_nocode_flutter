import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_stock_report.freezed.dart';
part 'material_stock_report.g.dart';

@freezed
class MaterialStockReport with _$MaterialStockReport {
  factory MaterialStockReport({
    @JsonKey(name: 'material_id') required String materialId,
    @JsonKey(name: 'material_name') required String materialName,
    @JsonKey(name: 'material_unit_id') required String materialUnitId,
    @JsonKey(name: 'qty') required int quantity,
    @JsonKey(name: 'na') required String na,
    @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
    required DateTime expiredDate,
  }) = _MaterialStockReport;

  const MaterialStockReport._();

  factory MaterialStockReport.fromJson(Map<String, dynamic> json) =>
      _$MaterialStockReportFromJson(json);
}
