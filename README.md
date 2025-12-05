# FLX No-Code Flutter Framework

A dynamic Flutter framework for building data-driven applications where the user interface and features are defined by a JSON configuration file.

## About The Project

`flx_nocode_flutter` is a powerful tool designed to accelerate the development of Flutter applications. The core principle is to define the entire application structure—from branding and themes to navigation and data entities—through a single, comprehensive JSON file.

This "no-code" approach allows for rapid iteration and deployment. You can change the app's appearance, add new pages, and connect to different data entities simply by modifying the configuration, without writing any new Dart code.

### Key Features

*   **JSON-Driven UI:** Define your entire app layout, navigation, and entity connections in a `configuration.json` file.
*   **Dynamic Theming:** Easily customize branding, logos, and color schemes.
*   **Configurable Navigation:** Build complex navigation menus with multiple levels of hierarchy.
*   **Entity-Based Views:** Automatically generates data tables, forms, and views based on your defined "entities".
*   **Rapid Prototyping & Deployment:** Go from concept to a functional application in record time.

## Configuration

The heart of this framework is the `configuration.json` file, which must be located in the `asset/configuration/` directory. This file controls every aspect of the application's appearance and behavior.

A detailed guide to the structure of this file, including all available fields and a complete example, can be found in our documentation.

**[➡️ Read the Configuration JSON Documentation](./docs/configuration_docs.md)**

**[➡️ Read the Entity JSON Documentation](./docs/entity.md)**

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

*   Flutter SDK: Make sure you have the Flutter SDK installed. See the [official Flutter documentation](https://flutter.dev/docs/get-started/install) for instructions.

### Installation

1.  Clone the repo
    ```sh
    git clone <your-repo-url>
    ```
2.  Navigate to the project directory
    ```sh
    cd flx_nocode_flutter
    ```
3.  Install dependencies
    ```sh
    flutter pub get
    ```
4.  Run the application
    ```sh
    flutter run
    ```

## Loading configuration from filesystem

By default the app reads configs/entities from bundled assets under `asset/configuration`. You can point the app to a filesystem path at runtime (useful on macOS dev builds) by setting `CONFIGURATION_FS_BASE_PATH`:

```sh
# During development
CONFIGURATION_FS_BASE_PATH=/absolute/path/to/frontend flutter run -d macos

# Running a built .app
CONFIGURATION_FS_BASE_PATH=/absolute/path/to/frontend /path/to/YourApp.app/Contents/MacOS/YourApp
```

Expected layout inside that folder:
- `configuration/configuration.json`
- `configuration/entity/*.json`

If the path is not set or inaccessible, the app falls back to the bundled assets.

## License

Distributed under the AGPL License. See `LICENSE-AGPL` for more information.
