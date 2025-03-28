import 'package:flexurio_no_code/src/app/bloc/entity/entity_bloc.dart';
import 'package:flexurio_no_code/src/app/bloc/entity_custom_query/entity_custom_query_bloc.dart';
import 'package:flexurio_no_code/src/app/model/entity.dart' as configuration;
import 'package:flexurio_no_code/src/app/model/entity_field.dart';
import 'package:flexurio_no_code/src/app/view/page/entity_create/entity_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_no_code/src/app/view/page/entity_view/widget/delete_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class EntityViewPage extends StatelessWidget {
  const EntityViewPage._({required this.entity, required this.data});
  final configuration.EntityCustom entity;
  final Map<String, dynamic> data;

  static Route<void> route({
    required configuration.EntityCustom entity,
    required Map<String, dynamic> data,
  }) {
    return MaterialPageRoute(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => EntityCustomQueryBloc()),
        ],
        child: EntityViewPage._(entity: entity, data: data),
      ),
    );
  }

  static List<Widget> actions(
    BuildContext context,
    Map<String, dynamic> data,
    configuration.EntityCustom entity,
    void Function(BuildContext) onRefresh,
  ) {
    final modifyActions =
        _buildEntityCustomActions(entity, context, data, onRefresh);
    return entity.buttonViews(context, data)..addAll(modifyActions);
  }

  static List<Widget> _buildEntityCustomActions(
    configuration.EntityCustom entity,
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

  void _fetch(BuildContext context) {
    context.read<EntityCustomQueryBloc>().add(
          EntityCustomQueryEvent.fetchById(
            id: data['id'].toString(),
            method: entity.backend.readAll!.method,
            url: entity.backend.readAll!.url,
          ),
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
                actions: EntityViewPage.actions(
                  context,
                  data,
                  entity,
                  (context) => _fetch(context),
                ),
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
}
