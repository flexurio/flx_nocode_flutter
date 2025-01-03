import 'package:appointment/constant/flavor.dart';
import 'package:flexurio_chiron_ticket/constant/menu.dart' as flexurio_chiron_ticket;
import 'package:appointment/src/app/app.dart';

Future<void> main() async => runChiron(
      'Teguhsindo ERP',
      configFlavorTeguhsindoProduction,
      flexurio_chiron_ticket.menu,
    );
