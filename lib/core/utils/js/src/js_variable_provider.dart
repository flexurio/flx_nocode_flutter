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

    UserRepositoryAppNocode? userRepo;
    try {
      userRepo = UserRepositoryAppNocode.instance;
    } catch (_) {}

    final userContext = userRepo?.userContext ?? const <String, dynamic>{};
    final effectiveUserId = (userContext['id'] ?? '').toString();
    final effectiveUserName = (userContext['name'] ?? '').toString();
    final effectiveRoles = userRepo?.roles ?? const <String>[];
    final effectiveClaims = userRepo?.claims ?? const <String, dynamic>{};
    final effectiveCustom = userContext['cs'] ?? '';

    final allVars = <String, dynamic>{
      // 1. Context variables
      if (variables != null) ...{
        ...variables,
        // Flatten workflow variables for direct access (e.g. {{item.id}})
        if (variables['vars'] is Map) ...variables['vars'],
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
        if (!variables.containsKey('parent'))
          'parent': (variables['parentData'] is List &&
                  (variables['parentData'] as List).isNotEmpty &&
                  (variables['parentData'] as List).last is Map)
              ? (variables['parentData'] as List).last
              : <String, dynamic>{},
      },

      // 2. Custom global variables
      if (config != null)
        for (final v in config.variables) v.key: v.value,

      // 3. System & dynamic JWT user context variables
      'user': userContext,
      'jwt': effectiveClaims,
      'auth_token': userRepo?.token ?? '',
      'user_id': effectiveUserId,
      'auth_nik': effectiveUserId,
      'user_name': effectiveUserName,
      'user_roles': effectiveRoles,
      'user_claims': effectiveClaims,
      'user_custom': effectiveCustom,
      'backend_host': config?.backendHost ?? '',
    };

    return allVars;
  }
}
