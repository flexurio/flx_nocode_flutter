import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class VehicleRentHeaderUpdateFormPage extends StatefulWidget {
  const VehicleRentHeaderUpdateFormPage._({
    required this.header,
  });

  final VehicleRentFormHeader header;

  static Route<bool?> route({
    required VehicleRentFormHeader header,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => VehicleRentBloc()),
          BlocProvider(
            create: (context) => DepartmentQueryBloc()
              ..add(
                DepartmentQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => VehicleQueryBloc()
              ..add(VehicleQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(), isActive: true)),
          ),
          BlocProvider(
            create: (context) => DepartmentEmployeeQueryBloc()
              ..add(
                DepartmentEmployeeQueryEvent.get(
                  department: header.department ??
                      Department.empty().copyWith(id: 'CS'),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => DriverQueryBloc()
              ..add(
                DriverQueryEvent.get(
                  department: Department.empty(),
                ),
              ),
          ),
        ],
        child: VehicleRentHeaderUpdateFormPage._(
          header: header,
        ),
      ),
    );
  }

  @override
  State<VehicleRentHeaderUpdateFormPage> createState() =>
      _VehicleRentHeaderUpdateFormPageState();
}

class _VehicleRentHeaderUpdateFormPageState
    extends State<VehicleRentHeaderUpdateFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _totalCostController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _descriptionController = TextEditingController();
  late final _employeeController = TextEditingController();
  late final _driverController = TextEditingController();

  Department? _department;
  late Employee? _employee = Employee.empty();
  late Employee? _driver = Employee.empty();
  VehicleRentType? _vehicleRentType;
  Vehicle? _vehicle;
  late DateTime _startDate;
  late DateTime _endDate;

  late DataAction _action;

  VehicleRentFormHeader? _vehicleRentFormHeader;

  @override
  void initState() {
    super.initState();

    _action = DataAction.edit;
    _vehicleRentFormHeader = widget.header;
    _startDate = _vehicleRentFormHeader!.startDate!;
    _endDate = _vehicleRentFormHeader!.endDate!;
    _department = _vehicleRentFormHeader!.department;
    _employeeController.text = _vehicleRentFormHeader!.user!.toString();
    _descriptionController.text = _vehicleRentFormHeader!.description!;
    _totalCostController.text = _vehicleRentFormHeader!.totalCost.toString();
    _startDateController.text = _vehicleRentFormHeader!.startDate.toString();
    _endDateController.text = _vehicleRentFormHeader!.endDate.toString();
    _vehicle = _vehicleRentFormHeader!.vehicle;
    _vehicleRentType = _vehicleRentFormHeader!.type;
    if (_vehicleRentFormHeader!.driver != null) {
      _driverController.text = _vehicleRentFormHeader!.driver!.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final submitButton = Button(
      permission: null,
      action: DataAction.edit,
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<VehicleRentBloc>().add(
                VehicleRentEvent.updateHeader(
                  vehicleRentFormHeader: VehicleRentFormHeader(
                    id: _vehicleRentFormHeader!.id,
                    driver: _driver!.nip == '' ? null : int.parse(_driver!.nip),
                    vehicle: _vehicle!.vehicleRegistrationNumber == ''
                        ? null
                        : _vehicle,
                    department: _department,
                    user: int.parse(_employee!.nip),
                    totalCost: stringDecimalToDouble(_totalCostController.text),
                    startDate: _startDate,
                    endDate: _endDate,
                    description: _descriptionController.text,
                    point: _vehicleRentFormHeader!.point,
                    type: _vehicleRentType,
                  ),
                ),
              );
        }
      },
    );

    return BlocListener<VehicleRentBloc, VehicleRentState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(_action, Entity.vehicleRent);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          action: DataAction.edit,
          entity: Entity.vehicleRent,
          formKey: _formKey,
          actions: [
            submitButton,
          ],
          children: [
            BlocBuilder<DriverQueryBloc, DriverQueryState>(
              builder: (context, state) {
                _driver = state.maybeWhen(
                  loaded: (driver, _) {
                    final index = driver.indexWhere(
                      (item) => item.nip == _driverController.text,
                    );
                    if (index > -1) {
                      return driver[index];
                    }
                    return Employee.empty();
                  },
                  orElse: Employee.empty,
                );
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
                  initialValue: _driver!.nip == '' ? null : _driver,
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
                  initialValue: _vehicle!.vehicleRegistrationNumber == ''
                      ? null
                      : _vehicle,
                  labelText: 'Vehicle',
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
                  labelText: 'Department',
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
                _employee = state.maybeWhen(
                  loaded: (employee, _) {
                    final index = employee.indexWhere(
                      (item) => item.nip == _employeeController.text,
                    );
                    if (index > -1) {
                      return employee[index];
                    }
                    return Employee.empty();
                  },
                  orElse: Employee.empty,
                );
                return FDropDownSearch<Employee>(
                  key: ValueKey(_department != null ? _department!.id : ''),
                  validator: requiredObjectValidator.call,
                  labelText: 'User',
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
                  initialValue: _employee,
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
              initialValue: _vehicleRentType,
              onChanged: (type) {
                if (type != null) {
                  _vehicleRentType = type;
                }
              },
            ),
            const Gap(20),
            FTextFormField(
              controller: _totalCostController,
              labelText: 'Total Cost',
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
                  initialSelectedDate: _startDate,
                  validator: requiredObjectValidator.call,
                  labelText: 'Period Start',
                ),
                FieldDatePicker(
                  onChanged: (value) => _endDate = value,
                  controller: _endDateController,
                  initialSelectedDate: _endDate,
                  validator: requiredObjectValidator.call,
                  labelText: 'Period End',
                ),
              ],
            ),
            const Gap(20),
            FTextFormField(
              labelText: 'Description',
              controller: _descriptionController,
              maxLines: 4,
              validator: requiredValidator.call,
              maxLength: 500,
            ),
          ],
        ),
      ),
    );
  }
}
