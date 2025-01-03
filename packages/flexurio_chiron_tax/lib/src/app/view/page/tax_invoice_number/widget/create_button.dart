import 'package:flexurio_chiron_tax/src/app/bloc/tax_invoice_number_query/tax_invoice_number_query_bloc.dart';
import 'package:flexurio_chiron_tax/src/app/view/page/tax_invoice_number/widget/tax_invoice_number_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaxInvoiceNumberCreateButton extends StatelessWidget {
  const TaxInvoiceNumberCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    return Button.small(
      permission: Permission.taxInvoiceNumberCreate,
      action: action,
      onPressed: () async {
        final queryBloc = context.read<TaxInvoiceNumberQueryBloc>();
        const queryEvent = TaxInvoiceNumberQueryEvent.fetch();
        final success =
            await Navigator.push(context, TaxInvoiceNumberCreatePage.route());
        if (success ?? false) {
          queryBloc.add(queryEvent);
        }
      },
    );
  }
}
