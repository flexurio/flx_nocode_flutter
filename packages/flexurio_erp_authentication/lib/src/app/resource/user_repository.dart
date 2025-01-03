import 'package:flexurio_erp_authentication/src/app/model/user.dart';

abstract class UserRepository {
  User? user;
  String? token;
  List<String> permissions = [];

  bool checkPermission(String permission) => permissions.contains(permission);

  void setUserFromJwt(String accessToken, List<String> permission);

  void unset() {
    token = null;
    user = null;
  }
}
