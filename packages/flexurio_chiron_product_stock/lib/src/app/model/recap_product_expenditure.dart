import 'package:flexurio_chiron_product_stock/src/app/model/product_issue.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recap_product_expenditure.freezed.dart';
part 'recap_product_expenditure.g.dart';

enum Division {
  ethData('eth', 'ETH', '', ''),
  alkData('alk', 'ALK', '', ''),
  distData('dist', 'DIST', '', ''),
  otcData('otc', 'OTC', '', '');

  const Division(this.eth, this.alk, this.dist, this.otc);

  final String eth;
  final String alk;
  final String dist;
  final String otc;

  String get label => tr(alk);

  static List<Division> get list => [
        Division.ethData,
        Division.alkData,
        Division.distData,
        Division.otcData,
      ];
}

enum RecapProductExpenditureWarehouse {
  productJadiData(
    'product_jadi',
    'PRODUK JADI',
    '',
    '',
    '',
  ),
  ruahanData(
    'ruahan',
    'RUAHAN',
    '',
    '',
    '',
  ),
  alkesData(
    'alkes',
    'ALKES',
    '',
    '',
    '',
  ),
  rndData(
    'r&d',
    'R&D',
    '',
    '',
    '',
  ),
  pengobatanData('pengobatan', 'PENGOBATAN', '', '', '');

  const RecapProductExpenditureWarehouse(
      this.productJadi, this.ruahan, this.alkes, this.rnd, this.pengobatan);

  final String productJadi;
  final String ruahan;
  final String alkes;
  final String rnd;
  final String pengobatan;

  String get label => tr(ruahan);

  static List<RecapProductExpenditureWarehouse> get list => [
        RecapProductExpenditureWarehouse.productJadiData,
        RecapProductExpenditureWarehouse.ruahanData,
        RecapProductExpenditureWarehouse.alkesData,
        RecapProductExpenditureWarehouse.rndData,
        RecapProductExpenditureWarehouse.pengobatanData,
      ];
}

@freezed
class RecapProductExpenditure with _$RecapProductExpenditure {
  const factory RecapProductExpenditure({
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'qty') required double qty,
    @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
    required DateTime expiredDate,
    @JsonKey(name: 'batch_no_id') required String batchNoId,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'customer_name') required String customerName,
    @JsonKey(name: 'customer_city') required String customerCity,
    @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
    required MaterialUnit unit,
    @JsonKey(name: 'product', fromJson: Product.fromJson)
    required Product product,
    @JsonKey(name: 'product_issued', fromJson: ProductIssue.fromJson)
    required ProductIssue productIssue,
  }) = _RecapProductExpenditure;
  const RecapProductExpenditure._();

  factory RecapProductExpenditure.fromJson(Map<String, dynamic> json) =>
      _$RecapProductExpenditureFromJson(json);

  factory RecapProductExpenditure.empty() => RecapProductExpenditure(
        createdAt: DateTime(0),
        qty: 0,
        expiredDate: DateTime(0),
        batchNoId: '',
        customerId: '',
        customerName: '',
        customerCity: '',
        product: Product.empty(),
        unit: MaterialUnit.empty(),
        productIssue: ProductIssue.empty(),
      );
}
