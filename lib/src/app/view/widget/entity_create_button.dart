import 'package:flexurio_no_code/src/app/model/entity.dart' as configuration;
import 'package:flexurio_no_code/src/app/view/page/entity_create/entity_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class EntityCreateButton extends StatelessWidget {
  const EntityCreateButton({
    super.key,
    required this.entity,
    required this.onSuccess,
    required this.embedded,
  });

  final configuration.EntityCustom entity;
  final void Function() onSuccess;
  final bool embedded;

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: '${entity.id}_write',
      action: DataAction.create,
      onPressed: () async {
        final success = await Navigator.push(
          context,
          EntityCreatePage.route(
            entity: entity,
            onSuccess: onSuccess,
            embedded: embedded,
          ),
        );
        if (success ?? false) {
          onSuccess();
        }
      },
    );
  }
}
