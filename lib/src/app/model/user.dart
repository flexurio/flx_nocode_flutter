import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';

class UserApp extends User {
  UserApp({
    required super.id,
    required super.name,
    required this.role,
  }) : super();

  factory UserApp.fromJson(Map<String, dynamic> json) {
    final idRaw = json['id'];
    int parsedId = 0;
    if (idRaw is int) {
      parsedId = idRaw;
    } else if (idRaw is String) {
      parsedId = int.tryParse(idRaw) ?? 0;
    }

    return UserApp(
      id: parsedId,
      name: (json['nm'] ?? json['name'] ?? '').toString(),
      role: (json['cs'] ?? json['role'] ?? '').toString(),
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
