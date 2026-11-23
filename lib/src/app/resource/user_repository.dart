import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_nocode_flutter/core/access/access_policy_evaluator.dart';
import 'package:flx_nocode_flutter/features/field/domain/reference_label_cache.dart';
import 'package:flx_nocode_flutter/src/app/model/user.dart';
import 'package:hive/hive.dart';

class UserRepositoryAppNocode extends UserRepository {
  static UserRepositoryAppNocode instance = UserRepositoryAppNocode();

  UserAppNocode? userApp;
  String? refreshToken;

  List<String> _capabilities = const [];
  bool _capabilitiesExplicitlyLoaded = false;

  /// Raw decoded JWT payload claims from the active access token.
  Map<String, dynamic> get claims => userApp?.claims ?? const {};

  /// Normalized list of roles from the active access token (`rl` / `roles` / `role`).
  List<String> get roles => userApp?.roles ?? const [];

  /// Server-driven or JWT-embedded effective capabilities (Single Source of Truth).
  List<String> get capabilities => _capabilities;

  /// Unified, deduplicated effective capabilities combining server-driven
  /// [capabilities] and legacy [permissions].
  List<String> get effectiveCapabilities {
    final merged = <String>{
      ..._capabilities,
      ...AccessPolicyEvaluator.normalizeCapabilities(permissions),
    };
    return List<String>.unmodifiable(merged);
  }

  /// Whether a capability set has been explicitly loaded from backend, JWT
  /// capability claims, or non-empty legacy permissions.
  bool get hasCapabilitiesLoaded =>
      _capabilitiesExplicitlyLoaded ||
      _capabilities.isNotEmpty ||
      permissions.isNotEmpty;

  /// Unified user context map combining standard fields and all dynamic JWT claims.
  Map<String, dynamic> get userContext =>
      userApp?.toContextMap(
        token: token ?? '',
        permissions: permissions,
        capabilitiesOverride: effectiveCapabilities,
      ) ??
      <String, dynamic>{
        'id': '',
        'name': '',
        'nm': '',
        'role': '',
        'roles': const <String>[],
        'capabilities': effectiveCapabilities,
        'cs': '',
        'custom': '',
        'token': token ?? '',
        'permissions': permissions,
        'claims': const <String, dynamic>{},
      };

  @override
  bool checkPermission(String permission) =>
      AccessPolicyEvaluator(userRepository: this).hasCapability(permission) ||
      permissions.contains(permission) ||
      roles.contains(permission);

  /// Sets server-driven effective capabilities (e.g. from `/auth/capabilities`).
  void setCapabilities(dynamic rawCapabilities) {
    _capabilities = AccessPolicyEvaluator.normalizeCapabilities(rawCapabilities);
    _capabilitiesExplicitlyLoaded = true;
  }

  @override
  void setUserFromJwt(
    String accessToken,
    List<String> permission, {
    String? refreshToken,
  }) {
    token = accessToken;
    this.refreshToken = refreshToken;
    final userPayload = extractPayloadFromJwt(accessToken);
    userApp = UserAppNocode.fromJson(userPayload);
    user = userApp;
    _capabilities = userApp?.capabilities ?? const [];
    _capabilitiesExplicitlyLoaded = _capabilities.isNotEmpty;
    if (permission.isNotEmpty) {
      permissions = permission;
      setPermissions(permission);
    }
  }

  /// Directly sets the active user from a decoded JWT payload map (useful for tests/widgetbook).
  void setUserFromClaims(
    Map<String, dynamic> claimsPayload, {
    String? accessToken,
    List<String>? permission,
    dynamic capabilities,
  }) {
    if (accessToken != null) {
      token = accessToken;
    }
    userApp = UserAppNocode.fromJson(claimsPayload);
    user = userApp;
    if (capabilities != null) {
      setCapabilities(capabilities);
    } else {
      _capabilities = userApp?.capabilities ?? const [];
      _capabilitiesExplicitlyLoaded = _capabilities.isNotEmpty;
    }
    if (permission != null) {
      permissions = permission;
    } else {
      permissions = <String>[];
    }
  }

  Future<void> setPermissions(List<String> permission) async {
    try {
      permissions = permission;
      final userRepository = await Hive.openBox<dynamic>('user_repository');
      await userRepository.put(
        'permission',
        permissions,
      );
      print('[UserRepositoryAppNocode] setPermissions');
    } catch (e) {
      print('[UserRepositoryAppNocode] error $e');
    }
  }

  @override
  void unset() {
    token = null;
    refreshToken = null;
    user = null;
    userApp = null;
    permissions = <String>[];
    _capabilities = const [];
    _capabilitiesExplicitlyLoaded = false;
    ReferenceLabelCache.instance.clear();
  }
}
