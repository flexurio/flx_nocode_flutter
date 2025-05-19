import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/user.dart';
import 'package:hive/hive.dart';

class UserRepositoryApp extends UserRepository {
  static UserRepositoryApp instance = UserRepositoryApp();

  UserApp? userApp;

  @override
  bool checkPermission(String permission) => permissions.contains(permission);

  @override
  void setUserFromJwt(
    String accessToken,
    List<String> permission,
  ) {
    token = accessToken;
    final userPayload = extractPayloadFromJwt(accessToken);
    userApp = UserApp.fromJson(userPayload);
    permissions = permission;

    () async {
      final userRepository = await Hive.openBox<dynamic>('user_repository');
      await userRepository.put(
        'permission',
        Permission.toListString(permissions),
      );
    }();
  }

  @override
  void unset() {
    token = null;
    user = null;
  }
}
