import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart' as ui;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_receive_detail.freezed.dart';
part 'material_receive_detail.g.dart';

@freezed
class MaterialReceiveDetail with _$MaterialReceiveDetail {
  factory MaterialReceiveDetail({
    required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    required String na,
    @JsonKey(
      name: 'material_receive',
      fromJson: MaterialReceive.fromJson,
      defaultValue: MaterialReceive.empty,
    )
    required MaterialReceive materialReceive,
    @JsonKey(
      name: 'design_code',
      fromJson: MaterialDesign.fromJson,
      defaultValue: MaterialDesign.empty,
    )
    required MaterialDesign? materialDesign,
    @JsonKey(
      name: 'material',
      fromJson: Material.fromJson,
      defaultValue: Material.empty,
    )
    required Material material,
    @JsonKey(
      name: 'material_unit',
      fromJson: MaterialUnit.fromJson,
      defaultValue: MaterialUnit.empty,
    )
    required MaterialUnit materialUnit,
    @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
    required DateTime transactionDate,
    @JsonKey(name: 'batch_no') required String batchNo,
    @JsonKey(name: 'barcode_no') required String barcodeNo,
    @JsonKey(name: 'vat_no') required int vatNo,
    @JsonKey(name: 'vat_total') required int vatTotal,
    required double quantity,
    @JsonKey(name: 'total_quantity') required double totalQuantity,
    required double price,
    @JsonKey(
      name: 'material_status_qc',
      fromJson: MaterialReceiveDetailStatus.fromString,
    )
    required MaterialReceiveDetailStatus materialStatus,
    @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
    DateTime? releaseDate,
    @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
    DateTime? expiredDate,
    @JsonKey(name: 'best_before', fromJson: dateTimeNullable)
    DateTime? bestBefore,
    @JsonKey(name: 'manufacturing_date', fromJson: dateTimeNullable)
    DateTime? manufacturingDate,
    @JsonKey(name: 'retest_date', fromJson: dateTimeNullable)
    DateTime? retestDate,
    @JsonKey(name: 'retest_date_qc', fromJson: dateTimeNullable)
    DateTime? retestDateQualityControl,
    @JsonKey(name: 'shelf_life', fromJson: dateTimeNullable)
    DateTime? shelfLife,
  }) = _MaterialReceiveDetail;
  const MaterialReceiveDetail._();

  factory MaterialReceiveDetail.empty() {
    return MaterialReceiveDetail(
      id: 0,
      na: '',
      materialReceive: MaterialReceive.empty(),
      materialDesign: MaterialDesign.empty(),
      material: Material.empty(),
      materialUnit: MaterialUnit.empty(),
      transactionDate: DateTime(0),
      batchNo: '',
      barcodeNo: '',
      vatNo: 0,
      vatTotal: 0,
      quantity: 0,
      totalQuantity: 0,
      price: 0,
      expiredDate: DateTime(0),
      bestBefore: DateTime(0),
      materialStatus: MaterialReceiveDetailStatus.empty,
      manufacturingDate: DateTime(0),
      createdAt: DateTime(0),
      updatedAt: DateTime(0),
      retestDate: DateTime(0),
      shelfLife: DateTime(0),
    );
  }

  factory MaterialReceiveDetail.fromJson(Map<String, dynamic> json) =>
      _$MaterialReceiveDetailFromJson(json);
}

enum MaterialReceiveDetailStatus implements ColorType {
  empty('', ui.Colors.transparent),
  release('RELEASE', ui.Colors.green),
  quarantine('KARANTINA', ui.Colors.blue),
  reject('REJECT', ui.Colors.redAccent);

  const MaterialReceiveDetailStatus(this.id, this.color);
  final String id;

  @override
  String get label => id;

  @override
  final ui.Color color;

  static MaterialReceiveDetailStatus fromString(String id) {
    if (id == MaterialReceiveDetailStatus.quarantine.id) {
      return MaterialReceiveDetailStatus.quarantine;
    }
    if (id == MaterialReceiveDetailStatus.release.id) {
      return MaterialReceiveDetailStatus.release;
    }
    if (id == MaterialReceiveDetailStatus.reject.id) {
      return MaterialReceiveDetailStatus.reject;
    }
    return MaterialReceiveDetailStatus.empty;
  }

  bool get isEmpty => this == MaterialReceiveDetailStatus.empty;
  bool get isRelease => this == MaterialReceiveDetailStatus.release;
  bool get isReject => this == MaterialReceiveDetailStatus.reject;
  bool get isQuarantine => this == MaterialReceiveDetailStatus.quarantine;
}

List<MaterialReceiveDetail> removeDuplicates(
    List<MaterialReceiveDetail> materialReceiveDetails) {
  final uniqueIdentifiers = <String>{};
  final uniqueDetails = <MaterialReceiveDetail>[];
  for (final detail in materialReceiveDetails) {
    final identifier = detail.na;
    if (!uniqueIdentifiers.contains(identifier)) {
      uniqueIdentifiers.add(identifier);
      uniqueDetails.add(detail);
    }
  }
  return uniqueDetails;
}
