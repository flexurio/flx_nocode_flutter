import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/bloc/entity/entity_controller.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntityDeleteButton extends StatelessWidget {
  const EntityDeleteButton._({
    required this.entity,
    required this.data,
    required this.onSuccess,
    required this.bypassPermission,
    this.expanded = false,
  });

  final Map<String, dynamic> data;
  final VoidCallback onSuccess;
  final bool bypassPermission;

  static Widget prepare({
    required EntityCustom entity,
    required Map<String, dynamic> data,
    required VoidCallback onSuccess,
    required bool bypassPermission,
    bool expanded = false,
  }) {
    return EntityDeleteButton._(
      entity: entity,
      data: data,
      onSuccess: onSuccess,
      bypassPermission: bypassPermission,
      expanded: expanded,
    );
  }

  final EntityCustom entity;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: bypassPermission ? null : '${entity.id}_delete',
      action: DataAction.delete,
      onPressed: () async {
        await _showConfirmationDialog(context);
      },
      expanded: expanded,
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
  ) {
    final tag = 'delete_${DateTime.now().millisecondsSinceEpoch}';
    final controller = Get.put(EntityController(entity), tag: tag);
    return showDialog<bool?>(
      barrierDismissible: false,
      useRootNavigator: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return Obx(() {
          final state = controller.state;

          state.maybeWhen(
            success: (_) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (controller.state is Success) {
                  Toast(context).dataChanged(action, entity.coreEntity);
                  onSuccess();
                  Navigator.pop(context, true);
                  Get.delete<EntityController>(tag: tag);
                }
              });
            },
            error: (error) => WidgetsBinding.instance.addPostFrameCallback((_) {
              Toast(context).fail(error);
            }),
            orElse: () {},
          );

          final isInProgress = state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );

          return CardConfirmation.action(
            isProgress: isInProgress,
            action: action,
            data: entity.coreEntity,
            label: data['id'].toString(),
            onConfirm: () {
              controller.delete(data['id'].toString());
            },
          );
        });
      },
    );
  }
}
