import 'package:flexurio_chiron_material/src/app/bloc/material/material_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material/src/app/view/page/material/widget/material_lead_time.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialLeadTimeButton extends StatelessWidget {
  const MaterialLeadTimeButton._({
    required this.material,
  });

  static Widget prepare({
    required model.Material material,
  }) {
    return BlocProvider(
      create: (context) => MaterialBloc(),
      child: MaterialLeadTimeButton._(material: material),
    );
  }

  final model.Material material;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: null,
      // permission: Permission.materialLeadTimeEdit,
      action: DataAction.leadTime,
      onPressed: () async {
        await showDialog<void>(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radiusPopup),
              ),
              content: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 600,
                  maxWidth: 500,
                  minWidth: 500,
                ),
                child: MaterialLeadTime.prepare(material: material),
              ),
            );
          },
        );
      },
    );
  }
}
