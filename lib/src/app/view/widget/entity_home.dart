import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flx_nocode_flutter/src/app/model/entity.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/entity_data_table.dart';
import 'package:flutter/material.dart';

class MenuCustom extends StatelessWidget {
  const MenuCustom({
    super.key,
    required this.entityId,
    this.firstPage = false,
    this.embedded = false,
    this.initialFilters = const [],
  });

  final bool firstPage;
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
    return Builder(builder: (context) {
      return Scaffold(
        appBar: embedded ? _buildAppBar(context, entity) : null,
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
                embedded: embedded,
              ),
            ),
          ],
        ),
      );
    });
  }

  AppBar _buildAppBar(BuildContext context, EntityCustom entity) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      leading: BackButton(
        onPressed: () {
          if (firstPage) {
            Navigator.of(context, rootNavigator: true).pop(true);
          } else {
            Navigator.of(context).pop();
          }
        },
      ),
      title: Text(entity.label),
    );
  }
}
