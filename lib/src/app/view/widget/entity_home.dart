import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_no_code/src/app/model/entity.dart';
import 'package:flexurio_no_code/src/app/model/filter.dart';
import 'package:flexurio_no_code/src/app/view/widget/entity_data_table.dart';
import 'package:flutter/material.dart';

class MenuCustom extends StatelessWidget {
  const MenuCustom({
    super.key,
    required this.entityId,
    this.embedded = false,
    this.initialFilters = const [],
  });

  final bool embedded;
  final String entityId;
  final List<Filter> initialFilters;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<EntityCustom?>(
      future: EntityCustom.getEntity(entityId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
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

  Widget _home(BuildContext context, EntityCustom entity) {
    final theme = Theme.of(context);
    return Builder(builder: (context) {
      return Scaffold(
        appBar: embedded
            ? AppBar(
                backgroundColor: theme.scaffoldBackgroundColor,
                leading: BackButton(),
                title: Text(entity.label),
              )
            : null,
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          children: [
            if (!embedded)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TitlePage(entity: entity.coreEntity, x: true),
              ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: MenuDataTableCustom.prepare(
                entity: entity,
                initialFilters: initialFilters,
              ),
            ),
          ],
        ),
      );
    });
  }
}
