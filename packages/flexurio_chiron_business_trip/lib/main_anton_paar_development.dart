import 'package:appointment/constant/flavor.dart';
import 'package:flexurio_chiron_business_trip/constant/menu.dart' as flexurio_chiron_business_trip;
import 'package:appointment/src/app/app.dart';

Future<void> main() async => runChiron(
      'Anton Paar ERP',
      configFlavorAntonPaarDevelopment,
      flexurio_chiron_business_trip.menu,
    );
