import 'package:flexurio_no_code/src/app/model/entity.dart';
import 'package:flexurio_no_code/src/app/view/page/entity_create/entity_create_page.dart';
import 'package:flexurio_no_code/src/app/view/widget/entity_home.dart';
import 'package:flutter/material.dart';

class NoCode {
  static navigatePushMenu({
    required BuildContext context,
    required String entityId,
  }) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MenuCustom(entityId: entityId),
      ),
    );
  }

  static navigatePushCreate({
    required BuildContext context,
    required String entityId,
  }) async {
    final entity = await EntityCustom.getEntity(entityId);
    if (entity == null) {
      throw Exception('entity $entityId not found');
    }
    EntityCreatePage.route(
      entity: entity,
      data: data,
      onSuccess: () => onRefresh(context),
    );
  }
}
