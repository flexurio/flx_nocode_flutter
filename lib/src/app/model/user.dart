import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';

class UserApp extends User {
  UserApp({
    required super.id,
    required super.name,
    required this.role,
  }) : super();

  factory UserApp.fromJson(Map<String, dynamic> json) {
    return UserApp(
      id: json['id'] as int,
      name: json['nm'] as String,
      role: json['cs'] as String,
    );
  }

  final String role;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nm': name,
      'cs': role,
    };
  }
}
