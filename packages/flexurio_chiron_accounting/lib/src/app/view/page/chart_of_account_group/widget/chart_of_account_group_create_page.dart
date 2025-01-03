import 'package:flexurio_chiron_accounting/src/app/bloc/balance_group_query/balance_group_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/chart_of_account_group/chart_of_account_group_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/balance_group.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_group.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/balance_group.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class ChartOfAccountGroupCreatePage extends StatefulWidget {
  const ChartOfAccountGroupCreatePage({
    super.key,
    this.chartOfAccountGroup,
  });

  final ChartOfAccountGroup? chartOfAccountGroup;

  static Route<bool?> route({ChartOfAccountGroup? chartOfAccountGroup}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ChartOfAccountGroupBloc(),
          ),
          BlocProvider(
            create: (context) => BalanceGroupQueryBloc()
              ..add(const BalanceGroupQueryEvent.fetch()),
          ),
        ],
        child: ChartOfAccountGroupCreatePage(
          chartOfAccountGroup: chartOfAccountGroup,
        ),
      ),
    );
  }

  @override
  State<ChartOfAccountGroupCreatePage> createState() =>
      _ChartOfAccountGroupCreatePageState();
}

class _ChartOfAccountGroupCreatePageState
    extends State<ChartOfAccountGroupCreatePage> {
  late DataAction _action;
  late BalanceGroup _balanceGroup;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _forecastNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _action = createOrEdit(widget.chartOfAccountGroup);

    if (_action.isEdit) {
      _nameController.text = widget.chartOfAccountGroup!.name;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (_action.isEdit) {
        context.read<ChartOfAccountGroupBloc>().add(
              ChartOfAccountGroupEvent.update(
                id: widget.chartOfAccountGroup!.id,
                name: _nameController.text,
              ),
            );
      } else {
        context.read<ChartOfAccountGroupBloc>().add(
              ChartOfAccountGroupEvent.create(
                name: _nameController.text,
                forecastNumber: _forecastNumberController.text,
                balanceGroup: _balanceGroup,
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.chartOfAccountGroup;
    return BlocListener<ChartOfAccountGroupBloc, ChartOfAccountGroupState>(
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
          size: SingleFormPanelSize.large,
          actions: [
            BlocBuilder<ChartOfAccountGroupBloc, ChartOfAccountGroupState>(
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
                  FTextFormField(
                    labelText: 'name'.tr(),
                    controller: _nameController,
                    validator: requiredValidator.call,
                  ),
                  const Gap(24),
                  FDropDownSearchBalanceGroup(
                    initialValue: widget.chartOfAccountGroup?.balanceGroup,
                    onChanged: (balanceGroup) {
                      _balanceGroup = balanceGroup!;
                    },
                  ),
                  const Gap(24),
                  FTextFormField(
                    labelText: 'account_number'.tr(),
                    controller: _forecastNumberController,
                    validator: requiredValidator.call,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    maxLength: 2,
                  ),
                ],
              ),
            if (_action.isEdit)
              Column(
                children: [
                  RowFields(
                    children: [
                      TileDataVertical(
                        label: 'number'.tr(),
                        child: Text(widget.chartOfAccountGroup!.id),
                      ),
                      TileDataVertical(
                        label: 'type'.tr(),
                        child: ChipType(
                          widget.chartOfAccountGroup!.balanceGroup.type,
                        ),
                      ),
                      TileDataVertical(
                        label: 'category'.tr(),
                        child: ChipType(
                          widget.chartOfAccountGroup!.balanceGroup
                              .profitAndLossBalance,
                        ),
                      ),
                    ],
                  ),
                  const Gap(24),
                  FTextFormField(
                    labelText: 'name'.tr(),
                    controller: _nameController,
                    validator: requiredValidator.call,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
