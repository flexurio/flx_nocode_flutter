import 'package:flexurio_chiron_material/src/app/bloc/unit_convert_query/unit_convert_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/view/page/unit_convert/widget/create_page.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitConvertCreateButton extends StatelessWidget {
  const UnitConvertCreateButton({required this.unit, super.key});

  final MaterialUnit unit;

  @override
  Widget build(BuildContext context) {
    return Button(
      action: DataAction.create,
      permission: Permission.unitConvertCreate,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool>(
            builder: (context) => UnitConvertCreatePage.prepare(unit: unit),
          ),
        ).then((value) {
          if (value ?? false) {
            context.read<UnitConvertQueryBloc>().add(
                  UnitConvertQueryEvent.fetch(
                    unitFrom: unit,
                    unitTo: MaterialUnit.empty(),
                  ),
                );
          }
        });
      },
    );
  }
}
