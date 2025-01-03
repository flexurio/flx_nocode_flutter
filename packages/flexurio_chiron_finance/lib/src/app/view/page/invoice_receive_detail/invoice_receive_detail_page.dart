import 'package:flexurio_chiron_finance/src/app/model/invoice_receive.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receive_detail/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class InvoiceReceiveDetailPage extends StatelessWidget {
  const InvoiceReceiveDetailPage({required this.invoiceReceive, super.key});

  final InvoiceReceive invoiceReceive;

  static Route<void> route({
    required InvoiceReceive invoiceReceive,
  }) {
    return MaterialPageRoute(
      builder: (context) =>
          InvoiceReceiveDetailPage(invoiceReceive: invoiceReceive),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        Row(
          children: [
            BackButton(),
            Text(
              '${Entity.invoiceReceiveDetail.title} - ${invoiceReceive.id}',
              style: const TextStyle(
                color: Color(0xFF5B6176),
                fontWeight: FontWeight.bold,
                fontSize: 18,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: FCard(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: InvoiceReceiveDetailDataTable.prepare(
                        invoiceReceive: invoiceReceive,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
