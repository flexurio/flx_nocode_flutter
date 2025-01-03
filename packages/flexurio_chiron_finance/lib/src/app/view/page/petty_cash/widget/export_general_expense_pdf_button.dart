import 'package:flexurio_chiron_accounting/src/app/model/payment.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/payment_detail_query/payment_detail_query_bloc.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_chiron_finance/src/app/model/petty_cash.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/petty_cash/util/petty_cash_report_general_expense.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PettyCashReportGeneralExpenseButton extends StatelessWidget {
  const PettyCashReportGeneralExpenseButton(
      {required this.pettyCash, super.key});

  final PettyCash pettyCash;

  static Widget prepare(PettyCash pettyCash) {
    return BlocProvider(
      create: (context) => PaymentDetailQueryBloc(),
      child: PettyCashReportGeneralExpenseButton(
        pettyCash: pettyCash,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentDetailQueryBloc, PaymentDetailQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => Toast(context).fail(error),
          loaded: (paymentDetail, payment) async {
            final pdf = pw.Document()
              ..addPage(
                await printReportGeneralExpensePettyCash(
                  pettyCash: pettyCash,
                  paymentDetail: paymentDetail.data,
                  payment: payment,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Petty_Cash_Report_General_Expense.pdf',
            );
          },
        );
      },
      child: LightButton(
        action: DataAction.printPDF,
        title: 'General Expense',
        permission: PermissionFinance.pettyCashViewMenu,
        onPressed: () {
          final payment = Payment(
            id: pettyCash.realizationNo ?? '',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            createdById: 0,
            updateById: 0,
            date: DateTime.now(),
            type: PaymentType.empty,
            totalAmount: 0,
            chartOfAccount: ChartOfAccountNumber.empty(),
            kuCost: 0,
            stampCost: 0,
            rounding: 0,
            artCost: 0,
            otherCost: 0,
            rateGap: 0,
            downPayment: 0,
            rate: 0,
            department: Department.empty(),
            accountAmount: 0,
            remark: '',
            accountName: '',
            accountNumber: '',
          );
          context.read<PaymentDetailQueryBloc>().add(
              PaymentDetailQueryEvent.fetch(
                  payment: payment, pageOptions: PageOptions.emptyNoLimit()));
        },
      ),
    );
  }
}
