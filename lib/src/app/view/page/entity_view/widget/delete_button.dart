import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/bloc/entity/entity_bloc.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntityDeleteButton extends StatelessWidget {
  const EntityDeleteButton._({
    required this.entity,
    required this.data,
    required this.onSuccess,
    required this.bypassPermission,
  });

  final Map<String, dynamic> data;
  final VoidCallback onSuccess;
  final bool bypassPermission;

  static Widget prepare({
    required EntityCustom entity,
    required Map<String, dynamic> data,
    required VoidCallback onSuccess,
    required bool bypassPermission,
  }) {
    return BlocProvider(
      create: (context) => EntityBloc(entity),
      child: EntityDeleteButton._(
        entity: entity,
        data: data,
        onSuccess: onSuccess,
        bypassPermission: bypassPermission,
      ),
    );
  }

  final EntityCustom entity;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: bypassPermission ? null : '${entity.id}_delete',
      action: DataAction.delete,
      onPressed: () async {
        await _showConfirmationDialog(context);
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
  ) {
    final bloc = EntityBloc(entity);
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<EntityBloc, EntityState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: (_) {
                Toast(context).dataChanged(action, entity.coreEntity);
                onSuccess();
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<EntityBloc, EntityState>(
            bloc: bloc,
            builder: (context, state) {
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
                  bloc.add(EntityEvent.delete(id: data['id'].toString()));
                },
              );
            },
          ),
        );
      },
    );
  }
}
