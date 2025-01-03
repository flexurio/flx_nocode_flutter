import 'package:appointment/constant/flavor.dart';
import 'package:appointment/constant/menu/menu.dart' as appointment;
import 'package:appointment/src/app/app.dart';

Future<void> main() async => runChiron(
      'Anton Paar ERP',
      configFlavorAntonPaarDevelopment,
      appointment.menu,
    );
