import 'package:flexurio_chiron_accounting/src/app/bloc/chart_of_account_group_query/chart_of_account_group_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/chart_of_account_number/chart_of_account_number_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_group.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/chart_of_account_group.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class ChartOfAccountNumberCreatePage extends StatefulWidget {
  const ChartOfAccountNumberCreatePage({super.key, this.chartOfAccountNumber});

  final ChartOfAccountNumber? chartOfAccountNumber;

  static Route<bool?> route({ChartOfAccountNumber? chartOfAccountNumber}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ChartOfAccountNumberBloc(),
          ),
          BlocProvider(
            create: (context) => ChartOfAccountGroupQueryBloc()
              ..add(ChartOfAccountGroupQueryEvent.fetch()),
          ),
        ],
        child: ChartOfAccountNumberCreatePage(
          chartOfAccountNumber: chartOfAccountNumber,
        ),
      ),
    );
  }

  @override
  State<ChartOfAccountNumberCreatePage> createState() =>
      _ChartOfAccountNumberCreatePageState();
}

class _ChartOfAccountNumberCreatePageState
    extends State<ChartOfAccountNumberCreatePage> {
  late DataAction _action;
  var _isFactoryOverhead = false;
  late ChartOfAccountNumberStatus _status;
  late ChartOfAccountGroup _chartOfAccountGroup;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _statusController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _action = createOrEdit(widget.chartOfAccountNumber);

    if (_action.isEdit) {
      _status = widget.chartOfAccountNumber!.status;
      _nameController.text = widget.chartOfAccountNumber!.name;
      _statusController.text = widget.chartOfAccountNumber!.status.label;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (_action.isEdit) {
        context.read<ChartOfAccountNumberBloc>().add(
              ChartOfAccountNumberEvent.update(
                id: widget.chartOfAccountNumber!.id,
                name: _nameController.text,
                status: _status,
              ),
            );
      } else {
        context.read<ChartOfAccountNumberBloc>().add(
              ChartOfAccountNumberEvent.create(
                name: _nameController.text,
                number: _numberController.text,
                chartOfAccountGroup: _chartOfAccountGroup,
                status: _status,
                isFactoryOverhead: _isFactoryOverhead,
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.chartOfAccountNumber;
    return BlocListener<ChartOfAccountNumberBloc, ChartOfAccountNumberState>(
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
          formKey: _formKey,
          action: _action,
          entity: entity,
          actions: [
            BlocBuilder<ChartOfAccountNumberBloc, ChartOfAccountNumberState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  action: _action,
                  onPressed: _submit,
                  isInProgress: state.maybeWhen(
                    orElse: () => false,
                    loading: () => true,
                  ),
                );
              },
            ),
          ],
          children: [
            if (_action.isCreate)
              Column(
                children: [
                  FDropDownSearchChartOfAccountGroup(
                    initialValue:
                        widget.chartOfAccountNumber?.chartOfAccountGroup,
                    onChanged: (chartOfAccountGroup) {
                      _chartOfAccountGroup = chartOfAccountGroup!;
                    },
                  ),
                  const Gap(24),
                  RowFields(
                    children: [
                      FTextFormField(
                        labelText: 'COA',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        controller: _numberController,
                        validator: requiredValidator.call,
                      ),
                    ],
                  ),
                  const Gap(24),
                  SelectChipField<ChartOfAccountNumberStatus>(
                    validator: requiredValidator.call,
                    label: 'Status',
                    controller: _statusController,
                    getLabel: (status) => status.label,
                    options: ChartOfAccountNumberStatus.list,
                    onChanged: (value) {
                      _status = value;
                    },
                  ),
                  const Gap(24),
                  CheckboxWithText(
                    initialValue: _isFactoryOverhead,
                    text: 'Factory Overhead',
                    onChanged: (value) {
                      _isFactoryOverhead = value;
                    },
                  ),
                ],
              ),
            if (_action.isEdit)
              Column(
                children: [
                  RowFields(
                    children: [
                      TileDataVertical(
                        label: 'Number',
                        child: Text(widget.chartOfAccountNumber!.id),
                      ),
                      TileDataVertical(
                        label: 'Group',
                        child: Text(
                          widget.chartOfAccountNumber!.chartOfAccountGroup.name,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            const Gap(24),
            FTextFormField(
              labelText: 'Name',
              controller: _nameController,
              validator: requiredValidator.call,
            ),
            const Gap(24),
            if (_action.isEdit)
              SelectChipField<ChartOfAccountNumberStatus>(
                validator: requiredValidator.call,
                label: 'Status',
                controller: _statusController,
                getLabel: (status) => status.label,
                options: ChartOfAccountNumberStatus.list,
                onChanged: (value) {
                  _status = value;
                },
              ),
          ],
        ),
      ),
    );
  }
}
