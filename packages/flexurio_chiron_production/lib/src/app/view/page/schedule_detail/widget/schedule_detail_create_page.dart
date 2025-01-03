import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_production/src/app/view/page/schedule_detail/util/yield_format.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ScheduleDetailCreatePage extends StatefulWidget {
  const ScheduleDetailCreatePage({
    required this.schedule,
    super.key,
    this.scheduleDetail,
    this.employee,
  });

  final Employee? employee;
  final ScheduleDetail? scheduleDetail;
  final Schedule schedule;

  static Widget prepare({
    required Schedule schedule,
    required bool isExternal,
    Employee? employee,
    ScheduleDetail? scheduleDetail,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScheduleDetailBloc(
            isExternal: isExternal,
          ),
        ),
        BlocProvider(
          create: (context) => DepartmentEmployeeQueryBloc()
            ..add(
              DepartmentEmployeeQueryEvent.get(
                department: Department.empty().copyWith(id: 'PD'),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => ScheduleDetailQueryBloc(
            isExternal: isExternal,
          )..add(ScheduleDetailQueryEvent.fetch(schedule.id)),
        ),
        BlocProvider(
          create: (context) => WorkHourShiftQueryBloc()
            ..add(
              const WorkHourShiftQueryEvent.get(),
            ),
        ),
        BlocProvider(
          create: (context) => ScheduleQueryBloc(
            isExternal: isExternal,
          )..add(const ScheduleQueryEvent.fetch()),
        ),
      ],
      child: ScheduleDetailCreatePage(
        schedule: schedule,
        scheduleDetail: scheduleDetail,
        employee: employee,
      ),
    );
  }

  @override
  State<ScheduleDetailCreatePage> createState() =>
      _ScheduleDetailCreatePageState();
}

class _ScheduleDetailCreatePageState extends State<ScheduleDetailCreatePage> {
  late DataAction _action;
  final _formKey = GlobalKey<FormState>();
  final _remarksController = TextEditingController();
  final _qtyPersonController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _yieldController = TextEditingController();
  final _picIdController = TextEditingController();

  ScheduleDetailStatus? _status;
  late DateTime _startTime;
  WorkHourShift? _workHourShift;

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.scheduleDetail);

    if (_action.isEdit) {
      final scheduleDetail = widget.scheduleDetail!;
      _status = scheduleDetail.status;
      _picIdController.text = scheduleDetail.picId.toString();
      _remarksController.text = scheduleDetail.remarks;
      _startTime = scheduleDetail.startTime;
      _startTimeController.text = scheduleDetail.startTime.yMMMdHm;
      _qtyPersonController.text = widget.schedule.quantityMan.toString();
    }
  }

  void _submit() {
    if (_formKey.currentState != null) {
      if (_action.isEdit) {
        context.read<ScheduleDetailBloc>().add(
              ScheduleDetailBlocEvent.edit(
                id: widget.scheduleDetail!.id,
                status: _status!,
                startTime: _startTime,
                picId: int.parse(_picIdController.text),
                remarks: _remarksController.text.isEmpty
                    ? ''
                    : _remarksController.text,
                workHourShift: _workHourShift,
                qtyPerson: _qtyPersonController.text.isEmpty
                    ? '0'
                    : _qtyPersonController.text,
                yields:
                    _yieldController.text.isEmpty ? '0' : _yieldController.text,
              ),
            );
      } else {
        context.read<ScheduleDetailBloc>().add(
              ScheduleDetailBlocEvent.create(
                id: widget.schedule.id,
                status: _status!,
                startTime: _startTime,
                picId: int.parse(_picIdController.text),
                remarks: _remarksController.text.isEmpty
                    ? ''
                    : _remarksController.text,
                workHourShift: _workHourShift,
                qtyPerson: _qtyPersonController.text.isEmpty
                    ? '0'
                    : _qtyPersonController.text,
                yields:
                    _yieldController.text.isEmpty ? '0' : _yieldController.text,
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.scheduleDetail;
    return BlocListener<ScheduleDetailBloc, ScheduleDetailBlocState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: () {
            Toast(context).dataChanged(_action, entity);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          entity: entity,
          action: _action,
          actions: [
            BlocBuilder<ScheduleDetailBloc, ScheduleDetailBlocState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                  action: _action,
                );
              },
            ),
          ],
          formKey: _formKey,
          children: [
            FDropDownSearch<ScheduleDetailStatus>(
              enabled: _action.isCreate,
              itemAsString: (status) => status.label,
              items: ScheduleDetailStatus.list,
              labelText: 'Status',
              validator: requiredObjectValidator.call,
              initialValue: widget.scheduleDetail?.status,
              onChanged: (status) {
                if (status != null) {
                  _status = status;
                  setState(() {});
                }
              },
            ),
            const Gap(24),
            if (_status == ScheduleDetailStatus.start) _buildStatusStart(),
            if (_status == ScheduleDetailStatus.pending) _buildStatusPending(),
            if (_status == ScheduleDetailStatus.finish) _buildstatusFinish(),
          ],
        ),
      ),
    );
  }

  Widget _buildstatusFinish() {
    return Column(
      children: [
        FieldTimePicker(
          labelText: 'Time',
          controller: _startTimeController,
          onChanged: (value) => _startTime = value,
          initialSelectedTime: widget.scheduleDetail?.startTime,
          validator: requiredObjectValidator.call,
        ),
        const SizedBox(height: 24),
        RowFields(
          children: [
            BlocBuilder<DepartmentEmployeeQueryBloc,
                DepartmentEmployeeQueryState>(
              builder: (context, state) {
                return FDropDownSearch<Employee>(
                  validator: requiredObjectValidator.call,
                  labelText: 'PIC',
                  itemAsString: (employee) => employee.name,
                  items: state.maybeWhen(
                    orElse: () => [],
                    loaded: (employees, nip) => employees
                        .where((element) => nip.contains(element.nip))
                        .toList(),
                  ),
                  status: state.maybeWhen(
                    error: (_) => Status.error,
                    loading: () => Status.progress,
                    orElse: () => Status.loaded,
                  ),
                  initialValue: _action.isEdit
                      ? state.maybeWhen(
                          orElse: () => null,
                          loaded: (employees, nip) => employees
                              .where(
                                (element) =>
                                    [widget.scheduleDetail?.picId].contains(
                                  stringToInt(element.nip),
                                ),
                              )
                              .first,
                        )
                      : null,
                  onChanged: (employee) {
                    if (employee != null) {
                      _picIdController.text = employee.nip;
                    }
                  },
                );
              },
            ),
            FTextFormField(
              labelText: 'Quantity Person',
              controller: _qtyPersonController,
              validator: requiredValidator.call,
            ),
          ],
        ),
        const SizedBox(height: 24),
        FTextFormField(
          labelText: 'Yield',
          controller: _yieldController,
          inputFormatters: [ThousandsWithDecimalFormatter()],
          validator: requiredValidator.call,
        ),
        const SizedBox(height: 24),
        FTextFormField(
          labelText: 'Note',
          controller: _remarksController,
          maxLines: 3,
          validator: requiredValidator.call,
        ),
      ],
    );
  }

  Widget _buildStatusPending() {
    return Column(
      children: [
        FieldTimePicker(
          labelText: 'Time',
          controller: _startTimeController,
          onChanged: (value) => _startTime = value,
          initialSelectedTime: widget.scheduleDetail?.startTime,
          validator: requiredObjectValidator.call,
        ),
        const SizedBox(height: 24),
        RowFields(
          children: [
            BlocBuilder<DepartmentEmployeeQueryBloc,
                DepartmentEmployeeQueryState>(
              builder: (context, state) {
                return FDropDownSearch<Employee>(
                  validator: requiredObjectValidator.call,
                  labelText: 'PIC',
                  itemAsString: (employee) => employee.name,
                  items: state.maybeWhen(
                    orElse: () => [],
                    loaded: (employees, nip) => employees
                        .where((element) => nip.contains(element.nip))
                        .toList(),
                  ),
                  status: state.maybeWhen(
                    error: (_) => Status.error,
                    loading: () => Status.progress,
                    orElse: () => Status.loaded,
                  ),
                  initialValue: _action.isEdit
                      ? state.maybeWhen(
                          orElse: () => null,
                          loaded: (employees, nip) => employees
                              .where(
                                (element) =>
                                    [widget.scheduleDetail?.picId].contains(
                                  stringToInt(element.nip),
                                ),
                              )
                              .first,
                        )
                      : null,
                  onChanged: (employee) {
                    if (employee != null) {
                      _picIdController.text = employee.nip;
                    }
                  },
                );
              },
            ),
            FTextFormField(
              labelText: 'Quantity Person',
              controller: _qtyPersonController,
            ),
          ],
        ),
        const SizedBox(height: 24),
        FTextFormField(
          labelText: 'Remark',
          controller: _remarksController,
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildStatusStart() {
    return Column(
      children: [
        RowFields(
          children: [
            FieldTimePicker(
              labelText: 'Time',
              controller: _startTimeController,
              onChanged: (value) => _startTime = value,
              initialSelectedTime: widget.scheduleDetail?.startTime,
              validator: requiredObjectValidator.call,
            ),
            BlocBuilder<WorkHourShiftQueryBloc, WorkHourShiftQueryState>(
              builder: (context, state) {
                return FDropDownSearch<WorkHourShift>(
                  labelText: 'Shift',
                  itemAsString: (workHour) => workHour.name,
                  items: state.maybeWhen(
                    orElse: () => [],
                    loaded: (shift) => shift,
                  ),
                  initialValue: _workHourShift,
                  onChanged: (workHourShift) {
                    if (workHourShift != null) {
                      _workHourShift = workHourShift;
                    }
                  },
                );
              },
            ),
          ],
        ),
        const Gap(24),
        BlocBuilder<DepartmentEmployeeQueryBloc, DepartmentEmployeeQueryState>(
          builder: (context, state) {
            return FDropDownSearch<Employee>(
              validator: requiredObjectValidator.call,
              labelText: 'PIC',
              itemAsString: (employee) => employee.name,
              items: state.maybeWhen(
                orElse: () => [],
                loaded: (employees, nip) => employees
                    .where((element) => nip.contains(element.nip))
                    .toList(),
              ),
              status: state.maybeWhen(
                error: (_) => Status.error,
                loading: () => Status.progress,
                orElse: () => Status.loaded,
              ),
              initialValue: _action.isEdit
                  ? state.maybeWhen(
                      orElse: () => null,
                      loaded: (employees, nip) => employees
                          .where(
                            (element) =>
                                [widget.scheduleDetail?.picId].contains(
                              stringToInt(element.nip),
                            ),
                          )
                          .first,
                    )
                  : null,
              onChanged: (employee) {
                if (employee != null) {
                  _picIdController.text = employee.nip;
                }
              },
            );
          },
        ),
      ],
    );
  }
}
