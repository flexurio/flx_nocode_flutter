import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:intl/intl.dart';

enum Extension { pdf, xlsx }

class FileName {
  static String presencePerEmployee(
    Extension extension,
    Employee employee,
    DateTime dateTime,
  ) {
    final format = DateFormat(DateFormat.YEAR_NUM_MONTH_DAY);
    final date = format.format(dateTime);
    return 'Presence_${employee.name}_${employee.nip}_$date.$extension'
        .replaceSymbol;
  }
}
