import 'package:appointment/constant/company.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/accounting_cogs_process/accounting_cogs_process_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AccountingCogsProcessForm extends StatefulWidget {
  const AccountingCogsProcessForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AccountingCogsProcessBloc()),
      ],
      child: const AccountingCogsProcessForm._(),
    );
  }

  @override
  State<AccountingCogsProcessForm> createState() =>
      _AccountingCogsProcessFormState();
}

class _AccountingCogsProcessFormState extends State<AccountingCogsProcessForm> {
  late DateTime _period;
  Company _company = Company.metiskaFarma;
  final _validityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<AccountingCogsProcessBloc>().add(
            AccountingCogsProcessEvent.reprocess(
              period: _period,
              company: _company,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.reprocess;
    final entity = Entity.cogs;

    return BlocListener<AccountingCogsProcessBloc, AccountingCogsProcessState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => Toast(context).fail(error),
          success: () {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${entity.title}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () {
              Navigator.pop(context);
            },
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<AccountingCogsProcessBloc, AccountingCogsProcessState>(
            builder: (context, state) {
              return Button(
                permission: null,
                isInProgress: state.maybeWhen(
                  orElse: () => false,
                  loading: () => true,
                ),
                onPressed: _submit,
                action: action,
              );
            },
          ),
        ],
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FDropDownSearch<Company>(
                initialValue: _company,
                labelText: 'Company',
                items: const [
                  Company.metiskaFarma,
                  Company.teguhsindoLestaritama,
                ],
                onChanged: (value) {
                  if (value != null) {
                    _company = value;
                  }
                },
                itemAsString: (company) => company.name,
              ),
              const Gap(12),
              FieldMonthPicker(
                labelText: 'Period',
                controller: _validityController,
                validator: requiredObjectValidator.call,
                onChanged: (value) => _period = value,
                maxDate: DateTime.now(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
