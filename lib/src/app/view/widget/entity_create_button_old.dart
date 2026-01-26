import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart'
    as configuration;
import 'package:flx_nocode_flutter/src/app/view/page/entity_create/entity_create_page_old.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flutter/material.dart';

class EntityCreateButtonOld extends StatelessWidget {
  const EntityCreateButtonOld({
    super.key,
    required this.entity,
    required this.onSuccess,
    required this.embedded,
    required this.filters,
    required this.bypassPermission,
    required this.layoutForm,
    required this.parentData,
  });

  final configuration.EntityCustom entity;
  final void Function() onSuccess;
  final bool embedded;
  final Map<String, dynamic> filters;
  final LayoutForm? layoutForm;
  final bool bypassPermission;
  final List<Map<String, dynamic>> parentData;

  @override
  Widget build(BuildContext context) {
    if (layoutForm == null) return const SizedBox.shrink();
    return Button.small(
      permission: (bypassPermission || entity.bypassAllPermissions)
          ? null
          : '${entity.id}_write',
      action: DataAction.create,
      onPressed: () async {
        final success = await Navigator.push(
          context,
          EntityCreatePageOld.route(
            parentData: parentData,
            layoutForm: layoutForm!,
            entity: entity,
            onSuccess: (_) => onSuccess(),
            embedded: embedded,
            filters: filters,
          ),
        );
        if (success ?? false) {
          onSuccess();
        }
      },
    );
  }
}
