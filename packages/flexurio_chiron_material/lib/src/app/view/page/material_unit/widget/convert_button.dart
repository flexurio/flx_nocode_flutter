import 'package:flexurio_chiron_material/src/app/view/page/unit_convert/unit_convert_page.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialUnitConvertButton extends StatelessWidget {
  const MaterialUnitConvertButton({required this.unit, super.key});

  final MaterialUnit unit;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => MaterialUnitConvertPage(
              unit: unit,
            ),
          ),
        );
      },
      action: DataAction.convert,
      permission: null,
    );
  }
}
