import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive/material_receive_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveTemporaryReviewTable extends StatelessWidget {
  const MaterialReceiveTemporaryReviewTable({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.decimalPatternDigits(
      locale: 'en_us',
      decimalDigits: 0,
    );
    return BlocBuilder<MaterialReceiveBloc, MaterialReceiveState>(
      builder: (context, state) {
        final data = state.maybeWhen(
          orElse: () => <MaterialReceiveDetail>[],
          initial: (details, type, form) => details,
        );
        return YuhuTable<MaterialReceiveDetail>(
          data: data,
          width: 2160,
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
              builder: (purchaseOrderDetails, index) {
                return Text(
                  purchaseOrderDetails.quantity.format(),
                );
              },
            ),
            TableColumn(
              title: 'quantity'.tr(),
              width: 140,
              builder: (materialReceiveDetail, index) {
                return Text(
                  formatter
                      .format(materialReceiveDetail.quantity)
                      .replaceAll(',', '.'),
                );
              },
            ),
            TableColumn(
              width: 160,
              title: 'vat_total'.tr(),
              builder: (materialReceiveDetail, index) {
                return Text(
                  formatter
                      .format(materialReceiveDetail.vatTotal)
                      .replaceAll(',', '.'),
                );
              },
            ),
            TableColumn(
              width: 160,
              title: 'total_quantity'.tr(),
              builder: (materialReceiveDetail, index) {
                return Text(
                  formatter
                      .format(materialReceiveDetail.totalQuantity)
                      .replaceAll(',', '.'),
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
        );
      },
    );
  }
}
