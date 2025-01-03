import 'package:appointment/constant/company.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/cash_flow_query/cash_flow_query_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({
    super.key,
  });

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  Company _company = Company.metiskaFarma;
  final _idController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime? _periodStart;
  DateTime? _periodEnd;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<CashFlowQueryBloc>().add(
            CashFlowQueryEvent.fetch(
              company: _company,
              transactionNo: _idController.text,
              periodStart: _periodStart,
              periodEnd: _periodEnd,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CashFlowQueryBloc, CashFlowQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Form(
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
            const SizedBox(height: 12),
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
            const SizedBox(height: 12),
            FieldDatePicker(
              maxDate: DateTime.now(),
              onChanged: (value) => _periodStart = value,
              controller: TextEditingController(),
              labelText: 'Period Start',
            ),
            const SizedBox(height: 12),
            FieldDatePicker(
              maxDate: DateTime.now(),
              onChanged: (value) => _periodEnd = value,
              controller: TextEditingController(),
              labelText: 'Period End',
            ),
            const SizedBox(height: 12),
            FTextFormField(
              labelText: 'Input No. Transaction',
              controller: _idController,
            ),
            const SizedBox(height: 12),
            BlocBuilder<CashFlowQueryBloc, CashFlowQueryState>(
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
      ),
    );
  }
}
