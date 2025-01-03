import 'package:appointment/constant/flavor.dart';
import 'package:flexurio_chiron_product/constant/menu.dart' as flexurio_chiron_product;
import 'package:appointment/src/app/app.dart';

Future<void> main() async => runChiron(
      'Anton Paar ERP',
      configFlavorAntonPaarDevelopment,
      flexurio_chiron_product.menu,
    );
