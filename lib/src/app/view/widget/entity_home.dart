import 'package:appointment/src/app/model/configuration.dart' as configuration;
import 'package:appointment/src/app/model/filter.dart';
import 'package:appointment/src/app/model/view.dart';
import 'package:appointment/src/app/view/widget/entity_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MenuCustom extends StatelessWidget {
  const MenuCustom({
    super.key,
    required this.entityId,
    this.initialFilters = const [],
  });

  final String entityId;
  final List<Filter> initialFilters;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<configuration.Entity?>(
      future: configuration.Entity.getEntity(entityId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final entity = snapshot.data;
          if (entity == null) {
            return const Center(child: Text('Entity not found!'));
          }
          return _home(context, entity);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _home(BuildContext context, configuration.Entity entity) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: entity.coreEntity, x: true),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: MenuDataTableCustom.prepare(
            entity: entity,
            initialFilters: initialFilters,
          ),
        ),
      ],
    );
  }
}
