import 'package:flx_nocode_flutter/src/app/model/entity.dart' as configuration;
import 'package:flx_nocode_flutter/src/app/view/page/entity_create/entity_create_page.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
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
      permission: null,
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
