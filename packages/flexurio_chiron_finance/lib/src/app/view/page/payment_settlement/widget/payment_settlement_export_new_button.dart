import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/payment_settlement_new_query/payment_settlement_new_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/payment_settlement/util/pdf_payment_settlement_new.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PaymentSettlementNewExportPdfButton extends StatefulWidget {
  const PaymentSettlementNewExportPdfButton({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => PaymentSettlementNewQueryBloc(),
      child: const PaymentSettlementNewExportPdfButton(),
    );
  }

  @override
  State<PaymentSettlementNewExportPdfButton> createState() =>
      _PaymentSettlementNewExportPdfButtonState();
}

class _PaymentSettlementNewExportPdfButtonState
    extends State<PaymentSettlementNewExportPdfButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PaymentSettlementNewQueryBloc>();

    return BlocListener<PaymentSettlementNewQueryBloc,
        PaymentSettlementNewQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfPaymentSettlementNew(
                  data: pageOptions.data,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Payment-Settlement-New.pdf',
            );
          },
        );
      },
      child: BlocBuilder<PaymentSettlementNewQueryBloc,
          PaymentSettlementNewQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportPdf,
            title: 'payment_settlement_new'.tr(),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            permission: PermissionFinance.paymentSettlementNewExportPdf,
            onPressed: () {
              bloc.add(
                PaymentSettlementNewQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(sortBy: 'remark'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
