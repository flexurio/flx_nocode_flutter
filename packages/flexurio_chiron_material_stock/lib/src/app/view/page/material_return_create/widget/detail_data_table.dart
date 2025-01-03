import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return/material_return_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return_detail.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return_create/widget/remove_button.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return_detail/widget/material_return_detail_delete_button.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return_detail/widget/material_return_detail_edit_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReturnDetailDataTable extends StatelessWidget {
  const MaterialReturnDetailDataTable({
    required this.action,
    required this.isExternal,
    this.bloc,
    super.key,
    this.canRemove = false,
    this.materialReturn,
  });

  final bool canRemove;
  final DataAction action;
  final MaterialReturnBloc? bloc;
  final MaterialReturn? materialReturn;
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    final isView = action == DataAction.view;
    return BlocBuilder<MaterialReturnBloc, MaterialReturnState>(
      bloc: bloc,
      builder: (context, state) {
        return SimpleTable<MaterialReturnDetail>(
          data: state.maybeWhen(
            orElse: () => [],
            initial: (materials, _) {
              print("Table Initial");
              return materials;
            },
          ),
          width: isView ? 900 : 1050,
          columns: [
            TableColumnX(
              width: 150,
              title: 'material_id'.tr(),
              builder: (materialReturnDetail, _) {
                return Text(materialReturnDetail.material.id);
              },
            ),
            TableColumnX(
              width: 200,
              title: 'material_name'.tr(),
              builder: (materialReturnDetail, _) {
                return Text(materialReturnDetail.material.name);
              },
            ),
            TableColumnX(
              width: 100,
              title: 'NA',
              builder: (materialReturnDetail, _) {
                return Text(materialReturnDetail.na);
              },
            ),
            if (action.isCreate)
              TableColumnX(
                width: 100,
                title: 'Unit',
                builder: (materialReturnDetail, _) {
                  return Text(materialReturnDetail.material.materialUnit.id);
                },
              ),
            if (isView)
              TableColumnX(
                title: 'Unit',
                width: 100,
                builder: (materialReturnDetail, _) {
                  return Text(materialReturnDetail.materialUnit.id);
                },
              ),
            TableColumnX(
              title: 'quantity'.tr(),
              width: 100,
              builder: (materialReturnDetail, _) {
                return Text(
                  materialReturnDetail.quantity.toString(),
                );
              },
            ),
            if (isView)
              TableColumnX(
                title: 'actions'.tr(),
                width: 120,
                builder: (materialReturnDetail, _) {
                  return Row(
                    children: [
                      if (DateTime.now().month ==
                          materialReturnDetail.createdAt.month)
                        MaterialReturnDetailEditButton(
                          materialReturnDetail: materialReturnDetail,
                          bloc: bloc!,
                        ),
                      MaterialReturnDetailDeleteButton.prepare(
                        materialReturn: materialReturn,
                        blocTable: bloc,
                        materialReturnDetail: materialReturnDetail,
                        isExternal: isExternal,
                      ),
                    ],
                  );
                },
              ),
            if (canRemove)
              TableColumnX(
                title: 'actions'.tr(),
                width: 100,
                builder: (materialReturnDetail, _) {
                  return MaterialReturnDetailRemoveButton(
                    materialReturnDetail: materialReturnDetail,
                  );
                },
              ),
          ],
        );
      },
    );
  }
}
