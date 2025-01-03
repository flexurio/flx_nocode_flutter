import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_receive_by_na.freezed.dart';
part 'material_receive_by_na.g.dart';

@freezed
class MaterialReceiveByNa with _$MaterialReceiveByNa {
  factory MaterialReceiveByNa({
    required String id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'delivery_order_id', defaultValue: '')
    required String deliveryOrderId,
    @JsonKey(name: 'material_id', defaultValue: '') required String materialId,
    @JsonKey(name: 'material_name', defaultValue: '')
    required String materialName,
    @JsonKey(name: 'material_group_id', defaultValue: '')
    required String materialGroupId,
    @JsonKey(name: 'design_code_id', defaultValue: 0) required int designCodeId,
    @JsonKey(name: 'total_quantity', defaultValue: 0) required num totalQty,
    @JsonKey(name: 'vat_total', defaultValue: 0) required num vatTotal,
    @JsonKey(name: 'material_unit_id', defaultValue: '')
    required String materialUnitId,
    @JsonKey(defaultValue: '') required String na,
    @JsonKey(name: 'purchase_order_id', defaultValue: '')
    required String purchaseOrderId,
    @JsonKey(name: 'batch_no', defaultValue: '') required String batchNo,
    @JsonKey(
      name: 'material_status_qc',
      fromJson: MaterialReceiveDetailStatus.fromString,
    )
    required MaterialReceiveDetailStatus materialStatus,
  }) = _MaterialReceiveByNa;

  factory MaterialReceiveByNa.fromJson(Map<String, dynamic> json) =>
      _$MaterialReceiveByNaFromJson(json);
}
