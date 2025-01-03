import 'package:flexurio_chiron_company/src/app/bloc/employee_query/employee_query_bloc.dart';
import 'package:flexurio_chiron_presence/src/app/bloc/presence_monthly_per_employee_query/presence_monthly_per_employee_query_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class FilterForm extends StatefulWidget {
  const FilterForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              EmployeeQueryBloc()..add(const EmployeeQueryEvent.fetch()),
        ),
      ],
      child: const FilterForm._(),
    );
  }

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  final _formKey = GlobalKey<FormState>();
  late Employee _employee;
  DateTime _dateTime = DateTime.now();
  final _periodController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<PresenceMonthlyPerEmployeeQueryBloc>().add(
            PresenceMonthlyPerEmployeeQueryEvent.fetch(
              employee: _employee,
              dateTime: _dateTime,
            ),
          );
    }
  }

  @override
  void initState() {
    super.initState();
    final now = _dateTime.yMMMM;
    _periodController.text = now;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filter',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(12),
          BlocBuilder<EmployeeQueryBloc, EmployeeQueryState>(
            builder: (context, state) {
              return FDropDownSearch<Employee>(
                validator: requiredObjectValidator.call,
                labelText: 'Employee',
                items: state.maybeWhen(
                  loaded: (employees) => employees,
                  orElse: () => [],
                ),
                onChanged: (value) {
                  if (value != null) {
                    _employee = value;
                  }
                },
                itemAsString: (employee) => employee.name,
              );
            },
          ),
          const Gap(12),
          FieldMonthPicker(
            controller: _periodController,
            labelText: 'Month',
            maxDate: DateTime.now(),
            validator: requiredObjectValidator.call,
            onChanged: (value) => _dateTime = value,
          ),
          const Gap(12),
          BlocBuilder<PresenceMonthlyPerEmployeeQueryBloc,
              PresenceMonthlyPerEmployeeQueryState>(
            builder: (context, state) {
              return Button(
                permission: null,
                onPressed: state.maybeMap(
                  orElse: () => _submit,
                ),
                action: DataAction.applyFilter,
              );
            },
          ),
        ],
      ),
    );
  }
}
