import 'package:appointment/constant/flavor.dart';
import 'package:flexurio_chiron_presence/constant/menu.dart' as flexurio_chiron_presence;
import 'package:appointment/src/app/app.dart';

Future<void> main() async => runChiron(
      'Chiron',
      configFlavorChironDemo,
      flexurio_chiron_presence.menu,
    );
