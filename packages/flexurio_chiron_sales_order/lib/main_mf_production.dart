import 'package:appointment/constant/flavor.dart';
import 'package:flexurio_chiron_sales_order/constant/menu.dart' as flexurio_chiron_sales_order;
import 'package:appointment/src/app/app.dart';

Future<void> main() async => runChiron(
      'Metiska Farma ERP',
      configFlavorMetiskaFarmaProduction,
      flexurio_chiron_sales_order.menu,
    );
