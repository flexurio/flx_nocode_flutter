import 'package:appointment/constant/user_department.dart';

String? findDepartmentByNip(String? nip) {
  if (userDepartment.containsKey(nip)) {
    return userDepartment[nip];
  }
  return null;
}
