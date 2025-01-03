import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class WorkHourShiftCreatePage extends StatefulWidget {
  const WorkHourShiftCreatePage._(this.workHourShift);

  final WorkHourShift? workHourShift;

  static Route<bool?> route({WorkHourShift? workHourShift}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => WorkHourShiftBloc()),
        ],
        child: WorkHourShiftCreatePage._(workHourShift),
      ),
    );
  }

  @override
  State<WorkHourShiftCreatePage> createState() =>
      _WorkHourShiftCreatePageState();
}

class _WorkHourShiftCreatePageState extends State<WorkHourShiftCreatePage> {
  late DataAction _action;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  late DateTime _periodStart;
  late DateTime _periodEnd;

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.workHourShift);
    if (_action.isEdit) {
      _nameController.text = widget.workHourShift!.name;
      _periodStart = widget.workHourShift!.periodStart;
      _periodEnd = widget.workHourShift!.periodEnd;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late WorkHourShiftEvent event;

      if (_action.isEdit) {
        event = WorkHourShiftEvent.update(
          widget.workHourShift!.id,
          _nameController.text,
          _periodStart,
          _periodEnd,
        );
      } else {
        event = WorkHourShiftEvent.create(
          _nameController.text,
          _periodStart,
          _periodEnd,
        );
      }

      context.read<WorkHourShiftBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkHourShiftBloc, WorkHourShiftState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(_action, Entity.workHourShift);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          actions: [
            BlocBuilder<WorkHourShiftBloc, WorkHourShiftState>(
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
          action: _action,
          entity: Entity.shift,
          children: [
            FTextFormField(
              labelText: 'Name',
              controller: _nameController,
              validator: requiredValidator.call,
              maxLength: 30,
            ),
            const Gap(24),
            Row(
              children: [
                Expanded(
                  child: FieldDatePicker(
                    labelText: 'Period Start',
                    controller: TextEditingController(),
                    initialSelectedDate: widget.workHourShift?.periodStart,
                    minDate: DateTime.now(),
                    validator: requiredObjectValidator.call,
                    onChanged: (value) => _periodStart = value,
                  ),
                ),
                const Gap(24),
                Expanded(
                  child: FieldDatePicker(
                    labelText: 'Period End',
                    controller: TextEditingController(),
                    initialSelectedDate: widget.workHourShift?.periodEnd,
                    minDate: DateTime.now(),
                    validator: requiredObjectValidator.call,
                    onChanged: (value) => _periodEnd = value,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
