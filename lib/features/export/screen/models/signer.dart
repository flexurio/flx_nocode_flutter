class Signer {
  final String role;
  final String name;

  Signer({required this.role, required this.name});

  factory Signer.fromJson(Map<String, dynamic> json) {
    return Signer(
      role: json['role'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'role': role,
        'name': name,
      };
}
