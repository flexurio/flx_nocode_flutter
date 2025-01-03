import 'package:appointment/constant/flavor.dart';
import 'package:flexurio_chiron_product_stock/constant/menu.dart' as flexurio_chiron_product_stock;
import 'package:appointment/src/app/app.dart';

Future<void> main() async => runChiron(
      'Teguhsindo ERP',
      configFlavorTeguhsindoDevelopment,
      flexurio_chiron_product_stock.menu,
    );
