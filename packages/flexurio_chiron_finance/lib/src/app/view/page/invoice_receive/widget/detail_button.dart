import 'package:flexurio_chiron_finance/src/app/model/invoice_receive.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receive_detail/invoice_receive_detail_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class InvoiceReceiveDetailButton extends StatelessWidget {
  const InvoiceReceiveDetailButton({required this.invoiceReceive, super.key});

  final InvoiceReceive invoiceReceive;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      action: DataAction.viewDetail,
      permission: null,
      onPressed: () async {
        await Navigator.push(
          context,
          InvoiceReceiveDetailPage.route(
            invoiceReceive: invoiceReceive,
          ),
        );
      },
    );
  }
}
