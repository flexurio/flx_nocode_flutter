import 'package:flexurio_chiron_material/src/app/view/page/unit_convert/widget/data_table.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialUnitConvertPage extends StatelessWidget {
  const MaterialUnitConvertPage({required this.unit, super.key});

  final MaterialUnit unit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        children: [
          Row(
            children: [
              BackButtonWithTitle(
                title: '${Entity.unitConvert.title} - ${unit.id}',
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: UnitConvertDataTable.prepare(unit: unit),
          ),
        ],
      ),
    );
  }
}
