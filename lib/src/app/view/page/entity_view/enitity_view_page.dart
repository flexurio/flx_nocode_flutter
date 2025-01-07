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
            create: (context) => EntityCustomQueryBloc(entity)
              ..add(EntityCustomQueryEvent.fetchById(data['id'].toString())),
          ),
        ],
        child: EntityViewPage._(entity: entity, data: data),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
    return [];
  }
}
