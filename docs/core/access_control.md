# Access Control & Visibility Documentation

`flx_nocode_flutter` uses a centralized, synchronous, **2-Layer Access Control Engine** (`AccessPolicyEvaluator`) designed for **Single Source of Truth** authorization and dynamic ABAC/RBAC UI policies.

> **Security Note:** Frontend visibility is a UX & compliance layer. Backend `rules.json` in `flx-nocode-api` remains the authoritative enforcement boundary for all API requests.

---

## Architecture Overview (2-Layer Design)

Instead of hardcoding role arrays into hundreds of `menu_sub` entries in `configuration.json` (which causes RBAC drift whenever backend roles change), access control is cleanly separated into two layers:

| Layer | Responsibility | Source of Truth | Typical Usage |
| :--- | :--- | :--- | :--- |
| **Layer 1: Capabilities / Permissions** | *"What resources & operations can this user access?"* | **Backend (`rules.json`)** via `capabilities_endpoint` or JWT capability claims | Automatically hides/shows `menu_sub` (`<entity>:read`), `actions[].permissions`, and built-in Create/Delete buttons — **0 role names in `configuration.json`**. |
| **Layer 2: Declarative `Rule` (ABAC / UI Policy)** | *"Under what contextual conditions should this UI element appear?"* | **Frontend JSON (`Rule` engine)** | Hierarchical menu scoping (`user.site_id`, `user.department_id`, `user.roles`), Segregation of Duties (`prepared_by != user.nip`), and record state rules (`status == 'EVALUATION_APPROVAL'`). |

All access checks across menus, row actions, home actions, home action forms, and built-in CRUD buttons flow synchronously through `AccessPolicyEvaluator` in memory — avoiding legacy async Hive permission lookups (`VisibilityPermission`).

---

## 1. Configuration (`configuration.json` → `access_control`)

Add the optional `access_control` object at the root of `configuration.json`:

```json
{
  "backend_host": "https://api.plant-cpob.local",
  "access_control": {
    "bypass_all_permissions": false,
    "capabilities_endpoint": "{{backend_host}}/auth/capabilities",
    "auto_check_entity_read": true,
    "default_allow_when_unrestricted": true,
    "allow_role_as_permission_fallback": false
  }
}
```

| Field | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `bypass_all_permissions` | `Boolean` | `false` | **Secure by default.** Escape hatch for local dev / studio preview. When `true`, bypasses Layer 1 capability gates; **Layer 2 business/SoD `rule` on actions is still evaluated.** (Legacy root `bypass_permission` / `bypass_all_permissions` booleans are also accepted as fallback.) |
| `capabilities_endpoint` | `String?` | `null` | Backend URL returning the authenticated user's effective capabilities (supports `{{backend_host}}` interpolation). Called automatically on login / app startup with `Authorization: Bearer <token>`. |
| `auto_check_entity_read` | `Boolean` | `true` | When capabilities are loaded (from backend endpoint or JWT), every `menu_sub` without explicit `permissions` automatically requires `<entity>:read` (or `<entity>_read`). |
| `default_allow_when_unrestricted` | `Boolean` | `true` | Whether actions or built-in buttons without explicit capability requirements remain visible when no capability restriction applies. |
| `allow_role_as_permission_fallback` | `Boolean` | `false` | Keeps Role and Permission semantically separated by default. Set `true` only when migrating legacy configs that placed role names inside `permission`. |

---

## 2. Layer 1: Server-Driven Capabilities (Single Source of Truth)

### Supported Capability Sources
Capabilities are automatically loaded into `UserRepositoryAppNocode.instance` from any of these sources:
1. **Backend Endpoint (`capabilities_endpoint`)** via `CapabilitiesService.instance.syncFromBackend(...)`.
2. **JWT Embedded Claims**: automatically extracted by `UserAppNocode.fromJson` from `capabilities`, `cap`, `permissions`, `perms`, `scopes`, or `scope`.
3. **Legacy Permissions**: merged seamlessly from `UserRepositoryAppNocode.permissions`.

### Supported Payload Formats
`AccessPolicyEvaluator.normalizeCapabilities` accepts all common API shapes:

- **Flat Array**:
  ```json
  ["capas:read", "capas:create", "capas:approve", "capa_categories_read"]
  ```
- **Comma-Separated String**:
  ```json
  "capas:read, capas:create, deviations:*"
  ```
- **Structured Entity-Action Map** (recommended for `flx-nocode-api`):
  ```json
  {
    "data": {
      "capabilities": {
        "capas": ["read", "create", "approve"],
        "capa_categories": ["read"],
        "audit_logs": { "read": true, "delete": false }
      }
    }
  }
  ```

### Matching Rules & Fail-Closed Behavior
- **Separator Equivalence**: `capas:read` and `capas_read` match each other automatically (case-insensitive).
- **Wildcards**: `*` / `*:*` grants all capabilities; `capas:*` / `capas_*` grants all operations on `capas`.
- **Explicit Role Prefix**: `role:<role_name>` inside `permissions` explicitly checks `user.roles`.
- **Fail-Closed Empty List**: If the backend explicitly returns `[]` (`setCapabilities([])`), `hasCapabilitiesLoaded` is `true` and all capability-gated items are denied.
- **Fail-Closed on Network Error**: When `capabilities_endpoint` is configured and the HTTP fetch fails (timeout, 5xx, offline), `CapabilitiesService.syncFromBackend` marks capabilities as loaded with `[]` (`failClosed: true` by default) so the UI never falls back to showing unrestricted menus.

### Startup & Login Synchronization Lifecycle
To prevent fail-open race conditions on both fresh login and browser refresh / cold-start session restore:
1. **Fresh Login (`onLoginSuccess`)**: Passes the newly issued `accessToken` directly to `CapabilitiesService.instance.syncFromBackend(...)`.
2. **Authenticated Shell (`_AuthenticatedMenuShell` in `main.dart`)**: Before invoking `configuration.menu(bypassPermission: bypassAll)` or passing `accountPermissions` to `MenuPage`, the shell awaits `CapabilitiesService.instance.syncFromBackend(...)` if `capabilities_endpoint` is configured and capabilities are not yet loaded.
3. **Workflow & Interpolation Parity**: Server-driven `effectiveCapabilities` are exposed consistently across `AccessPolicyEvaluator`, `JsVariableProvider` (`{{ user.capabilities }}`), and `FormSubmitWorkflow` (`_WorkflowScopeBuilder`).
4. **Logout Hygiene**: `UserRepositoryAppNocode.logout()` resets `_capabilities`, `_capabilitiesExplicitlyLoaded`, `permissions`, and clears `ReferenceLabelCache`.

---

## 3. Layer 2: Hierarchical Menu Policies (`menu_group` → `menu` → `menu_sub`)

Each level of the navigation hierarchy supports optional `rule` (alias: `visible_if`) and `permissions` (alias: `permission`, accepts `String` or `Array<String>`):

- **Hierarchical Inheritance**: A `menu_sub` is visible **only if** its `menu_group`, parent `menu`, AND own `menu_sub` policies all pass (plus Layer 1 `<entity>:read` when capabilities are loaded).
- **Automatic Parent Pruning**: Any `menu` with 0 visible `menu_sub` items is hidden, and any `menu_group` with 0 visible `menu` items is hidden automatically.

### Example: Zero-Role Capabilities + ABAC Menu Scoping
```json
{
  "access_control": {
    "bypass_all_permissions": false,
    "capabilities_endpoint": "{{backend_host}}/auth/capabilities",
    "auto_check_entity_read": true
  },
  "menu_group": [
    {
      "label": "Quality Assurance",
      "menu": [
        {
          "label": "CAPA & Deviation",
          "icon": "list",
          "menu_sub": [
            { "label": "CAPA", "entity": "capas" },
            { "label": "Penyimpangan", "entity": "deviations" }
          ]
        },
        {
          "label": "Master QA (Plant Cikarang Only)",
          "icon": "settings",
          "rule": {
            "all": [
              { "field": "user.site_id", "op": "=", "value": "SITE-CKR" }
            ]
          },
          "menu_sub": [
            { "label": "Master Kategori CAPA", "entity": "capa_categories" }
          ]
        }
      ]
    },
    {
      "label": "Compliance & Audit",
      "rule": {
        "any": [
          { "field": "user.roles", "op": "contains", "value": "plant_auditor" },
          { "field": "user.roles", "op": "contains", "value": "super_admin" }
        ]
      },
      "menu": [
        {
          "label": "Audit Trail",
          "icon": "shield",
          "menu_sub": [
            { "label": "Log Audit CPOB", "entity": "audit_logs" }
          ]
        }
      ]
    }
  ]
}
```

---

## 4. Action, Form & Built-In Button Visibility

### `actions` & `actions_home`
- **`permissions` / `permission`** (Layer 1): Accepts a single string or array of strings (OR match). When omitted, the engine does **not** fabricate a legacy `<entity_id>_<action_id>` requirement, so unrestricted actions remain visible when `bypass_all_permissions: false`.
- **`rule`** (Layer 2): Always evaluated natively in Dart against `data`, `parent`, `table` (`table.is_empty`, `table.count`, `table.status` on `actions_home` / `ActionButtonRegular`), `user.roles`, `user.capabilities`, and all dynamic `user.<claim>` fields — even if `bypass_all_permissions: true`.

```json
{
  "id": "approve_capa",
  "type": "http",
  "name": "Approve Evaluasi",
  "permissions": ["capas:approve"],
  "rule": {
    "all": [
      { "field": "status", "op": "=", "value": "EVALUATION_APPROVAL" },
      { "field": "prepared_by", "op": "!=", "value": "{{ user.nip }}" }
    ]
  }
}
```

### `homeActionForms` & Built-in CRUD Buttons
- **`layoutForm.homeActionForms`**: Automatically filtered using `form.visibleIf` via `AccessPolicyEvaluator.canAccessLayoutForm`.
- **`EntityCreateButtonOld`**: Checks `canAccessBuiltInOperation(entity, 'write')` (accepts `write` or `create` capability) AND `layoutForm.visibleIf`.
- **`EntityDeleteButton`**: Checks `canAccessBuiltInOperation(entity, 'delete')`.

---

## 5. Widgetbook & Testing

- **Interactive Widgetbook Story**: `lib/core/access/access_control.widgetbook.dart`
  - Run: `flutter run -t lib/widgetbook.dart -d macos`
  - Path: `core` → `access` → `AccessControlShowcase` → `From JSON Config (2-Layer Capabilities & Hierarchical Rules)`
- **Automated Tests**: `test/access_policy_evaluator_test.dart`
  - Run: `flutter test test/access_policy_evaluator_test.dart`
