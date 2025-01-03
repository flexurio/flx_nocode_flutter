import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionStageProcessDetailTable extends StatelessWidget {
  const ProductionStageProcessDetailTable({
    required this.onSubmitForm,
    required this.showOrderField,
    required this.actionColumn,
    super.key,
    this.onSuccess,
  });

  final void Function(
    BuildContext context,
    List<ProductionStageProcessDetail> detail,
  ) onSubmitForm;
  final bool showOrderField;
  final void Function(List<ProductionStageProcessDetail>)? onSuccess;
  final Widget Function(
    ProductionStageProcessDetail stageProcessDetail,
    int index,
  ) actionColumn;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LightButton(
              permission: null,
              action: DataAction.add,
              onPressed: () async {
                await Navigator.push(
                  context,
                  ProductStageProcessDetailCreatePage.route(
                    onSubmitForm: onSubmitForm,
                    showOrderField: showOrderField,
                    onSuccess: onSuccess,
                  ),
                );
              },
              entity: Entity.productionStageProcessDetail,
            ),
          ],
        ),
        const SizedBox(height: 30),
        BlocBuilder<ProductionStageProcessTemporaryBloc,
            List<ProductionStageProcessDetail>>(
          builder: (context, state) {
            return YuhuTable<ProductionStageProcessDetail>(
              width: 720,
              columns: [
                TableColumn(
                  title: 'Order',
                  width: 70,
                  alignment: Alignment.centerRight,
                  builder: (stageProcess, index) => Text(
                    showOrderField
                        ? stageProcess.order.toString()
                        : '${++index}',
                  ),
                ),
                TableColumn(
                  width: 120,
                  title: 'stage'.tr(),
                  builder: (stageProcess, _) => Text(stageProcess.stage.name),
                ),
                TableColumn(
                  width: 200,
                  title: 'sub_stage'.tr(),
                  builder: (stageProcess, _) =>
                      Text(stageProcess.subStage.name),
                ),
                TableColumn(
                  width: 200,
                  title: 'machine'.tr(),
                  builder: (stageProcess, _) => Text(stageProcess.machine.name),
                ),
                TableColumn(
                  width: 100,
                  title: 'lead_time'.tr(),
                  alignment: Alignment.centerRight,
                  builder: (stageProcess, _) => Text(
                    currencyFormatter
                        .formatDouble(stageProcess.leadTime)
                        .replaceAll('.', '#')
                        .replaceAll(',', '.')
                        .replaceAll('#', ','),
                  ),
                ),
                TableColumn(
                  width: 130,
                  title: 'actions'.tr(),
                  builder: actionColumn,
                ),
              ],
              data: state..sort((a, b) => a.order.compareTo(b.order)),
            );
          },
        ),
      ],
    );
  }
}
