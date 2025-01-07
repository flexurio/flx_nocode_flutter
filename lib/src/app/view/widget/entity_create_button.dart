import 'package:appointment/src/app/model/configuration.dart' as configuration;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntityCreateButton extends StatelessWidget {
  const EntityCreateButton({
    super.key,
    required this.entity,
    required this.onSuccess,
  });

  final configuration.Entity entity;
  final void Function() onSuccess;

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: null,
      action: DataAction.create,
      onPressed: () async {
        final success = await Navigator.push(
          context,
          MaterialCreatePage.route(isExternal: isExternal),
        );
        if (success ?? false) {
          onSuccess();
        }
      },
    );
  }
}
