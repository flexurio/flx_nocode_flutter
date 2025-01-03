import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_data_report.freezed.dart';
part 'production_data_report.g.dart';

@freezed
class ProductionDataReport with _$ProductionDataReport {
  factory ProductionDataReport({
    @JsonKey(name: 'actual_start_time', fromJson: isoDateToDateTime) required DateTime actualStartTime,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'production_order') required String productionOrder,
    @JsonKey(name: 'production_stage_name') required String productionStageName,
    @JsonKey(name: 'machine') required String machine,
    @JsonKey(name: 'production_sub_stage_name') required String productionSubStageName,
    @JsonKey(name: 'machine_name') required String machineName,
    @JsonKey(name: 'sub_stage_name') required String subStageName,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'yield') required int yield,
  }) = _ProductionDataReport;

  factory ProductionDataReport.fromJson(Map<String, dynamic> json) => _$ProductionDataReportFromJson(json);
  const ProductionDataReport._();

  factory ProductionDataReport.empty() {
    final productionDataReport = ProductionDataReport(
      actualStartTime: DateTime.now(), 
      productName: '', 
      productionOrder: '', 
      productionStageName: '',
      machine: '', 
      productionSubStageName: '', 
      machineName: '', 
      subStageName: '', 
      status: '', 
      yield: 0,
    );
    return productionDataReport;
  }
}
