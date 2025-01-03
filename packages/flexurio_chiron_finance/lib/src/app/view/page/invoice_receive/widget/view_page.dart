import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceReceiveViewPage extends StatelessWidget {
  const InvoiceReceiveViewPage._({required this.invoiceReceive});

  final InvoiceReceive invoiceReceive;

  static Route<void> route(InvoiceReceive invoiceReceive) {
    return MaterialPageRoute(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => InvoiceReceiveQueryBloc()
              ..add(InvoiceReceiveQueryEvent.fetchById(invoiceReceive.id)),
          ),
        ],
        child: InvoiceReceiveViewPage._(
            invoiceReceive: invoiceReceive),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<InvoiceReceiveQueryBloc, InvoiceReceiveQueryState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: SomethingWrong.new,
            loading: (_) => const ProgressingIndicator(),
            loaded: (pageOptions) {
              final invoiceReceive = pageOptions.data.first;
              return SingleFormPanel(
                action: DataAction.view,
                entity: Entity.invoiceReceive,
                size: SingleFormPanelSize.large,
                actions: _buildInvoiceReceiveActions(invoiceReceive, context),
                children: [
                  InvoiceReceiveReviewFormPage(
                    invoiceReceive: pageOptions.data.first,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  List<Widget> _buildInvoiceReceiveActions(
      InvoiceReceive invoiceReceive, BuildContext context) {
    return [
      InvoiceReceiveDetailButton(
        invoiceReceive: invoiceReceive,
      ),
      if (invoiceReceive.receiveByFinanceAt == null)
        InvoiceReceiveEditButton(
            invoiceReceive: invoiceReceive),
      if (invoiceReceive.receiveByFinanceAt == null)
        InvoiceReceiveConfirmFinanceButton.prepare(
          invoiceReceive: invoiceReceive,
        ),
      if (invoiceReceive.receiveByFinanceAt != null)
        if (invoiceReceive.approveHeadAccountingAt == null)
          InvoiceReceiveApproveButton.prepare(
            invoiceReceive: invoiceReceive,
          ),
      if (invoiceReceive.receiveByFinanceAt == null)
        InvoiceReceiveDeleteButton.prepare(
          invoiceReceive: invoiceReceive,
        ),
    ];
  }
}

