/// Configuration for the centralized 2-layer access control engine.
///
/// Layer 1 (Single Source of Truth): Server-driven capabilities/permissions
/// loaded from the backend (`capabilities_endpoint`) or embedded in JWT claims.
///
/// Layer 2 (UI Policy / ABAC): Declarative `Rule` expressions evaluated
/// hierarchically on `menu_group`, `menu`, `menu_sub`, `actions`, `actions_home`,
/// and `homeActionForms`.
class AccessControlConfig {
  const AccessControlConfig({
    this.bypassAllPermissions = false,
    this.capabilitiesEndpoint,
    this.autoCheckEntityRead = true,
    this.defaultAllowWhenUnrestricted = true,
    this.allowRoleAsPermissionFallback = false,
  });

  /// Global escape hatch for local development / studio preview.
  /// Secure by default (`false`).
  final bool bypassAllPermissions;

  /// Optional backend endpoint returning the authenticated user's effective
  /// capabilities derived from `rules.json` (e.g. `{{backend_host}}/auth/capabilities`).
  final String? capabilitiesEndpoint;

  /// When capabilities have been loaded from backend or JWT, automatically
  /// require read capability (`<entity>:read` / `<entity>_read`) for each
  /// `MenuSub` targeting that entity — eliminating role duplication in
  /// `configuration.json`.
  final bool autoCheckEntityRead;

  /// Whether items without explicit capability requirements or rules are shown
  /// when no backend capability matrix is active.
  final bool defaultAllowWhenUnrestricted;

  /// Keeps Role vs Permission semantically separated by default (`false`).
  /// Set to `true` only when migrating legacy configs that place role names
  /// inside `permission` fields instead of `rule`.
  final bool allowRoleAsPermissionFallback;

  factory AccessControlConfig.fromJson(
    Map<String, dynamic>? json, {
    bool? legacyBypass,
  }) {
    if (json == null) {
      return AccessControlConfig(
        bypassAllPermissions: legacyBypass ?? false,
      );
    }

    final rawEndpoint =
        (json['capabilities_endpoint'] ?? json['permissions_endpoint'])
            ?.toString()
            .trim();

    return AccessControlConfig(
      bypassAllPermissions: json['bypass_all_permissions'] == true ||
          json['bypass_permission'] == true ||
          (legacyBypass == true &&
              !json.containsKey('bypass_all_permissions') &&
              !json.containsKey('bypass_permission')),
      capabilitiesEndpoint:
          (rawEndpoint != null && rawEndpoint.isNotEmpty) ? rawEndpoint : null,
      autoCheckEntityRead: json['auto_check_entity_read'] != false,
      defaultAllowWhenUnrestricted:
          json['default_allow_when_unrestricted'] != false,
      allowRoleAsPermissionFallback:
          json['allow_role_as_permission_fallback'] == true,
    );
  }

  AccessControlConfig copyWith({
    bool? bypassAllPermissions,
    String? capabilitiesEndpoint,
    bool? autoCheckEntityRead,
    bool? defaultAllowWhenUnrestricted,
    bool? allowRoleAsPermissionFallback,
  }) {
    return AccessControlConfig(
      bypassAllPermissions: bypassAllPermissions ?? this.bypassAllPermissions,
      capabilitiesEndpoint: capabilitiesEndpoint ?? this.capabilitiesEndpoint,
      autoCheckEntityRead: autoCheckEntityRead ?? this.autoCheckEntityRead,
      defaultAllowWhenUnrestricted:
          defaultAllowWhenUnrestricted ?? this.defaultAllowWhenUnrestricted,
      allowRoleAsPermissionFallback:
          allowRoleAsPermissionFallback ?? this.allowRoleAsPermissionFallback,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bypass_all_permissions': bypassAllPermissions,
      if (capabilitiesEndpoint != null)
        'capabilities_endpoint': capabilitiesEndpoint,
      'auto_check_entity_read': autoCheckEntityRead,
      'default_allow_when_unrestricted': defaultAllowWhenUnrestricted,
      if (allowRoleAsPermissionFallback)
        'allow_role_as_permission_fallback': allowRoleAsPermissionFallback,
    };
  }
}
