import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/payment_settlement_return_query/payment_settlement_return_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/payment_settlement/util/pdf_payment_settlement_return.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PaymentSettlementReturnExportPdfButton extends StatefulWidget {
  const PaymentSettlementReturnExportPdfButton({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => PaymentSettlementReturnQueryBloc(),
      child: const PaymentSettlementReturnExportPdfButton(),
    );
  }

  @override
  State<PaymentSettlementReturnExportPdfButton> createState() =>
      _PaymentSettlementReturnExportPdfButtonState();
}

class _PaymentSettlementReturnExportPdfButtonState
    extends State<PaymentSettlementReturnExportPdfButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PaymentSettlementReturnQueryBloc>();

    return BlocListener<PaymentSettlementReturnQueryBloc,
        PaymentSettlementReturnQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfPaymentSettlementReturn(
                  data: pageOptions.data,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Payment-Settlement-Return.pdf',
            );
          },
        );
      },
      child: BlocBuilder<PaymentSettlementReturnQueryBloc,
          PaymentSettlementReturnQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportPdf,
            title: 'payment_settlement_return'.tr(),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            permission: PermissionFinance.paymentSettlementReturnExportPdf,
            onPressed: () {
              bloc.add(
                PaymentSettlementReturnQueryEvent.fetch(
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
