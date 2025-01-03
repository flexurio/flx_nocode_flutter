import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive_query/material_receive_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/permission.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive/widget/edit_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialReceiveEditButton extends StatelessWidget {
  const MaterialReceiveEditButton({
    required this.materialReceive,
    required this.queryBloc,
    required this.isExternal,
    super.key,
  });

  final MaterialReceive materialReceive;
  final MaterialReceiveQueryBloc queryBloc;
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission:
          PermissionMaterialStock.materialReceiveEdit(isExternal: isExternal),
      action: DataAction.edit,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => MaterialReceiveFormEditPage.prepare(
              materialReceive: materialReceive,
              isExternal: isExternal,
            ),
          ),
        ).then((success) {
          if (success ?? false) {
            queryBloc.add(
              MaterialReceiveQueryEvent.fetchById(materialReceive.id),
            );
          }
        });
      },
    );
  }
}
