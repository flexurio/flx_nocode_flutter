import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/widgetbook.directories.g.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Configuration.instance = Configuration.empty();
  flavorConfig = Configuration.instance.flavorConfig;
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: MyTheme.getTheme(Colors.blue, ThemeMode.light),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: MyTheme.getTheme(Colors.blue, ThemeMode.dark),
            ),
          ],
        ),
      ],
    );
  }
}
