import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/payment_other_cost_query/payment_other_cost_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment_detail_receivable.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/payment_detail_receivable_query/payment_detail_receivable_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment.dart';
import 'package:flexurio_chiron_accounting/src/app/model/permission.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_payment.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_create/widget/pdf_report_payment_bank_receipt_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_create/widget/pdf_report_payment_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_create/widget/review_form_other_costs_table.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_create/widget/review_form_payments_table.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_journal_edit/edit_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_journal_view/transaction_view_page.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PaymentReviewForm extends StatefulWidget {
  const PaymentReviewForm({
    required this.transactionPayment,
    this.onPrevious,
    this.onRefresh,
    super.key,
  });

  final void Function()? onPrevious;
  final void Function()? onRefresh;
  final TransactionPayment transactionPayment;

  @override
  State<PaymentReviewForm> createState() => _PaymentReviewFormState();
}

class _PaymentReviewFormState extends State<PaymentReviewForm> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentDetailReceivableQueryBloc,
        PaymentDetailReceivableQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
            orElse: () => SomethingWrong(),
            loading: () => const ProgressingIndicator(),
            loaded: (paymentDetail, payment) {
              return FormAction(
                actions: _buildButtonActions(
                  payment: payment,
                  paymentDetail: paymentDetail,
                ),
                children: [
                  RowFields(
                    children: [
                      TileDataVertical(
                        label: 'delivery_date'.tr(),
                        child: Text(payment.date.yMMMMd),
                      ),
                      TileDataVertical(
                        label: 'department'.tr(),
                        child: Text(
                          payment.department != null
                              ? payment.department!.name == ''
                                  ? '-'
                                  : payment.department!.name
                              : '-',
                        ),
                      ),
                    ],
                  ),
                  RowFields(
                    children: [
                      TileDataVertical(
                        label: 'Supplier'.tr(),
                        child: Text(
                          widget.transactionPayment.supplierName,
                        ),
                      ),
                      TileDataVertical(
                        label: 'Payment ID'.tr(),
                        child: Text(payment.id),
                      ),
                    ],
                  ),
                  RowFields(
                    children: [
                      TileDataVertical(
                        label: 'chart_of_account'.tr(),
                        child: Text(
                          payment.chartOfAccountRepayment ?? '-',
                        ),
                      ),
                      TileDataVertical(
                        label: 'payment_type'.tr(),
                        child: ChipType(payment.type),
                      ),
                    ],
                  ),
                  RowFields(
                    children: [
                      TileDataVertical(
                        label: 'rate'.tr(),
                        child: Text(payment.rate.toString()),
                      ),
                      TileDataVertical(
                        label: 'description'.tr(),
                        child: Text(payment.remark),
                      ),
                    ],
                  ),
                  const Gap(24),
                  const Divider(),
                  _buildIconButtonEdit(),
                  const Gap(12),
                  RowFields(
                    children: [
                      _buildTablePayment(paymentDetail: paymentDetail),
                      _buildTableOtherCosts(),
                    ],
                  ),
                  const Gap(48),
                ],
              );
            });
      },
    );
  }

  List<Widget> _buildButtonActions({
    required Payment payment,
    required List<PaymentDetailReceivable> paymentDetail,
  }) {
    return [
      PaymentViewButton(payment: widget.transactionPayment),
      if (widget.transactionPayment.isReceivable) ...[
        PaymentReportPrintButton(
          payment: payment,
          transactionPayment: widget.transactionPayment,
          paymentDetail: paymentDetail,
        ),
        PaymentBankReceiptPrintButton(
          payment: payment,
          transactionPayment: widget.transactionPayment,
          paymentDetail: paymentDetail,
        ),
      ]
    ];
  }

  Widget _buildTableOtherCosts() {
    return Column(
      children: [
        Text(
          'other_costs'.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Gap(12),
        BlocBuilder<PaymentOtherCostQueryBloc, PaymentOtherCostQueryState>(
          builder: (context, state) {
            return ReviewFormOtherCostsTable(
              otherCosts: state.maybeWhen(
                loaded: (pageOptions) => pageOptions.data,
                orElse: () => [],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTablePayment({
    required List<PaymentDetailReceivable> paymentDetail,
  }) {
    return Column(
      children: [
        Text(
          'payments'.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Gap(12),
        ReviewFormPaymentsTable(paymentDetail: paymentDetail),
      ],
    );
  }

  Widget _buildIconButtonEdit() {
    if (widget.transactionPayment.isPayable == false) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: BlocBuilder<PaymentDetailQueryBloc, PaymentDetailQueryState>(
          builder: (context, state) {
            return IconButtonSmall(
              permission: PermissionAccounting.transactionJournalEdit,
              onPressed: state.maybeWhen(
                  orElse: () => null,
                  loaded: (paymentDetail, payment) {
                    return () {
                      Navigator.push(
                        context,
                        TransactionJournalEditPage.route(
                          transactionPayment: widget.transactionPayment,
                          payment: payment,
                        ),
                      ).then((success) {
                        if (success ?? false) {
                          widget.onRefresh?.call();
                        }
                      });
                    };
                  }),
              action: DataAction.edit,
            );
          },
        ),
      ),
    );
  }
}

class PaymentViewButton extends StatelessWidget {
  const PaymentViewButton({
    required this.payment,
    super.key,
  });

  final TransactionPayment payment;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: null,
      action: DataAction.viewTransactionJournal,
      onPressed: () {
        Navigator.push(
          context,
          TransactionViewPage.route(
            payment: payment,
            viewTransactionJournal: true,
          ),
        ).then((value) {});
      },
    );
  }
}
