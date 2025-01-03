import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receive_detail/widget/review_form_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class InvoiceReceiveDetailViewPage extends StatelessWidget {
  const InvoiceReceiveDetailViewPage._({required this.invoiceReceiveDetail});

  final InvoiceReceiveDetail invoiceReceiveDetail;

  static Route<void> route(InvoiceReceiveDetail invoiceReceiveDetail) {
    return MaterialPageRoute(
      builder: (context) => InvoiceReceiveDetailViewPage._(
          invoiceReceiveDetail: invoiceReceiveDetail),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          action: DataAction.view,
          entity: Entity.invoiceReceiveDetail,
          size: SingleFormPanelSize.large,
          actions:
              _buildInvoiceReceiveDetailActions(invoiceReceiveDetail, context),
          children: [
            InvoiceReceiveDetailReviewFormPage(
              invoiceReceiveDetail: invoiceReceiveDetail,
            ),
          ],
        ));
  }

  List<Widget> _buildInvoiceReceiveDetailActions(
      InvoiceReceiveDetail invoiceReceiveDetail, BuildContext context) {
    return [
      InvoiceReceiveDetailDeleteButton.prepare(
        invoiceReceiveDetail: invoiceReceiveDetail,
      ),
    ];
  }
}
