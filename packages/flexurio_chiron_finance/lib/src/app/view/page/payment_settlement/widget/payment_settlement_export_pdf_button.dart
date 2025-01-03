import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/payment_settlement_query/payment_settlement_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/payment_settlement/util/pdf_payment_settlement.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PaymentSettlementExportPdfButton extends StatefulWidget {
  const PaymentSettlementExportPdfButton({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => PaymentSettlementQueryBloc(),
      child: const PaymentSettlementExportPdfButton(),
    );
  }

  @override
  State<PaymentSettlementExportPdfButton> createState() =>
      _PaymentSettlementExportPdfButtonState();
}

class _PaymentSettlementExportPdfButtonState
    extends State<PaymentSettlementExportPdfButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PaymentSettlementQueryBloc>();

    return BlocListener<PaymentSettlementQueryBloc,
        PaymentSettlementQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfPaymentSettlement(
                  data: pageOptions.data,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Payment-Settlement.pdf',
            );
          },
        );
      },
      child:
          BlocBuilder<PaymentSettlementQueryBloc, PaymentSettlementQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportPdf,
            title: 'payment_settlement'.tr(),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            permission: PermissionFinance.paymentSettlementExportPdf,
            onPressed: () {
              bloc.add(
                PaymentSettlementQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
