import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReturnViewButton extends StatefulWidget {
  const MaterialReturnViewButton({
    required this.materialReturn,
    required this.isExternal,
    super.key,
  });

  final MaterialReturn materialReturn;
  final bool isExternal;

  @override
  State<MaterialReturnViewButton> createState() =>
      _MaterialReturnViewButtonState();
}

class _MaterialReturnViewButtonState extends State<MaterialReturnViewButton> {
  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionMaterialStock.materialReturnViewMenu(isExternal: false),
      action: DataAction.view,
      onPressed: () {
        Navigator.push(
          context,
          MaterialReturnDetailPage.route(
            materialReturn: widget.materialReturn,
            action: DataAction.view,
            isExternal: widget.isExternal,
          ),
        ).then(
          (value) {
            if (value ?? false) {
              context.read<MaterialReturnDetailQueryBloc>().add(
                    MaterialReturnDetailQueryEvent.fetch(
                      materialReturn: widget.materialReturn,
                      isExternal: widget.isExternal,
                    ),
                  );
            }
          },
        );
      },
    );
  }
}
