import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialIssueDetailCreateButton extends StatelessWidget {
  const MaterialIssueDetailCreateButton({
    required this.materialIssue,
    required this.action,
    super.key,
    required this.isExternal,
  });

  final bool isExternal;
  final MaterialIssue materialIssue;
  final DataAction action;

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionMaterialStock.materialIssueDetailCreate(
          isExternal: isExternal),
      action: action,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => MaterialIssueDetailCreatePage.prepare(
              action: action,
              materialIssue: materialIssue,
              isExternal: isExternal,
            ),
          ),
        ).then(
          (value) {
            if (value ?? false) {
              context.read<MaterialIssueDetailQueryBloc>().add(
                    MaterialIssueDetailQueryEvent.fetch(
                      materialIssue: materialIssue,
                    ),
                  );
            }
          },
        );
      },
    );
  }
}
