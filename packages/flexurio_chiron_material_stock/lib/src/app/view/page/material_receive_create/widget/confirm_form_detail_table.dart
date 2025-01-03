import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialReceiveConfirmFormDetailTable extends StatelessWidget {
  const MaterialReceiveConfirmFormDetailTable({
    required this.materialReceiveDetails,
    required this.qtyPO,
    super.key,
  });

  final List<MaterialReceiveDetail> materialReceiveDetails;
  final List<double> qtyPO;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.decimalPatternDigits(
      locale: 'en_us',
      decimalDigits: 0,
    );
    return Column(
      children: [
        YuhuTable<MaterialReceiveDetail>(
          data: materialReceiveDetails,
          width: 1800,
          columns: [
            TableColumn(
              width: 140,
              title: 'Material ID',
              builder: (materialReceiveDetail, _) {
                return Text(
                  materialReceiveDetail.material.id,
                );
              },
            ),
            TableColumn(
              width: 180,
              title: 'Material Name',
              builder: (materialReceiveDetail, _) {
                return Text(
                  materialReceiveDetail.material.name,
                );
              },
            ),
            TableColumn(
              title: 'Unit',
              width: 100,
              builder: (materialReceiveDetail, _) {
                return Text(
                  materialReceiveDetail.materialUnit.id,
                );
              },
            ),
            TableColumn(
              width: 180,
              title: 'design_code'.tr(),
              builder: (materialReceiveDetail, _) {
                return Text(
                  materialReceiveDetail.materialDesign?.designCode ?? '-',
                );
              },
            ),
            TableColumn(
              width: 180,
              title: 'batch'.tr(),
              builder: (materialReceiveDetail, _) {
                return Text(materialReceiveDetail.batchNo);
              },
            ),
            TableColumn(
              width: 160,
              title: 'pack_size'.tr(),
              builder: (materialReceiveDetail, _) {
                return Text(
                  materialReceiveDetail.material.packSize.toInt().toString(),
                );
              },
            ),
            TableColumn(
              width: 180,
              title: 'quantity_po'.tr(),
              builder: (materialReceiveDetail, index) {
                return Text(index < qtyPO.length ? qtyPO[index].format() : '-');
              },
            ),
            TableColumn(
              title: 'quantity'.tr(),
              width: 140,
              builder: (materialReceiveDetail, index) {
                return Text(
                  materialReceiveDetail.quantity.format(),
                );
              },
            ),
            TableColumn(
              width: 160,
              title: 'vat_total'.tr(),
              builder: (materialReceiveDetail, index) {
                return Text(materialReceiveDetail.vatTotal.toString());
              },
            ),
            TableColumn(
              width: 160,
              title: 'total_quantity'.tr(),
              builder: (materialReceiveDetail, index) {
                return Text(
                  (materialReceiveDetail.quantity *
                          materialReceiveDetail.vatTotal)
                      .toString(),
                );
              },
            ),
            TableColumn(
              width: 160,
              title: 'mfg_date'.tr(),
              builder: (materialReceiveDetail, _) {
                return Text(
                  materialReceiveDetail.manufacturingDate?.yMMMMd ?? '-',
                );
              },
            ),
            TableColumn(
              width: 160,
              title: 'expired_date'.tr(),
              builder: (materialReceiveDetail, _) {
                return Text(
                  materialReceiveDetail.expiredDate?.yMMMMd ?? '-',
                );
              },
            ),
            TableColumn(
              width: 160,
              title: 'shelf_life'.tr(),
              builder: (materialReceiveDetail, _) {
                return Text(
                  materialReceiveDetail.shelfLife?.yMMMMd ?? '-',
                );
              },
            ),
            TableColumn(
              width: 160,
              title: 'best_before'.tr(),
              builder: (materialReceiveDetail, _) {
                return Text(
                  materialReceiveDetail.bestBefore?.yMMMMd ?? '-',
                );
              },
            ),
            TableColumn(
              width: 160,
              title: 'retest_date'.tr(),
              builder: (materialReceiveDetail, _) {
                return Text(
                  materialReceiveDetail.retestDate?.yMMMMd ?? '-',
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
