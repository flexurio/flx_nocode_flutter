// lib/core/utils/js/src/js_variable_provider.dart

import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';

/// Provides variables from context, configuration, and system state.
class JsVariableProvider {
  Map<String, dynamic> prepare([Map<String, dynamic>? variables]) {
    Configuration? config;
    try {
      config = Configuration.instance;
    } catch (_) {}

    UserRepositoryApp? userRepo;
    try {
      userRepo = UserRepositoryApp.instance;
    } catch (_) {}

    final allVars = <String, dynamic>{
      // 1. Context variables
      if (variables != null) ...{
        ...variables,
        if (!variables.containsKey('form'))
          'form': variables['form'] ?? variables,
        if (!variables.containsKey('record'))
          'record': variables['record'] ?? variables['data'] ?? variables,
        if (!variables.containsKey('vars')) 'vars': variables['vars'] ?? {},
        if (!variables.containsKey('data'))
          'data': variables['data'] ?? variables,
        if (!variables.containsKey('current'))
          'current': variables['current'] ?? variables['data'] ?? variables,
        if (!variables.containsKey('http')) 'http': variables['http'] ?? {},
      },

      // 2. Custom global variables
      if (config != null)
        for (final v in config.variables) v.key: v.value,

      // 3. System variables
      'auth_token': userRepo?.token ?? '',
      'user_id': userRepo?.userApp?.id?.toString() ?? '',
      'backend_host': config?.backendHost ?? '',
    };

    return allVars;
  }
}
