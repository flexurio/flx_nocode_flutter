import 'package:flexurio_chiron_accounting/src/app/bloc/chart_of_account_number_invoice_query/chart_of_account_number_invoice_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchChartOfAccountNumberInvoice extends StatelessWidget
    implements DropDownObject<ChartOfAccountNumber> {
  const FDropDownSearchChartOfAccountNumberInvoice({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.label,
    this.enabled = true,
    this.items,
  });

  @override
  final ChartOfAccountNumber? initialValue;

  @override
  final void Function(ChartOfAccountNumber?) onChanged;

  final List<ChartOfAccountNumber>? items;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(ChartOfAccountNumber?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<ChartOfAccountNumberInvoiceQueryBloc,
        ChartOfAccountNumberInvoiceQueryState>(
      builder: (context, state) {
        return FDropDownSearch<ChartOfAccountNumber>(
          enabled: enabled,
          labelText: label ?? Entity.chartOfAccountNumber.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          itemAsString: (chartOfAccountNumber) =>
              '${chartOfAccountNumber.id} - ${chartOfAccountNumber.name}',
          items: items ??
              state.maybeWhen(
                orElse: () => [],
                loaded: (chartOfAccountNumbers) => chartOfAccountNumbers.data,
              ),
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: (_) => Status.progress,
            orElse: () => Status.loaded,
          ),
        );
      },
    );
  }
}
