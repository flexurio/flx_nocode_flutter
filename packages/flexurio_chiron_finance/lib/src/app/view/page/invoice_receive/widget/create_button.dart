import 'package:flexurio_chiron_finance/src/app/bloc/invoice_receive_query/invoice_receive_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receive_create/invoice_receive_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceReceiveCreateButton extends StatelessWidget {
  const InvoiceReceiveCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button.small(
      action: DataAction.create,
      permission: Permission.invoiceReceiveCreate,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => InvoiceReceiveCreatePage.prepare(),
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<InvoiceReceiveQueryBloc>()
                .add(const InvoiceReceiveQueryEvent.fetch());
          }
        });
      },
    );
  }
}
