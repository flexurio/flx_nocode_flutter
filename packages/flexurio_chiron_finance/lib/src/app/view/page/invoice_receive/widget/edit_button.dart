import 'package:flexurio_chiron_finance/src/app/bloc/invoice_receive_query/invoice_receive_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receive_create/invoice_receive_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceReceiveEditButton extends StatelessWidget {
  const InvoiceReceiveEditButton({required this.invoiceReceive, super.key});

  final InvoiceReceive invoiceReceive;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: Permission.invoiceReceiveEdit,
      action: DataAction.edit,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => InvoiceReceiveCreatePage.prepare(
              invoiceReceive: invoiceReceive,
            ),
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<InvoiceReceiveQueryBloc>()
                .add(InvoiceReceiveQueryEvent.fetchById(invoiceReceive.id));
          }
        });
      },
    );
  }
}
