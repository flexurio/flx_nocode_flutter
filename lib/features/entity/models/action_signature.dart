/// Represents a selectable signature meaning option with separate [label] and [value].
class SignatureMeaningOption {
  final String label;
  final String value;

  const SignatureMeaningOption({
    required this.label,
    required this.value,
  });

  factory SignatureMeaningOption.fromJson(dynamic json) {
    if (json is Map) {
      final value = (json['value'] ?? json['id'] ?? json['code'] ?? json['label'] ?? '')
          .toString()
          .trim();
      final label = (json['label'] ?? json['name'] ?? json['title'] ?? value)
          .toString()
          .trim();
      return SignatureMeaningOption(
        label: label.isNotEmpty ? label : value,
        value: value.isNotEmpty ? value : label,
      );
    }
    final str = json.toString().trim();
    return SignatureMeaningOption(label: str, value: str);
  }

  dynamic toJson() {
    if (label == value) return value;
    return {'label': label, 'value': value};
  }
}

/// Configuration model for Action E-Signature.
///
/// When attached to an [ActionD] or layout form submit, prompts the user
/// to select an electronic signature meaning and confirm their password
/// before executing the action/workflow.
class ActionSignature {
  final List<String> _rawMeanings;
  final List<SignatureMeaningOption>? _meaningOptions;

  /// Available signature meaning options (supports string or {label, value}).
  List<SignatureMeaningOption> get meaningOptions {
    if (_meaningOptions != null && _meaningOptions.isNotEmpty) {
      return _meaningOptions;
    }
    if (_rawMeanings.isNotEmpty) {
      return _rawMeanings
          .map((m) => SignatureMeaningOption(label: m, value: m))
          .toList(growable: false);
    }
    return const [SignatureMeaningOption(label: 'Disetujui', value: 'Disetujui')];
  }

  /// Available signature meaning values (e.g., ["Disetujui", "Ditinjau", "Ditolak"]).
  List<String> get meanings => meaningOptions.map((e) => e.value).toList();

  /// Default pre-selected meaning. If null, defaults to first meaning or 'Disetujui'.
  final String? defaultMeaning;

  /// Custom endpoint to verify password.
  /// Defaults to `/auth/verify-password` or uses standard basic auth login verification.
  final String? verifyUrl;

  /// Custom prompt title for the dialog.
  final String? title;

  /// Custom prompt description for the dialog.
  final String? description;

  /// Whether meaning selection is required (defaults to true).
  final bool requireMeaning;

  /// Whether password input is required (defaults to true).
  final bool requirePassword;

  const ActionSignature({
    List<String> meanings = const ['Disetujui'],
    List<SignatureMeaningOption>? meaningOptions,
    this.defaultMeaning,
    this.verifyUrl,
    this.title,
    this.description,
    this.requireMeaning = true,
    this.requirePassword = true,
  })  : _rawMeanings = meanings,
        _meaningOptions = meaningOptions;

  factory ActionSignature.fromJson(dynamic json) {
    if (json == null) return const ActionSignature();

    if (json is bool) {
      return const ActionSignature();
    }

    if (json is Map) {
      final map = Map<String, dynamic>.from(json);
      final rawMeanings = map['meanings'] ?? map['meaning_options'];
      List<SignatureMeaningOption> parsedMeanings = const [
        SignatureMeaningOption(label: 'Disetujui', value: 'Disetujui'),
      ];

      if (rawMeanings is List) {
        parsedMeanings = rawMeanings
            .map(SignatureMeaningOption.fromJson)
            .where((e) => e.value.isNotEmpty)
            .toList();
        if (parsedMeanings.isEmpty) {
          parsedMeanings = const [
            SignatureMeaningOption(label: 'Disetujui', value: 'Disetujui'),
          ];
        }
      } else if (rawMeanings is String && rawMeanings.isNotEmpty) {
        parsedMeanings = [SignatureMeaningOption.fromJson(rawMeanings)];
      }

      return ActionSignature(
        meaningOptions: parsedMeanings,
        defaultMeaning: map['default_meaning']?.toString() ??
            map['defaultMeaning']?.toString() ??
            (parsedMeanings.isNotEmpty ? parsedMeanings.first.value : null),
        verifyUrl: map['verify_url']?.toString() ?? map['verifyUrl']?.toString(),
        title: map['title']?.toString(),
        description: map['description']?.toString(),
        requireMeaning: map['require_meaning'] ?? map['requireMeaning'] ?? true,
        requirePassword: map['require_password'] ?? map['requirePassword'] ?? true,
      );
    }

    return const ActionSignature();
  }

  Map<String, dynamic> toJson() {
    return {
      'meanings': meaningOptions.map((e) => e.toJson()).toList(),
      if (defaultMeaning != null) 'default_meaning': defaultMeaning,
      if (verifyUrl != null) 'verify_url': verifyUrl,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      'require_meaning': requireMeaning,
      'require_password': requirePassword,
    };
  }

  ActionSignature copyWith({
    List<SignatureMeaningOption>? meaningOptions,
    String? defaultMeaning,
    String? verifyUrl,
    String? title,
    String? description,
    bool? requireMeaning,
    bool? requirePassword,
  }) {
    return ActionSignature(
      meaningOptions: meaningOptions ?? this.meaningOptions,
      defaultMeaning: defaultMeaning ?? this.defaultMeaning,
      verifyUrl: verifyUrl ?? this.verifyUrl,
      title: title ?? this.title,
      description: description ?? this.description,
      requireMeaning: requireMeaning ?? this.requireMeaning,
      requirePassword: requirePassword ?? this.requirePassword,
    );
  }
}

/// Represents the verified e-signature result token and metadata.
class SignatureResult {
  final String token;
  final String meaning;
  final String signerName;
  final String signerNip;
  final DateTime signedAt;

  const SignatureResult({
    required this.token,
    required this.meaning,
    required this.signerName,
    required this.signerNip,
    required this.signedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'signature_token': token,
      'meaning': meaning,
      'signer_name': signerName,
      'signer_nip': signerNip,
      'signed_at': signedAt.toIso8601String(),
    };
  }
}
