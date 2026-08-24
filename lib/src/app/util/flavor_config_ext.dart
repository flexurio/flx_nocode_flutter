import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/model/theme.dart';

extension FlavorConfigExt on FlavorConfig {
  Configuration toNoCodeConfig() {
    return Configuration(
      menuGroups: [],
      company: Company.empty(),
      theme: ThemeC(),
      appName: '',
      backendHost: apiUrl,
      logoUrl: 'asset/image/logo-company-$companyId.png',
      logoNamedUrl: 'asset/image/logo-name-company-$companyId.png',
      authUrl: '',
      entityRegistration: null,
      preload: [],
      showLandingPage: false,
    );
  }
}
