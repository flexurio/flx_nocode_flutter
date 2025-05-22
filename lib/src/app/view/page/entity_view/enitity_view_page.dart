import 'package:flx_nocode_flutter/src/app/bloc/entity/entity_bloc.dart';
import 'package:flx_nocode_flutter/src/app/bloc/entity_custom_query/entity_custom_query_bloc.dart';
import 'package:flx_nocode_flutter/src/app/model/backend_other.dart';
import 'package:flx_nocode_flutter/src/app/model/entity.dart';
import 'package:flx_nocode_flutter/src/app/model/entity_field.dart';
import 'package:flx_nocode_flutter/src/app/view/page/entity_create/entity_create_page.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/view/page/entity_view/widget/delete_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class EntityViewPage extends StatelessWidget {
  const EntityViewPage._({
    required this.entity,
    required this.data,
    required this.embedded,
  });
  final EntityCustom entity;
  final Map<String, dynamic> data;
  final bool embedded;

  static Route<void> route({
    required EntityCustom entity,
    required Map<String, dynamic> data,
    required bool embedded,
  }) {
    return MaterialPageRoute(
      builder: (_) => MultiBlocProvider(
        providers: [BlocProvider(create: (_) => EntityCustomQueryBloc())],
        child: EntityViewPage._(entity: entity, data: data, embedded: embedded),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    _fetch(context);
    return Scaffold(
      appBar: embedded ? _buildAppBar(context) : null,
      backgroundColor: embedded ? theme.cardColor : Colors.transparent,
      floatingActionButton: ActionButtonX(
        items: EntityViewPage.actions(
          context,
          data,
          entity,
          _fetch,
          embedded,
        ),
      ),
      body: BlocBuilder<EntityCustomQueryBloc, EntityCustomQueryState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: SomethingWrong.new,
            loading: (_) => const ProgressingIndicator(),
            loaded: (pageOptions) {
              final data = pageOptions.data.first;
              return SingleFormPanel(
                hideHeader: embedded ? true : false,
                action: DataAction.view,
                entity: entity.coreEntity,
                size: SingleFormPanelSize.large,
                children: [_buildData(data)],
              );
            },
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      title: Text(entity.label),
      backgroundColor: theme.scaffoldBackgroundColor,
    );
  }

  static List<ActionButtonItem> actions(
    BuildContext context,
    Map<String, dynamic> data,
    EntityCustom entity,
    void Function(BuildContext) onRefresh,
    bool embedded,
  ) {
    final modifyActions = _buildEntityCustomActions(
      entity,
      context,
      data,
      onRefresh,
      embedded,
    );
    return entity.buttonViews(context, data, entity, embedded)
      ..addAll(modifyActions);
  }

  static List<Widget> actionsLarge(
    BuildContext context,
    Map<String, dynamic> data,
    EntityCustom entity,
    void Function(BuildContext) onRefresh,
  ) {
    final modifyActions =
        _buildEntityCustomActionsLarge(entity, context, data, onRefresh);
    return entity.buttonViewsLarge(context, data)..addAll(modifyActions);
  }

  static List<Widget> _buildEntityCustomActionsLarge(
    EntityCustom entity,
    BuildContext context,
    Map<String, dynamic> data,
    void Function(BuildContext context) onRefresh,
  ) {
    return [
      if (entity.allowDelete)
        LightButton(
          permission: '${entity.id}_write',
          action: DataAction.edit,
          onPressed: () async {
            Navigator.push(
              context,
              EntityCreatePage.route(
                embedded: false,
                entity: entity,
                data: data,
                onSuccess: () => onRefresh(context),
              ),
            );
          },
        ),
      if (entity.allowDelete)
        EntityDeleteButton.prepare(
          entity: entity,
          data: data,
          onSuccess: () => onRefresh(context),
        ),
    ];
  }

  static List<ActionButtonItem> _buildEntityCustomActions(
    EntityCustom entity,
    BuildContext context,
    Map<String, dynamic> data,
    void Function(BuildContext context) onRefresh,
    bool embedded,
  ) {
    final actions = [
      if (entity.allowUpdate)
        ActionButtonItem(
          color: DataAction.edit.color,
          icon: DataAction.edit.icon,
          label: DataAction.edit.title,
          onPressed: () async {
            Navigator.push(
              context,
              EntityCreatePage.route(
                embedded: embedded,
                entity: entity,
                data: data,
                onSuccess: () => onRefresh(context),
              ),
            );
          },
        ),
      if (entity.allowDelete)
        ActionButtonItem(
            color: DataAction.delete.color,
            icon: DataAction.delete.icon,
            label: DataAction.delete.title,
            onPressed: () async {
              BackendOther.showConfirmationDialog(
                event: EntityEvent.delete(id: data['id'].toString()),
                title: DataAction.delete.title,
                context: context,
                onSuccess: () => Navigator.pop(context),
                entity: entity,
                data: data,
              );
            }),
      ...BackendOther.buildButton(
        events: entity.backend.others,
        context: context,
        entity: entity,
        data: data,
      ),
    ];

    return actions;
  }

  void _fetch(BuildContext context) {
    context.read<EntityCustomQueryBloc>().add(
          EntityCustomQueryEvent.fetchById(
            id: data['id'].toString(),
            method: entity.backend.read!.method,
            url: entity.backend.read!.url,
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
}
