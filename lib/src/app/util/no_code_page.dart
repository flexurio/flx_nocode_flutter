import 'package:flutter/material.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/src/app/util/flavor_config_ext.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/entity_home.dart';

Widget noCodePage(
  String entityId, {
  bool bypassPermissions = false,
  void Function()? onUnauthorized,
}) {
  return NoCodePageLoader(
    basePath: 'asset/nocode/frontend',
    entityId: entityId,
    getAccess: () => UserRepositoryApp.instance.token ?? '',
    bypassPermission: bypassPermissions,
    onUnauthorized: onUnauthorized ?? AuthenticationRepository.logout,
    getConfiguration: () {
      return flavorConfig.toNoCodeConfig();
    },
  );
}

Future<List<String>> noCodePermissionProvider(String id) async {
  return EntityCustom.getPermissions(id, basePath: 'asset/nocode/frontend');
}

List<String> noCodePermissions(String entityId) {
  final actions = [
    'delete',
    'write',
    'read',
    'execute',
    'open_close',
    'export',
    'approve_reject',
    'view_menu',
  ];
  return actions.map((action) => '${entityId}_$action').toList();
}
