import 'package:easy_localization/easy_localization.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/model/entity.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/entity_home.dart';
import 'package:flutter/material.dart';

class NoCode {
  static Future<void> init() async {
    storageInit('no-code');
    await EasyLocalization.ensureInitialized();
    await Configuration.load();
    final configuration = Configuration.instance;
    flavorConfig = configuration.flavorConfig;
  }

  static Future<void> setAuth(String accessToken) async {
    final data = extractPayloadFromJwt(accessToken);
    final permission = Access.fetchPermissions(data['rl'] as String);
    UserRepositoryApp.instance.setUserFromJwt(accessToken, permission);
  }

  static Map<String, dynamic> pageData = {};

  static navigatePushMenu({
    required BuildContext context,
    required String entityId,
    required Map<String, dynamic> pageData,
  }) async {
    NoCode.pageData = pageData;
    final primaryColor = Configuration.instance.flavorConfig.color;
    final app = NoCode.app(
      child: MenuCustom.fromId(
        entityId: entityId,
        embedded: true,
        firstPage: true,
      ),
      primaryColor: primaryColor,
    );
    await Navigator.push(context, MaterialPageRoute(builder: (_) => app));
  }

  static navigatePushCreate({
    required BuildContext context,
    required String entityId,
  }) async {
    final entity = await EntityCustom.getEntity(entityId);
    if (entity == null) {
      throw Exception('entity $entityId not found');
    }
    // EntityCreatePage.route(
    //   entity: entity,
    //   data: data,
    //   onSuccess: () => onRefresh(context),
    // );
  }

  static Widget app({
    required Widget child,
    required Color primaryColor,
    String prefixPathTranslation = '',
  }) {
    return EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('id')],
      path: '${prefixPathTranslation}asset/translation',
      fallbackLocale: const Locale('en'),
      child: Builder(builder: (context) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: MyTheme.getTheme(
            primaryColor,
            ThemeMode.light,
          ),
          home: Scaffold(body: child),
        );
      }),
    );
  }
}
