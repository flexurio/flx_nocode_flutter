import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TypeCostCreateButton extends StatelessWidget {
  const TypeCostCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionAccounting.typeCostCreate,
      action: DataAction.create,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => TypeCostCreatePage.prepare(),
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<TypeCostQueryBloc>()
                .add(const TypeCostQueryEvent.fetch());
          }
        });
      },
    );
  }
}
