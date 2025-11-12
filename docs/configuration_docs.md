# Configuration JSON Documentation

This document outlines the structure and fields of the `configuration.json` file used by the application. This file is essential for defining the application's theme, branding, navigation menu, and backend connections.

## Root Object

The root of the JSON file is a single object that contains all configuration properties.

| Key                  | Type          | Required | Description                                                                                             |
| -------------------- | ------------- | -------- | ------------------------------------------------------------------------------------------------------- |
| `app_name`           | String        | Yes      | The name of the application, displayed in the title bar and other key areas.                            |
| `backend_host`       | String        | Yes      | The base URL for the backend API (e.g., `http://api.example.com`).                                      |
| `auth_url`           | String        | Yes      | The full URL for the authentication or login endpoint.                                                  |
| `logo_url`           | String        | No       | The URL or asset path for the main company logo (small version).                                        |
| `logo_named_url`     | String        | No       | The URL or asset path for the company logo that includes the name (larger version).                     |
| `show_landing_page`  | Boolean       | No       | If `true`, a landing page is shown before the login screen. Defaults to `false`.                        |
| `entity_registration`| String        | No       | The entity ID to be used for the self-registration page. If null, registration is disabled.            |
| `preload`            | Array<String> | No       | A list of entity IDs to preload data for when the application starts.                                   |
| `company`            | Object        | Yes      | An object containing details about the company. See [Company Object](#company-object).                  |
| `theme`              | Object        | Yes      | An object defining the application's color scheme. See [Theme Object](#theme-object).                   |
| `menu_group`         | Array<Object> | Yes      | An array of objects that define the structure of the navigation menu. See [Menu Group Object](#menu-group-object). |

---

## Nested Objects

### Company Object

Contains information about the company or organization.

| Key       | Type   | Required | Description                               |
| --------- | ------ | -------- | ----------------------------------------- |
| `id`      | String | Yes      | A unique identifier for the company.      |
| `name`    | String | Yes      | The full name of the company.             |
| `phone`   | String | Yes      | The company's contact phone number.       |
| `website` | String | Yes      | The company's official website URL.       |
| `address` | String | Yes      | The physical address of the company.      |

### Theme Object

Defines the primary colors for the application's UI theme.

| Key          | Type   | Required | Description                                                              |
| ------------ | ------ | -------- | ------------------------------------------------------------------------ |
| `color`      | String | Yes      | The primary theme color in hex format (e.g., `"#4A90E2"`).               |
| `color_soft` | String | Yes      | A softer or lighter shade of the primary color (e.g., `"#BDE5F8"`).      |

### Menu Group Object

Represents a top-level section in the navigation menu, often used to group related items.

| Key     | Type          | Required | Description                                                              |
| ------- | ------------- | -------- | ------------------------------------------------------------------------ |
| `label` | String        | Yes      | The display text for the menu group header (e.g., "Master Data").        |
| `menu`  | Array<Object> | Yes      | An array of menu items within this group. See [Menu Object](#menu-object). |

### Menu Object

Represents a second-level menu item, which contains one or more sub-menu items.

| Key        | Type          | Required | Description                                                                    |
| ---------- | ------------- | -------- | ------------------------------------------------------------------------------ |
| `label`    | String        | Yes      | The display text for this menu item (e.g., "Management").                      |
| `icon`     | String        | Yes      | The icon to be displayed next to the label (e.g., a Font Awesome class like `fa fa-database`). |
| `menu_sub` | Array<Object> | Yes      | An array of sub-menu items. See [Menu Sub Object](#menu-sub-object).           |

### Menu Sub Object

Represents the final, clickable menu item that navigates to a specific entity view.

| Key      | Type   | Required | Description                                                              |
| -------- | ------ | -------- | ------------------------------------------------------------------------ |
| `label`  | String | Yes      | The display text for the sub-menu item (e.g., "Users").                  |
| `entity` | String | Yes      | The unique identifier of the entity that this menu item will open.       |

---

## Example `configuration.json`

```json
{
  "app_name": "Flexurio Chiron",
  "backend_host": "http://localhost:8080",
  "auth_url": "http://localhost:8080/login",
  "logo_url": "asset/image/icon/logo.png",
  "logo_named_url": "asset/image/logo-name-company-03.png",
  "show_landing_page": true,
  "entity_registration": "customers",
  "preload": [
    "products",
    "categories"
  ],
  "company": {
    "id": "flexurio-global",
    "name": "Flexurio Global",
    "phone": "+1-800-555-0199",
    "website": "https://flexurio.com",
    "address": "123 Innovation Drive, Tech City, 12345"
  },
  "theme": {
    "color": "#005DFF",
    "color_soft": "#D9E6FF"
  },
  "menu_group": [
    {
      "label": "Main Menu",
      "menu": [
        {
          "label": "User Management",
          "icon": "fa fa-users",
          "menu_sub": [
            {
              "label": "System Users",
              "entity": "flx_users"
            },
            {
              "label": "User Roles",
              "entity": "flx_roles"
            }
          ]
        },
        {
          "label": "Inventory",
          "icon": "fa fa-cubes",
          "menu_sub": [
            {
              "label": "Products",
              "entity": "products"
            },
            {
              "label": "Warehouses",
              "entity": "warehouses"
            }
          ]
        }
      ]
    },
    {
      "label": "Settings",
      "menu": [
        {
          "label": "Application",
          "icon": "fa fa-cogs",
          "menu_sub": [
            {
              "label": "System Settings",
              "entity": "app_settings"
            }
          ]
        }
      ]
    }
  ]
}
```