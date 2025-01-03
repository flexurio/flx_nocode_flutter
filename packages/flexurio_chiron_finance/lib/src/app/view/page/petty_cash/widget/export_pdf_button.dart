import 'package:flexurio_chiron_finance/src/app/bloc/petty_cash_detail_query/petty_cash_detail_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_chiron_finance/src/app/model/petty_cash.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/petty_cash/util/petty_cash_report_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PettyCashReportFormButton extends StatelessWidget {
  const PettyCashReportFormButton({required this.pettyCash, super.key});

  final PettyCash pettyCash;

  static Widget prepare(PettyCash pettyCash) {
    return BlocProvider(
      create: (context) => PettyCashDetailQueryBloc(),
      child: PettyCashReportFormButton(
        pettyCash: pettyCash,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PettyCashDetailQueryBloc, PettyCashDetailQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => Toast(context).fail(error),
          loaded: (pettyCashDetail) async {
            final pdf = pw.Document()
              ..addPage(
                await printReportFormPettyCash(
                  pettyCash: pettyCash,
                  pettyCashDetail: pettyCashDetail.data,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Petty_Cash_Report_Form.pdf',
            );
          },
        );
      },
      child: LightButton(
        action: DataAction.printPDF,
        title: 'Voucher',
        permission: PermissionFinance.pettyCashViewMenu,
        onPressed: () {
          context.read<PettyCashDetailQueryBloc>().add(
                PettyCashDetailQueryEvent.fetchByPettyCashId(
                    pettyCashId: pettyCash.id),
              );
        },
      ),
    );
  }
}
