import 'package:appointment/constant/company.dart';
import 'package:appointment/constant/finance_customer.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/finance_return_note/finance_return_note_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/finance_srp_no_query/finance_srp_no_query_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class FilterForm extends StatefulWidget {
  const FilterForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FinanceSrpNoQueryBloc()
            ..add(const FinanceSrpNoQueryEvent.fetch(Company.metiskaFarma)),
        ),
      ],
      child: const FilterForm._(),
    );
  }

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  late Company _company = Company.metiskaFarma;
  late FinanceCustomer _financeCustomer;
  late DateTime _periodStart;
  late DateTime _periodEnd;
  String? _srpNo;

  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<FinanceReturnNoteQueryBloc>().add(
            FinanceReturnNoteQueryEvent.fetch(
              company: _company,
              customer: _financeCustomer,
              periodEnd: _periodEnd,
              periodStart: _periodStart,
              srpNo: _srpNo ?? '',
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'filter'.tr(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(12),
          FDropDownSearch<Company>(
            initialValue: _company,
            labelText: 'company'.tr(),
            items: const [Company.metiskaFarma, Company.teguhsindoLestaritama],
            onChanged: (value) {
              if (value != null) {
                _company = value;
              }
              context
                  .read<FinanceSrpNoQueryBloc>()
                  .add(FinanceSrpNoQueryEvent.fetch(_company));
            },
            itemAsString: (company) => company.name,
          ),
          const Gap(12),
          FieldDatePicker(
            maxDate: DateTime.now(),
            onChanged: (value) => _periodStart = value,
            controller: TextEditingController(),
            labelText: 'period_start'.tr(),
          ),
          const Gap(12),
          FieldDatePicker(
            maxDate: DateTime.now(),
            onChanged: (value) => _periodEnd = value,
            controller: TextEditingController(),
            labelText: 'period_end'.tr(),
          ),
          const Gap(12),
          FDropDownSearch<FinanceCustomer>(
            labelText: 'customer'.tr(),
            itemAsString: (item) => '[${item.id}] ${item.name}',
            items: financeCustomers,
            onChanged: (value) {
              if (value != null) {
                _financeCustomer = value;
              }
            },
          ),
          const Gap(12),
          BlocBuilder<FinanceSrpNoQueryBloc, FinanceSrpNoQueryState>(
            builder: (context, state) {
              return FDropDownSearch<String>(
                labelText: 'SRP No.',
                itemAsString: (item) => item,
                items: state.maybeWhen(
                  loaded: (srp) => srp,
                  orElse: () => [],
                ),
                status: state.maybeWhen(
                  error: (_) => Status.error,
                  loading: () => Status.progress,
                  orElse: () => Status.loaded,
                ),
                showSelectedItems: true,
                initialValue: _srpNo,
                onChanged: (value) {
                  if (value != null) {
                    _srpNo = value;
                  }
                },
              );
            },
          ),
          const Gap(12),
          BlocBuilder<FinanceReturnNoteQueryBloc, FinanceReturnNoteQueryState>(
            builder: (context, state) {
              return Button(
                permission: null,
                onPressed: state.maybeWhen(
                  orElse: () => _submit,
                  loading: () => null,
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
