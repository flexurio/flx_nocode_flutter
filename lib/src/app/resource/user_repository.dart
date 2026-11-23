import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/user.dart';
import 'package:hive/hive.dart';

class UserRepositoryAppNocode extends UserRepository {
  static UserRepositoryAppNocode instance = UserRepositoryAppNocode();

  UserAppNocode? userApp;
  String? refreshToken;

  /// Raw decoded JWT payload claims from the active access token.
  Map<String, dynamic> get claims => userApp?.claims ?? const {};

  /// Normalized list of roles from the active access token (`rl` / `roles` / `role`).
  List<String> get roles => userApp?.roles ?? const [];

  /// Unified user context map combining standard fields and all dynamic JWT claims.
  Map<String, dynamic> get userContext =>
      userApp?.toContextMap(
        token: token ?? '',
        permissions: permissions,
      ) ??
      <String, dynamic>{
        'id': '',
        'name': '',
        'nm': '',
        'role': '',
        'roles': const <String>[],
        'cs': '',
        'custom': '',
        'token': token ?? '',
        'permissions': permissions,
        'claims': const <String, dynamic>{},
      };

  @override
  bool checkPermission(String permission) =>
      permissions.contains(permission) || roles.contains(permission);

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
  }) {
    if (accessToken != null) {
      token = accessToken;
    }
    userApp = UserAppNocode.fromJson(claimsPayload);
    user = userApp;
    if (permission != null) {
      permissions = permission;
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
  }
}
