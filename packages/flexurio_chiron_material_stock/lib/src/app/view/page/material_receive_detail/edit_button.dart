import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive/material_receive_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive_detail_query/material_receive_detail_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/permission.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_detail/edit_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveDetailEditButton extends StatelessWidget {
  const MaterialReceiveDetailEditButton({
    required this.materialReceiveDetail,
    required this.materialReceive,
    required this.type,
    required this.isExternal,
    super.key,
  });

  final MaterialReceiveDetail materialReceiveDetail;
  final MaterialReceiveType type;
  final MaterialReceive materialReceive;
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission:
          PermissionMaterialStock.materialReceiveEdit(isExternal: isExternal),
      action: DataAction.edit,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return SimpleDialog(
              backgroundColor: Colors.transparent,
              children: [
                BlocProvider(
                  create: (context) =>
                      MaterialReceiveBloc(isExternal: isExternal),
                  child: MaterialReceiveDetailEditForm.prepare(
                    detail: materialReceiveDetail,
                    isExternal: isExternal,
                  ),
                ),
              ],
            );
          },
        ).then(
          (value) {
            if (value ?? false) {
              context.read<MaterialReceiveDetailQueryBloc>().add(
                    MaterialReceiveDetailQueryEvent.fetch(
                      materialReceive: materialReceive,
                    ),
                  );
            }
          },
        );
      },
    );
  }
}
