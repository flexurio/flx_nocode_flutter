import 'package:appointment/constant/flavor.dart';
import 'package:flexurio_chiron_accounting/constant/menu.dart' as flexurio_chiron_accounting;
import 'package:appointment/src/app/app.dart';

Future<void> main() async => runChiron(
      'Teguhsindo ERP',
      configFlavorTeguhsindoProduction,
      flexurio_chiron_accounting.menu,
    );
