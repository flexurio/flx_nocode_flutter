import 'package:appointment/src/app/bloc/entity/entity_bloc.dart';
import 'package:appointment/src/app/bloc/entity_custom_query/entity_custom_query_bloc.dart';
import 'package:appointment/src/app/model/configuration.dart' as configuration;
import 'package:appointment/src/app/model/entity_field.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class EntityViewPage extends StatelessWidget {
  const EntityViewPage._({required this.entity, required this.data});
  final configuration.Entity entity;
  final Map<String, dynamic> data;

  static Route<void> route({
    required configuration.Entity entity,
    required Map<String, dynamic> data,
  }) {
    return MaterialPageRoute(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => EntityCustomQueryBloc(entity),
          ),
        ],
        child: EntityViewPage._(entity: entity, data: data),
      ),
    );
  }

  void _fetch(BuildContext context) {
    context.read<EntityCustomQueryBloc>().add(
          EntityCustomQueryEvent.fetchById(data['id'].toString()),
        );
  }

  @override
  Widget build(BuildContext context) {
    _fetch(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<EntityCustomQueryBloc, EntityCustomQueryState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: SomethingWrong.new,
            loading: (_) => const ProgressingIndicator(),
            loaded: (pageOptions) {
              return SingleFormPanel(
                action: DataAction.view,
                entity: entity.coreEntity,
                size: SingleFormPanelSize.large,
                actions: _buildEntityCustomActions(entity, context),
                children: [
                  _buildData(),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildData() {
    final children = <Widget>[];
    var isFirst = true;
    for (final field in entity.fields) {
      children.addAll([
        if (!isFirst) Gap(12),
        TileDataVertical(
          label: field.label,
          child: EntityField.buildDisplay(
            entity,
            field.reference,
            data[field.reference],
          ),
        ),
      ]);
      if (isFirst) {
        isFirst = false;
      }
    }
    return Column(children: children);
  }

  List<Widget> _buildEntityCustomActions(
      configuration.Entity entity, BuildContext context) {
    return [
      LightButton(
        permission: null,
        action: DataAction.edit,
        onPressed: () async {
          // await showDialogClosePurchaseOrder(context, purchaseOrderBloc);
        },
      ),
      EntityDeleteButton.prepare(
        entity: entity,
        data: data,
      ),
    ];
  }
}

class EntityDeleteButton extends StatelessWidget {
  const EntityDeleteButton._({
    required this.entity,
    required this.data,
  });

  final Map<String, dynamic> data;

  static Widget prepare({
    required configuration.Entity entity,
    required Map<String, dynamic> data,
  }) {
    return BlocProvider(
      create: (context) => EntityBloc(entity),
      child: EntityDeleteButton._(entity: entity, data: data),
    );
  }

  final configuration.Entity entity;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: null,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<EntityBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          Navigator.pop(context);
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    EntityBloc bloc,
  ) {
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
              return CardConfirmation(
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
