import 'dart:convert';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_nocode_flutter/core/access/access_policy_evaluator.dart';

class UserAppNocode extends User {
  UserAppNocode({
    required super.id,
    required super.name,
    required this.role,
    String? rawId,
    List<String>? roles,
    List<String>? capabilities,
    Map<String, dynamic>? claims,
  })  : rawId = (rawId != null && rawId.isNotEmpty)
            ? rawId
            : (id != null && id != 0 ? id.toString() : ''),
        roles = List.unmodifiable(roles ?? _extractRolesFromMap(claims, role)),
        capabilities = List.unmodifiable(
          capabilities ?? _extractCapabilitiesFromMap(claims),
        ),
        claims = Map.unmodifiable(_normalizeClaims(claims)),
        super();

  factory UserAppNocode.fromJson(Map<String, dynamic> json) {
    final idRaw = json['id'] ?? json['sub'];
    int parsedId = 0;
    String rawIdStr = '';
    if (idRaw is int) {
      parsedId = idRaw;
      rawIdStr = idRaw.toString();
    } else if (idRaw is String) {
      rawIdStr = idRaw;
      parsedId = int.tryParse(idRaw) ?? 0;
    } else if (idRaw != null) {
      rawIdStr = idRaw.toString();
    }

    final normalizedClaims = _normalizeClaims(json);
    final roleStr = (json['cs'] ?? json['role'] ?? '').toString();
    final extractedRoles = _extractRolesFromMap(normalizedClaims, roleStr);
    final extractedCapabilities = _extractCapabilitiesFromMap(normalizedClaims);

    return UserAppNocode(
      id: parsedId,
      rawId: rawIdStr,
      name: (json['nm'] ?? json['name'] ?? '').toString(),
      role: roleStr,
      roles: extractedRoles,
      capabilities: extractedCapabilities,
      claims: normalizedClaims,
    );
  }

  /// Legacy string field mapped from `cs` or `role`.
  final String role;

  /// Original string representation of the user ID from JWT (`id` or `sub`),
  /// preserving non-numeric IDs when applicable.
  final String rawId;

  /// Normalized list of role identifiers extracted from JWT (`rl`, `roles`, `role`).
  final List<String> roles;

  /// Normalized list of effective capabilities extracted from JWT
  /// (`capabilities`, `cap`, `permissions`, `perms`, `scopes`, `scope`).
  final List<String> capabilities;

  /// Complete map of decoded JWT claims (including any nested JSON object inside `cs`).
  final Map<String, dynamic> claims;

  /// Checks whether this user holds [roleName].
  bool hasRole(String roleName) {
    final target = roleName.trim();
    if (target.isEmpty) return false;
    return roles.contains(target);
  }

  /// Resolves a dynamic claim or attribute by [key].
  dynamic operator [](String key) => toContextMap()[key];

  /// Builds the unified, dynamic `user` context map for JS interpolation,
  /// Rule evaluation, and workflow scopes.
  ///
  /// Spreads all raw JWT claims first (and any JSON keys parsed from `cs`),
  /// then overlays normalized standard identity fields so `user.<claim>` works
  /// dynamically for any claim present in the JWT token.
  Map<String, dynamic> toContextMap({
    String? token,
    List<String>? permissions,
    List<String>? capabilitiesOverride,
  }) {
    final effectiveId = rawId.isNotEmpty
        ? rawId
        : (id != null ? id.toString() : '');
    final csRaw = claims['cs'];
    final customValue = csRaw != null ? csRaw : role;
    final effectiveCaps = capabilitiesOverride ?? capabilities;

    return <String, dynamic>{
      // 1. All raw JWT claims (e.g. nip, email, department_id, site_id, sub, etc.)
      ...claims,
      // 2. Normalized standard user properties
      'id': effectiveId,
      'name': name,
      'nm': name,
      'role': role.isNotEmpty
          ? role
          : (roles.isNotEmpty ? roles.first : ''),
      'roles': roles,
      'capabilities': effectiveCaps,
      'cs': customValue,
      'custom': customValue,
      if (!claims.containsKey('nip') &&
          customValue is String &&
          customValue.isNotEmpty)
        'nip': customValue,
      if (token != null) 'token': token,
      if (permissions != null) 'permissions': permissions,
      'claims': claims,
    };
  }

  static Map<String, dynamic> _normalizeClaims(Map<String, dynamic>? raw) {
    if (raw == null || raw.isEmpty) return const <String, dynamic>{};
    final result = Map<String, dynamic>.from(raw);

    // If `cs` (custom claim) is a serialized JSON object, unpack its keys
    // as top-level claims (without overwriting explicit root claims) so
    // `user.<custom_key>` works seamlessly.
    final csVal = raw['cs'];
    if (csVal is String) {
      final trimmed = csVal.trim();
      if (trimmed.startsWith('{') && trimmed.endsWith('}')) {
        try {
          final decoded = jsonDecode(trimmed);
          if (decoded is Map) {
            result['cs_data'] = Map<String, dynamic>.from(decoded);
            for (final entry in decoded.entries) {
              final k = entry.key.toString();
              if (!result.containsKey(k)) {
                result[k] = entry.value;
              }
            }
          }
        } catch (_) {}
      }
    } else if (csVal is Map) {
      for (final entry in csVal.entries) {
        final k = entry.key.toString();
        if (!result.containsKey(k)) {
          result[k] = entry.value;
        }
      }
    }

    return result;
  }

  static List<String> _extractRolesFromMap(
    Map<String, dynamic>? json,
    String fallbackRole,
  ) {
    final collected = <String>[];

    void addRoleToken(dynamic rawToken) {
      if (rawToken == null) return;
      if (rawToken is Iterable) {
        for (final item in rawToken) {
          addRoleToken(item);
        }
        return;
      }
      final str = rawToken.toString().trim();
      if (str.isEmpty) return;

      // Handle JSON array strings if encoded inside a claim string
      if (str.startsWith('[') && str.endsWith(']')) {
        try {
          final decoded = jsonDecode(str);
          if (decoded is Iterable) {
            addRoleToken(decoded);
            return;
          }
        } catch (_) {}
      }

      for (final segment in str.split(',')) {
        final cleaned = segment.trim();
        if (cleaned.isEmpty) continue;
        // Strip bitmask suffix if present (e.g. "plant_qa_manager/127" -> "plant_qa_manager")
        // Ignore wildcard bitmask placeholders like "*/127"
        final baseRole = cleaned.split('/').first.trim();
        if (baseRole.isEmpty || baseRole == '*') continue;
        if (!collected.contains(baseRole)) {
          collected.add(baseRole);
        }
      }
    }

    if (json != null) {
      addRoleToken(json['rl']);
      addRoleToken(json['roles']);
      addRoleToken(json['role']);
    }

    if (collected.isEmpty && fallbackRole.isNotEmpty) {
      addRoleToken(fallbackRole);
    }

    return collected;
  }

  static List<String> _extractCapabilitiesFromMap(Map<String, dynamic>? json) {
    if (json == null || json.isEmpty) return const [];
    final combined = <String>{};
    for (final key in const [
      'capabilities',
      'cap',
      'permissions',
      'perms',
      'scopes',
      'scope',
    ]) {
      if (json.containsKey(key) && json[key] != null) {
        combined.addAll(AccessPolicyEvaluator.normalizeCapabilities(json[key]));
      }
    }
    return List<String>.unmodifiable(combined);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...claims,
      'id': id,
      'nm': name,
      'cs': role,
      if (roles.isNotEmpty) 'roles': roles,
      if (capabilities.isNotEmpty) 'capabilities': capabilities,
    };
  }
}
