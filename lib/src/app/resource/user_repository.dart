import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/model/user.dart';
import 'package:appointment/src/app/util/department.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:hive/hive.dart';

class UserRepositoryApp extends UserRepository {
  static UserRepositoryApp instance = UserRepositoryApp();

  UserApp? userApp;
  Department? get department {
    if (departments.isEmpty) {
      return null;
    }
    return departments.first;
  }

  List<Department> departments = [];

  String? get departmentTicket => findDepartmentByNip(userApp?.nip ?? '');

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

  static Map<String, dynamic> dataAdapterFromInstance(List<Department> data) {
    return {
      'departments': data.map((e) {
        return {
          'id': e.id,
          'name': e.name,
        };
      }).toList(),
    };
  }

  void dataAdapterSetup(Map<String, dynamic> data) {
    try {
      final departments = data['departments'] as List<dynamic>?;
      if (departments != null) {
        this.departments = departments
            .cast<Map<String, dynamic>>()
            .map(
              (e) => Department.empty().copyWith(
                id: e['id'] as String,
                name: e['name'] as String,
              ),
            )
            .toList();
      }
    } catch (e) {
      departments = [];
    }
  }
}
