import 'package:appointment/constant/flavor.dart';
import 'package:flexurio_chiron_material/constant/menu.dart' as flexurio_chiron_material;
import 'package:appointment/src/app/app.dart';

Future<void> main() async => runChiron(
      'Teguhsindo ERP',
      configFlavorTeguhsindoDevelopment,
      flexurio_chiron_material.menu,
    );
