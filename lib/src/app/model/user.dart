import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';

class UserApp extends User {
  UserApp({
    required super.id,
    required this.nip,
    required super.name,
    required this.role,
  }) : super();

  factory UserApp.fromJson(Map<String, dynamic> json) {
    final nip = json['nip'] as String;
    return UserApp(
      nip: nip,
      id: json['id'] as int,
      name: json['name'] as String,
      role: json['role'] as String,
    );
  }

  final String nip;
  final String role;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nip': nip,
      'name': name,
      'role': role,
    };
  }
}
