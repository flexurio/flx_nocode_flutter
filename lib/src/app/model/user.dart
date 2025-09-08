import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';

class UserApp extends User {
  UserApp({
    required super.id,
    required super.name,
    required this.role,
  }) : super();

  factory UserApp.fromJson(Map<String, dynamic> json) {
    return UserApp(
      id: int.parse(json['id'] as String),
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
