import 'package:appointment/constant/flavor.dart';
import 'package:flexurio_chiron_marketing/constant/menu.dart' as flexurio_chiron_marketing;
import 'package:appointment/src/app/app.dart';

Future<void> main() async => runChiron(
      'Teguhsindo ERP',
      configFlavorTeguhsindoDevelopment,
      flexurio_chiron_marketing.menu,
    );
