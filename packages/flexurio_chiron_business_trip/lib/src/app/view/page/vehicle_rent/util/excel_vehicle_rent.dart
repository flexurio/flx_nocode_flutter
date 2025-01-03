import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

final vehicleRentHeader = [
  'vehicle_rent_id'.tr(),
  'schedule_start'.tr(),
  'schedule_end'.tr(),
  'user'.tr(),
  'department'.tr(),
  'Driver',
  'vehicle'.tr(),
  'description'.tr(),
];

List<int> excelVehicleRent(
    List<Employee> employees, List<VehicleRent> vehicleRents) {
  final workbook = Workbook();
  final sheet = workbook.worksheets[0];
  Employee? _driver;
  Employee? _userId;
  sheet
      .getRangeByIndex(1, 1, 1, vehicleRentHeader.length)
      .setBuiltInStyle(BuiltInStyles.heading1);

  for (var column = 0; column < vehicleRentHeader.length; column++) {
    sheet.getRangeByIndex(1, column + 1).setValue(vehicleRentHeader[column]);
  }

  for (var i = 0; i < vehicleRentHeader.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  for (var i = 0; i < vehicleRents.length; i++) {
    final vehicleRent = vehicleRents[i];

    if (vehicleRent.driverId != null) {
      _driver = employees.find(vehicleRent.driverId!.toString());
    } else {
      _driver = Employee.empty();
    }

    _userId = employees.find(vehicleRent.userId.toString());

    sheet.getRangeByIndex(2 + i, 1).setValue(vehicleRent.id);
    sheet
        .getRangeByIndex(2 + i, 2)
        .setValue(vehicleRent.scheduledStartDate.yMMMMd);
    sheet
        .getRangeByIndex(2 + i, 3)
        .setValue(vehicleRent.scheduledEndDate.yMMMMd);
    sheet.getRangeByIndex(2 + i, 4).setValue(_userId!.name);
    sheet.getRangeByIndex(2 + i, 5).setValue(vehicleRent.department.name);
    sheet
        .getRangeByIndex(2 + i, 6)
        .setValue(_driver!.name == '' ? '-' : _driver.name);
    sheet.getRangeByIndex(2 + i, 7).setValue(vehicleRent.vehicle != null
        ? vehicleRent.vehicle!.vehicleRegistrationNumber
        : '-');
    sheet.getRangeByIndex(2 + i, 8).setValue(vehicleRent.description);
  }

  for (var i = 0; i < vehicleRentHeader.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  final bytes = workbook.saveSync();

  return bytes;
}
