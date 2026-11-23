import 'package:flutter/foundation.dart';
import 'package:flx_nocode_flutter/core/access/access_control_config.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/entity/models/rule.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';

/// Centralized, synchronous, single-source-of-truth access control evaluator.
///
/// Combines two cleanly separated layers:
/// - **Layer 1 (Capabilities / Permissions)**: Server-driven effective
///   capabilities from backend (`rules.json`) or JWT claims. Supports canonical
///   `entity:action` and `entity_action` formats plus wildcards (`entity:*`, `*`).
/// - **Layer 2 (Declarative `Rule` / ABAC & UI Policy)**: Native Dart `Rule`
///   evaluation against `user.roles`, `user.capabilities`, `user.<claim>`, and
///   record/parent data — applied uniformly to menus, actions, and forms.
class AccessPolicyEvaluator {
  AccessPolicyEvaluator({
    UserRepositoryAppNocode? userRepository,
    AccessControlConfig? config,
  })  : _userRepository = userRepository,
        _configOverride = config;

  static final AccessPolicyEvaluator instance = AccessPolicyEvaluator();

  final UserRepositoryAppNocode? _userRepository;
  final AccessControlConfig? _configOverride;

  UserRepositoryAppNocode get _repo =>
      _userRepository ?? UserRepositoryAppNocode.instance;

  AccessControlConfig get config {
    if (_configOverride != null) return _configOverride;
    try {
      return Configuration.instance.accessControl;
    } catch (_) {
      return const AccessControlConfig();
    }
  }

  /// Normalizes any supported capability payload into a deduplicated list of
  /// canonical lowercase capability strings.
  ///
  /// Supported input shapes:
  /// - `List` of strings: `["capas:read", "capas_create", "capas:*"]`
  /// - Comma/space-separated `String`: `"capas:read, capas:create"`
  /// - Structured entity-action `Map`: `{"capas": ["read", "create"]}`
  /// - Wrapper `Map`: `{"capabilities": [...]}` / `{"permissions": [...]}` / `{"data": ...}`
  static List<String> normalizeCapabilities(dynamic raw) {
    if (raw == null) return const [];
    final result = <String>{};

    void addToken(String token) {
      final cleaned = token.trim();
      if (cleaned.isEmpty) return;
      result.add(cleaned);
    }

    void collect(dynamic value) {
      if (value == null) return;
      if (value is String) {
        final trimmed = value.trim();
        if (trimmed.isEmpty) return;
        for (final part in trimmed.split(RegExp(r'[\s,]+'))) {
          addToken(part);
        }
        return;
      }
      if (value is Iterable) {
        for (final item in value) {
          collect(item);
        }
        return;
      }
      if (value is Map) {
        // Unwrap common API envelope keys first
        if (value.containsKey('capabilities')) {
          collect(value['capabilities']);
          return;
        }
        if (value.containsKey('permissions')) {
          collect(value['permissions']);
          return;
        }
        if (value.containsKey('data') && value.length <= 3) {
          collect(value['data']);
          return;
        }

        // Structured entity -> operations map: { "capas": ["read", "create"] }
        for (final entry in value.entries) {
          final entityKey = entry.key.toString().trim();
          if (entityKey.isEmpty) continue;
          final ops = entry.value;
          if (ops is Iterable) {
            for (final op in ops) {
              final opStr = op?.toString().trim() ?? '';
              if (opStr.isNotEmpty) {
                addToken('$entityKey:$opStr');
              }
            }
          } else if (ops is Map) {
            for (final opEntry in ops.entries) {
              if (opEntry.value == true) {
                final opStr = opEntry.key.toString().trim();
                if (opStr.isNotEmpty) {
                  addToken('$entityKey:$opStr');
                }
              }
            }
          } else if (ops == true) {
            addToken('$entityKey:*');
          } else if (ops is String && ops.trim().isNotEmpty) {
            for (final op in ops.split(RegExp(r'[\s,]+'))) {
              final opStr = op.trim();
              if (opStr.isNotEmpty) {
                addToken('$entityKey:$opStr');
              }
            }
          }
        }
      }
    }

    collect(raw);
    return List<String>.unmodifiable(result);
  }

  /// Parses `permission` / `permissions` JSON fields (single string or list)
  /// into a clean list of required permission strings.
  static List<String> parsePermissionList(dynamic raw) {
    if (raw == null) return const [];
    if (raw is String) {
      final trimmed = raw.trim();
      if (trimmed.isEmpty) return const [];
      return List<String>.unmodifiable(
        trimmed
            .split(',')
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty),
      );
    }
    if (raw is Iterable) {
      return List<String>.unmodifiable(
        raw
            .map((e) => e?.toString().trim() ?? '')
            .where((e) => e.isNotEmpty),
      );
    }
    return const [];
  }

  /// Effective capabilities held by the active user.
  List<String> get effectiveCapabilities => _repo.effectiveCapabilities;

  /// Whether a capability set has been explicitly loaded (from backend
  /// endpoint, JWT capability claims, or legacy permissions).
  bool get hasCapabilitiesLoaded => _repo.hasCapabilitiesLoaded;

  /// Checks whether the user holds [requiredCapability].
  ///
  /// Matches:
  /// - Exact match (case-insensitive)
  /// - Canonical separator equivalence (`capas:read` <-> `capas_read`)
  /// - Wildcards (`*`, `*:*`, `<entity>:*`, `<entity>_*`)
  /// - Explicit `role:<role_name>` prefix (or direct role match when
  ///   `config.allowRoleAsPermissionFallback` is enabled).
  bool hasCapability(String requiredCapability) {
    final target = requiredCapability.trim();
    if (target.isEmpty) return true;

    final targetLower = target.toLowerCase();

    // Explicit `role:<name>` prefix support
    if (targetLower.startsWith('role:')) {
      final roleName = target.substring(5).trim();
      return _repo.roles.any((r) => r.toLowerCase() == roleName.toLowerCase());
    }

    final caps = effectiveCapabilities;
    final targetCanonical = _canonicalize(targetLower);
    final targetEntity = _extractEntityPrefix(targetCanonical);

    for (final cap in caps) {
      final capLower = cap.trim().toLowerCase();
      if (capLower.isEmpty) continue;
      if (capLower == '*' || capLower == '*:*') return true;
      if (capLower == targetLower) return true;

      final capCanonical = _canonicalize(capLower);
      if (capCanonical == targetCanonical) return true;

      // Entity-level wildcard: `capas:*` matches `capas:read` / `capas_read`
      if (targetEntity != null && capCanonical == '$targetEntity:*') {
        return true;
      }
    }

    if (config.allowRoleAsPermissionFallback) {
      return _repo.roles.any((r) => r.toLowerCase() == targetLower);
    }

    return false;
  }

  /// Returns `true` if [requiredCapabilities] is empty or at least one matches.
  bool hasAnyCapability(Iterable<String> requiredCapabilities) {
    final list = requiredCapabilities
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
    if (list.isEmpty) return true;
    return list.any(hasCapability);
  }

  /// Checks whether the user has [operation] capability on [entityId]
  /// (e.g. `capas:read`, `capas_read`, `capas:*`, `*`).
  bool hasEntityCapability(String entityId, String operation) {
    final ent = entityId.trim();
    final op = operation.trim();
    if (ent.isEmpty || op.isEmpty) return true;
    return hasCapability('$ent:$op') || hasCapability('${ent}_$op');
  }

  /// Evaluates a declarative [Rule] against the active user context and data.
  bool evaluateRule(
    Rule? rule, {
    Map<String, dynamic> data = const {},
    List<Map<String, dynamic>>? parentData,
  }) {
    if (rule == null) return true;
    try {
      final evalData = <String, dynamic>{
        ...data,
        if (parentData != null &&
            parentData.isNotEmpty &&
            !data.containsKey('parent'))
          'parent': parentData.last,
        if (parentData != null &&
            parentData.isNotEmpty &&
            !data.containsKey('parentData'))
          'parentData': parentData,
      };
      return rule.evaluate(evalData);
    } catch (e) {
      debugPrint('[AccessPolicyEvaluator] Rule evaluation failed: $e');
      return false; // Fail closed on malformed policy rules
    }
  }

  /// Evaluates whether [group] itself passes group-level policies.
  bool canAccessMenuGroup(
    MenuGroup group, {
    bool? bypassPermission,
  }) {
    final effectiveBypass = bypassPermission ?? config.bypassAllPermissions;
    if (effectiveBypass) return true;

    if (!evaluateRule(group.rule)) return false;
    if (group.permissions.isNotEmpty && !hasAnyCapability(group.permissions)) {
      return false;
    }
    return true;
  }

  /// Evaluates whether [menu] under [group] passes group & menu-level policies.
  bool canAccessMenu(
    MenuGroup group,
    Menu menu, {
    bool? bypassPermission,
  }) {
    final effectiveBypass = bypassPermission ?? config.bypassAllPermissions;
    if (effectiveBypass) return true;

    if (!canAccessMenuGroup(group, bypassPermission: false)) return false;
    if (!evaluateRule(menu.rule)) return false;
    if (menu.permissions.isNotEmpty && !hasAnyCapability(menu.permissions)) {
      return false;
    }
    return true;
  }

  /// Evaluates whether [sub] under [group] -> [menu] is accessible.
  ///
  /// Enforces:
  /// 1. Hierarchical `Rule` inheritance (`group.rule` AND `menu.rule` AND `sub.rule`)
  /// 2. Explicit `permissions` at any level (`group`, `menu`, `sub`)
  /// 3. Single Source of Truth Layer 1: when `config.autoCheckEntityRead` is
  ///    true and capabilities are loaded from backend/JWT, automatically
  ///    requires read capability for `sub.entity` (`<entity>:read` / `<entity>_read`).
  bool canAccessMenuSub(
    MenuGroup group,
    Menu menu,
    MenuSub sub, {
    bool? bypassPermission,
  }) {
    final effectiveBypass = bypassPermission ?? config.bypassAllPermissions;
    if (effectiveBypass) return true;

    if (!canAccessMenu(group, menu, bypassPermission: false)) return false;
    if (!evaluateRule(sub.rule)) return false;

    if (sub.permissions.isNotEmpty) {
      if (!hasAnyCapability(sub.permissions)) return false;
    } else if (config.autoCheckEntityRead &&
        hasCapabilitiesLoaded &&
        sub.entity.trim().isNotEmpty) {
      if (!hasEntityCapability(sub.entity, 'read')) return false;
    }

    return true;
  }

  /// Filters [groups] hierarchically and prunes empty menus and menu groups.
  List<MenuGroup> filterMenuGroups(
    List<MenuGroup> groups, {
    bool? bypassPermission,
  }) {
    final effectiveBypass = bypassPermission ?? config.bypassAllPermissions;
    if (effectiveBypass) return groups;

    final filteredGroups = <MenuGroup>[];
    for (final group in groups) {
      if (!canAccessMenuGroup(group, bypassPermission: false)) continue;

      final filteredMenus = <Menu>[];
      for (final menu in group.menu) {
        if (!canAccessMenu(group, menu, bypassPermission: false)) continue;

        final filteredSubs = menu.menuSub
            .where((sub) =>
                canAccessMenuSub(group, menu, sub, bypassPermission: false))
            .toList();

        if (filteredSubs.isNotEmpty) {
          filteredMenus.add(menu.copyWith(menuSub: filteredSubs));
        }
      }

      if (filteredMenus.isNotEmpty) {
        filteredGroups.add(group.copyWith(menu: filteredMenus));
      }
    }

    return filteredGroups;
  }

  /// Evaluates visibility of an [ActionD] (`actions` or `actions_home`).
  ///
  /// - Layer 2 (`action.rule`): ALWAYS evaluated (business state, SoD, ABAC).
  /// - Layer 1 (`action.explicitPermissions`): evaluated unless bypassed via
  ///   [bypassPermission], `entity.bypassAllPermissions`, or global config.
  bool canAccessAction(
    ActionD action, {
    EntityCustom? entity,
    Map<String, dynamic> data = const {},
    List<Map<String, dynamic>>? parentData,
    bool? bypassPermission,
  }) {
    // Layer 2: Business / ABAC / SoD rule always applies.
    if (!evaluateRule(action.rule, data: data, parentData: parentData)) {
      return false;
    }

    final effectiveBypass = (bypassPermission ?? false) ||
        (entity?.bypassAllPermissions ?? false) ||
        config.bypassAllPermissions;
    if (effectiveBypass) return true;

    // Layer 1: Explicit capabilities/permissions declared on the action.
    final requiredPerms = action.explicitPermissions;
    if (requiredPerms.isNotEmpty) {
      return hasAnyCapability(requiredPerms);
    }

    return config.defaultAllowWhenUnrestricted;
  }

  /// Evaluates built-in CRUD buttons (e.g. Create `write`/`create`, Delete `delete`).
  bool canAccessBuiltInOperation({
    required EntityCustom entity,
    required String operation,
    bool? bypassPermission,
  }) {
    final effectiveBypass = (bypassPermission ?? false) ||
        entity.bypassAllPermissions ||
        config.bypassAllPermissions;
    if (effectiveBypass) return true;

    if (!hasCapabilitiesLoaded) {
      return config.defaultAllowWhenUnrestricted;
    }

    if (hasEntityCapability(entity.id, operation)) return true;
    // Standard alias: `write` <-> `create`
    if (operation == 'write' && hasEntityCapability(entity.id, 'create')) {
      return true;
    }
    if (operation == 'create' && hasEntityCapability(entity.id, 'write')) {
      return true;
    }
    return false;
  }

  /// Evaluates visibility of a [LayoutForm] (e.g. `homeActionForms`).
  bool canAccessLayoutForm(
    LayoutForm form, {
    Map<String, dynamic> data = const {},
    List<Map<String, dynamic>>? parentData,
  }) {
    return evaluateRule(form.visibleIf, data: data, parentData: parentData);
  }

  static String _canonicalize(String value) {
    final colonIdx = value.indexOf(':');
    if (colonIdx > 0) return value;
    final lastUnderscore = value.lastIndexOf('_');
    if (lastUnderscore > 0 && lastUnderscore < value.length - 1) {
      return '${value.substring(0, lastUnderscore)}:${value.substring(lastUnderscore + 1)}';
    }
    return value;
  }

  static String? _extractEntityPrefix(String canonical) {
    final idx = canonical.indexOf(':');
    if (idx <= 0) return null;
    return canonical.substring(0, idx);
  }
}
