import 'package:flexurio_chiron_accounting/src/app/bloc/chart_of_account_number_query/chart_of_account_number_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/type_cost/type_cost_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:flexurio_chiron_accounting/src/app/view/widget/drop_down_items/chart_of_account_number.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class TypeCostCreatePage extends StatefulWidget {
  const TypeCostCreatePage({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TypeCostBloc()),
        BlocProvider(
          create: (context) => ChartOfAccountNumberQueryBloc()
            ..add(
              ChartOfAccountNumberQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const TypeCostCreatePage(),
    );
  }

  @override
  State<TypeCostCreatePage> createState() => _TypeCostCreatePageState();
}

class _TypeCostCreatePageState extends State<TypeCostCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  late ChartOfAccountNumber _chartOfAccountNumber;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<TypeCostBloc>().add(
            TypeCostEvent.create(
              name: _nameController.text,
              chartOfAccountNumber: _chartOfAccountNumber,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.typeCost;
    return BlocListener<TypeCostBloc, TypeCostState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: () {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          formKey: _formKey,
          action: action,
          entity: entity,
          actions: [
            BlocBuilder<TypeCostBloc, TypeCostState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  action: action,
                  isInProgress: state.maybeWhen(
                    orElse: () => false,
                    loading: () => true,
                  ),
                  onPressed: _submit,
                );
              },
            ),
          ],
          children: [
            FTextFormField(
              labelText: 'Name',
              controller: _nameController,
              validator: requiredValidator.call,
            ),
            const Gap(24),
            FDropDownSearchChartOfAccountNumber(
              label: 'Chart of Account',
              onChanged: (chartOffAccount) {
                if (chartOffAccount != null) {
                  _chartOfAccountNumber = chartOffAccount;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
