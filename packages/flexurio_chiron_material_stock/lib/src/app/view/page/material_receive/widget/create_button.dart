import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive_detail_query/material_receive_detail_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/permission.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_create/material_receive_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveCreateButton extends StatelessWidget {
  const MaterialReceiveCreateButton({
    super.key,
    required this.isExternal,
  });

  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission:
          PermissionMaterialStock.materialReceiveCreate(isExternal: isExternal),
      action: DataAction.create,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => MaterialReceiveCreatePage.prepare(
              isExternal: isExternal,
            ),
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<MaterialReceiveDetailQueryBloc>()
                .add(const MaterialReceiveDetailQueryEvent.fetch());
          }
        });
      },
    );
  }
}
