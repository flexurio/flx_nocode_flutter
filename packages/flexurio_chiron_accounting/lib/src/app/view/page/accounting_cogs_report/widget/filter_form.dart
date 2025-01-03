import 'package:appointment/constant/company.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/accounting_cogs_report_query/accounting_cogs_report_query_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({
    super.key,
  });

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  Company _company = Company.metiskaFarma;
  final _formKey = GlobalKey<FormState>();
  final _yearController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<AccountingCogsReportQueryBloc>().add(
            AccountingCogsReportQueryEvent.fetch(
              year: int.parse(_yearController.text),
              division: _company,
            ),
          );
    }
  }

  @override
  void initState() {
    super.initState();
    final now = DateFormat('yyyy').format(DateTime.now());
    _yearController.text = now;
    context.read<AccountingCogsReportQueryBloc>().add(
          AccountingCogsReportQueryEvent.fetch(
            year: int.parse(_yearController.text),
            division: _company,
          ),
        );
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
          FDropDownSearch<Company>(
            initialValue: _company,
            labelText: 'Company',
            items: const [Company.metiskaFarma, Company.teguhsindoLestaritama],
            onChanged: (value) {
              if (value != null) {
                _company = value;
              }
            },
            itemAsString: (company) => company.name,
          ),
          const Gap(12),
          FTextFormField(
            controller: _yearController,
            labelText: 'Year',
            maxLength: 4,
          ),
          const Gap(12),
          BlocBuilder<AccountingCogsReportQueryBloc,
              AccountingCogsReportQueryState>(
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
