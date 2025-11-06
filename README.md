```
lib/
  app.dart
  main.dart

  core/
    config/              # env, app constants
    router/              # app_routes.dart, app_pages.dart
    theme/               # tema global (color, text style, dsb.)
    utils/               # helper, extensions, formatter
    di/                  # dependency helpers (opsional)
    hive/
      hive_service.dart  # init Hive, register adapter, open boxes
      boxes.dart         # nama box & helper

  shared/
    widgets/             # widget reusable (button, card, dsb.)
    mixins/              # mixin reusable (mis. form validation)
    services/            # service non-feature (mis. NetworkInfo)

  features/
    product/
      data/
        models/          # Hive models (annotated dengan @HiveType)
        datasources/     # LocalDataSource (Hive)
        repositories/    # impl repository
      domain/            # entities & usecases (opsional)
      presentation/
        controllers/     # GetxController / GetxService
        pages/           # UI pages / screens
        widgets/         # widget khusus feature ini
        bindings.dart    # GetX Binding untuk feature ini
        routes.dart      # (opsional, rute lokal khusus feature)
    customer/
      ...
    sales/
      ...
    sales_item/
      ...
```