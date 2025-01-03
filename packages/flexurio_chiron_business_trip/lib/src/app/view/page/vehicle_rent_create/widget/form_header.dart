import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/bloc/user/user_query_bloc.dart';
import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class VehicleRentHeaderFormPage extends StatefulWidget {
  const VehicleRentHeaderFormPage._({
    required this.onNext,
  });

  final void Function() onNext;

  static Widget prepare({
    required void Function() onNext,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DepartmentQueryBloc()
            ..add(
              DepartmentQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => UserQueryBloc()
            ..add(UserQueryEvent.fetch(department: Department.empty())),
        ),
        BlocProvider(
          create: (context) => VehicleQueryBloc()
            ..add(VehicleQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
              isActive: true,
            )),
        ),
        BlocProvider(
          create: (context) => DepartmentEmployeeQueryBloc(),
        ),
        BlocProvider(
          create: (context) => DriverQueryBloc()
            ..add(
              DriverQueryEvent.get(department: Department.empty()),
            ),
        ),
      ],
      child: VehicleRentHeaderFormPage._(
        onNext: onNext,
      ),
    );
  }

  @override
  State<VehicleRentHeaderFormPage> createState() =>
      _VehicleRentHeaderFormPageState();
}

class _VehicleRentHeaderFormPageState extends State<VehicleRentHeaderFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _totalCostController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _descriptionController = TextEditingController();

  Department? _department;
  Employee? _employee;
  VehicleRentType? _vehicleRentType;
  Employee? _driver;
  Vehicle? _vehicle;
  late DateTime _startDate;
  late DateTime _endDate;

  @override
  Widget build(BuildContext context) {
    final submitButton = Button(
      permission: null,
      action: DataAction.next,
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<VehicleRentBloc>().add(
                VehicleRentEvent.createHeaderToLocal(
                  vehicleRentFormHeader: VehicleRentFormHeader(
                    driver: _driver != null ? int.parse(_driver!.nip) : null,
                    vehicle: _vehicle,
                    department: _department,
                    user: int.parse(_employee!.nip),
                    totalCost: stringDecimalToDouble(_totalCostController.text),
                    startDate: _startDate,
                    endDate: _endDate,
                    description: _descriptionController.text,
                    type: _vehicleRentType,
                  ),
                ),
              );
          widget.onNext();
        }
      },
    );

    return BlocBuilder<VehicleRentBloc, VehicleRentState>(
      builder: (context, state) {
        return FormAction(
          formKey: _formKey,
          actions: [
            submitButton,
          ],
          children: [
            BlocBuilder<DriverQueryBloc, DriverQueryState>(
              builder: (context, state) {
                return FDropDownSearch<Employee>(
                  labelText: 'Driver',
                  itemAsString: (driver) => driver.name,
                  items: state.maybeWhen(
                    orElse: () => [],
                    loaded: (driver, nip) => driver
                        .where((element) => nip.contains(element.nip))
                        .toList(),
                  ),
                  status: state.maybeWhen(
                    error: (_) => Status.error,
                    loading: () => Status.progress,
                    orElse: () => Status.loaded,
                  ),
                  onChanged: (driver) {
                    if (driver != null) {
                      _driver = driver;
                    }
                  },
                );
              },
            ),
            const Gap(20),
            BlocBuilder<VehicleQueryBloc, VehicleQueryState>(
              builder: (context, state) {
                return FDropDownSearch<Vehicle>(
                  initialValue: _vehicle,
                  labelText: 'vehicle'.tr(),
                  items: state.maybeWhen(
                    loaded: (vehicle) => vehicle.data,
                    orElse: () => [],
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      _vehicle = value;
                    }
                  },
                  itemAsString: (vehicle) => vehicle.vehicleRegistrationNumber,
                );
              },
            ),
            const Gap(20),
            BlocBuilder<DepartmentQueryBloc, DepartmentQueryState>(
              builder: (context, state) {
                return FDropDownSearch<Department>(
                  initialValue: _department,
                  labelText: 'department'.tr(),
                  items: state.maybeWhen(
                    loaded: (department) => department.data,
                    orElse: () => [],
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      _department = value;
                      _employee = null;
                      context.read<DepartmentEmployeeQueryBloc>().add(
                            DepartmentEmployeeQueryEvent.get(
                              department: _department,
                            ),
                          );
                    }
                  },
                  itemAsString: (department) => department.name,
                  validator: requiredObjectValidator.call,
                );
              },
            ),
            const Gap(20),
            BlocBuilder<DepartmentEmployeeQueryBloc,
                DepartmentEmployeeQueryState>(
              builder: (context, state) {
                return FDropDownSearch<Employee>(
                  key: ValueKey(_department != null ? _department!.id : ''),
                  validator: requiredObjectValidator.call,
                  labelText: 'user'.tr(),
                  itemAsString: (employee) => employee.name,
                  items: state.maybeWhen(
                    orElse: () => [],
                    loaded: (employee, nip) => employee
                        .where((element) => nip.contains(element.nip))
                        .toList(),
                  ),
                  status: state.maybeWhen(
                    error: (_) => Status.error,
                    loading: () => Status.progress,
                    orElse: () => Status.loaded,
                  ),
                  onChanged: (employee) {
                    if (employee != null) {
                      _employee = employee;
                    }
                  },
                );
              },
            ),
            const Gap(20),
            FDropDownSearch<VehicleRentType>(
              validator: requiredObjectValidator.call,
              labelText: 'type'.tr(),
              itemAsString: (type) => type.label,
              items: [
                VehicleRentType.dinas,
                VehicleRentType.pribadi,
              ],
              onChanged: (type) {
                if (type != null) {
                  _vehicleRentType = type;
                }
              },
            ),
            const Gap(20),
            FTextFormField(
              controller: _totalCostController,
              labelText: 'total_cost'.tr(),
              validator: requiredValidator.call,
              inputFormatters: [
                ThousandsFormatter(),
              ],
            ),
            const Gap(20),
            RowFields(
              children: [
                FieldDatePicker(
                  onChanged: (value) => _startDate = value,
                  controller: _startDateController,
                  labelText: 'schedule_start'.tr(),
                  validator: requiredObjectValidator.call,
                ),
                FieldDatePicker(
                  onChanged: (value) => _endDate = value,
                  controller: _endDateController,
                  labelText: 'schedule_end'.tr(),
                  validator: requiredObjectValidator.call,
                ),
              ],
            ),
            const Gap(20),
            FTextFormField(
              labelText: 'description'.tr(),
              controller: _descriptionController,
              validator: requiredValidator.call,
              maxLines: 4,
              maxLength: 500,
            ),
          ],
        );
      },
    );
  }
}
