import 'package:flexurio_chiron_finance/src/app/bloc/invoice_receive_detail_query/invoice_receive_detail_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receive_detail_create/create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceReceiveDetailCreateButton extends StatelessWidget {
  const InvoiceReceiveDetailCreateButton({
    required this.invoiceReceive,
    super.key,
  });

  final InvoiceReceive invoiceReceive;

  @override
  Widget build(BuildContext context) {
    return Button(
      action: DataAction.create,
      permission: Permission.invoiceReceiveCreate,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool>(
            builder: (context) => InvoiceReceiveDetailCreatePage.prepare(
              invoiceReceive: invoiceReceive,
            ),
          ),
        ).then((value) {
          if (value ?? false) {
            context.read<InvoiceReceiveDetailQueryBloc>().add(
                  InvoiceReceiveDetailQueryEvent.fetch(
                    invoiceId: invoiceReceive.id,
                  ),
                );
          }
        });
      },
    );
  }
}
