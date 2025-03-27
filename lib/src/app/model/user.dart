import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';

class UserApp extends User {
  UserApp({
    required super.id,
    required super.name,
  }) : super();

  factory UserApp.fromJson(Map<String, dynamic> json) {
    return UserApp(
      id: json['idu'] as int,
      name: json['name'] as String,
      // role: json['role'] as String,
    );
  }

  // final String role;

  @override
  Map<String, dynamic> toJson() {
    return {
      'idu': id,
      'name': name,
    };
  }
}
