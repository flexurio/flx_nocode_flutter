import 'package:appointment/src/app/bloc/entity/entity_bloc.dart';
import 'package:appointment/src/app/bloc/entity_custom_query/entity_custom_query_bloc.dart';
import 'package:appointment/src/app/model/configuration.dart' as configuration;
import 'package:appointment/src/app/model/entity_field.dart';
import 'package:appointment/src/app/view/page/entity_create/entity_create_page.dart';
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
              final data = pageOptions.data.first;
              return SingleFormPanel(
                action: DataAction.view,
                entity: entity.coreEntity,
                size: SingleFormPanelSize.large,
                actions: _buildEntityCustomActions(entity, context, data),
                children: [
                  _buildData(data),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildData(Map<String, dynamic> data) {
    final leftColumnChildren = <Widget>[];
    final rightColumnChildren = <Widget>[];
    var isFirst = true;

    for (int i = 0; i < entity.fields.length; i++) {
      final field = entity.fields[i];

      if (!isFirst) {
        leftColumnChildren.add(Gap(12));
        rightColumnChildren.add(Gap(12));
      }
      if (isFirst) {
        isFirst = false;
      }

      final widget = TileDataVertical(
        label: field.label,
        child: EntityField.buildDisplay(
          entity,
          field.reference,
          data[field.reference],
        ),
      );

      // Add alternating widgets to each column
      if (i % 2 == 0) {
        leftColumnChildren.add(widget);
      } else {
        rightColumnChildren.add(widget);
      }
    }

    // Return a Row containing both columns
    return RowFields(
      children: [
        Column(children: leftColumnChildren),
        Column(children: rightColumnChildren),
      ],
    );
  }

  List<Widget> _buildEntityCustomActions(
    configuration.Entity entity,
    BuildContext context,
    Map<String, dynamic> data,
  ) {
    return [
      LightButton(
        permission: null,
        action: DataAction.edit,
        onPressed: () async {
          Navigator.push(
            context,
            EntityCreatePage.route(
              entity: entity,
              data: data,
              onSuccess: () => _fetch(context),
            ),
          );
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
