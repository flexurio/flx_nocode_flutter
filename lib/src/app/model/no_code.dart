import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/model/entity.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/entity_home.dart';
import 'package:flutter/material.dart';

class NoCode {
  static Future<void> init() async {
    await EasyLocalization.ensureInitialized();
    await Configuration.load();
    final configuration = Configuration.instance;
    flavorConfig = configuration.flavorConfig;
  }

  static navigatePushMenu({
    required BuildContext context,
    required String entityId,
  }) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('id')],
          path: 'asset/translation',
          fallbackLocale: const Locale('en'),
          child: Builder(builder: (context) {
            return MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: MyTheme.getTheme(
                Configuration.instance.flavorConfig.color,
                ThemeMode.light,
              ),
              home: Scaffold(
                body: MenuCustom(
                  entityId: entityId,
                  embedded: true,
                  firstPage: true,
                ),
              ),
            );
          }),
        ),
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
    // EntityCreatePage.route(
    //   entity: entity,
    //   data: data,
    //   onSuccess: () => onRefresh(context),
    // );
  }
}
