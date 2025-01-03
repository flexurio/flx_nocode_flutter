import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_payment_query/transaction_payment_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_payment.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_journal/widget/create_payment_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_journal/widget/payment_view_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_journal/widget/transaction_payment_create_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_journal/widget/transaction_view_button.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/customer.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/supplier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PaymentDataTable extends StatefulWidget {
  const PaymentDataTable({super.key});

  @override
  State<PaymentDataTable> createState() => _PaymentDataTableState();
}

class _PaymentDataTableState extends State<PaymentDataTable> {
  var _type = TransactionJournalType.receivable;
  var _paidType = TransactionJournalPaidType.paidOff;
  late PickerDateRange _dateRange;
  Supplier? _supplier;
  Customer? _customer;

  @override
  void initState() {
    super.initState();

    final now = DateTime.now();
    _dateRange = PickerDateRange(now.startOfMonth, now.endOfMonth);

    _fetch();
  }

  void _fetch({PageOptions<TransactionPayment>? pageOptions}) {
    double? paymentRemainingNotEqualTo = null;
    double? paymentRemainingEqualTo = 0;

    final isNotYetPaidOff =
        _paidType == TransactionJournalPaidType.notYetPaidOff;
    if (isNotYetPaidOff) {
      paymentRemainingEqualTo = null;
      paymentRemainingNotEqualTo = 0;
    }

    context.read<TransactionPaymentQueryBloc>().add(
          TransactionPaymentQueryEvent.fetch(
            pageOptions: pageOptions,
            type: _type,
            supplierId: _supplier?.id,
            customerId: _customer?.id,
            paymentRemainingNotEqualTo: paymentRemainingNotEqualTo,
            paymentRemainingEqualTo: paymentRemainingEqualTo,
            dateGreaterThanEqualTo:
                isNotYetPaidOff ? _dateRange.startDate?.startOfDay : null,
            dateLessThanEqualTo:
                isNotYetPaidOff ? _dateRange.endDate?.endOfDay : null,
            paymentDateGreaterThanEqualTo:
                isNotYetPaidOff ? null : _dateRange.startDate?.startOfDay,
            paymentDateLessThanEqualTo:
                isNotYetPaidOff ? null : _dateRange.endDate?.endOfDay,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<TransactionPaymentQueryBloc>();
    return BlocBuilder<TransactionPaymentQueryBloc,
        TransactionPaymentQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<TransactionPayment>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: _fetch,
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) => _fetch(pageOptions: pageOptions),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              refreshButton,
              if (_type.isReceivable)  PaymentCreateButton(
                customer: _customer,
              ),
            ],
            actionLeft: [
              _buildFilterSelectPeriod(),
              _buildFilterPaidType(),
              _buildFilterType(),
              _type == TransactionJournalType.receivable
                  ? _buildDropDownCustomer()
                  : _buildDropDownSupplier(),
            ],
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  backendColumn: 'transaction_no',
                  label: 'transaction_no'.tr(),
                ),
                body: (payment) =>
                    DataCell(Text(payment.transactionNo).canCopy()),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'transaction_date'.tr(),
                  backendColumn: 'transaction_date',
                ),
                body: (payment) =>
                    DataCell(Text(payment.transactionDate.yMMMd)),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'supplier'.tr(),
                  backendColumn: 'supplier',
                ),
                body: (payment) => DataCell(Text(payment.supplierName)),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'order_id'.tr(),
                  backendColumn: 'order_id',
                ),
                body: (payment) => DataCell(Text(payment.orderId).tr()),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'total'.tr(),
                  backendColumn: 'total',
                ),
                body: (payment) => DataCell(Text(payment.total.format())),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'invoice_no'.tr(),
                  backendColumn: 'invoice_no',
                ),
                body: (payment) => DataCell(Text(payment.invoiceNo ?? '-')),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'payment_no'.tr(),
                  backendColumn: 'payment_id',
                ),
                body: (payment) =>
                    DataCell(Text(payment.paymentId ?? '-').canCopy()),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'payment_date'.tr(),
                  backendColumn: 'payment_date',
                ),
                body: (payment) =>
                    DataCell(Text(payment.paymentDate?.yMMMd ?? '-')),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'payment_total'.tr(),
                  backendColumn: 'payment_total',
                ),
                body: (payment) =>
                    DataCell(Text(payment.paymentTotal.format())),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'payment_remaining'.tr(),
                  backendColumn: 'payment_remaining',
                ),
                body: (payment) =>
                    DataCell(Text(payment.paymentRemaining.format())),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'period'.tr(),
                  backendColumn: 'period',
                ),
                body: (payment) => DataCell(Text(payment.period)),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (payment) => DataCell(
                  Row(
                    children: [
                      TransactionViewButton(payment: payment),
                      PaymentViewButton(payment: payment),
                      if (_type.isPayable && payment.paymentId == null)
                        TransactionPaymentCreateButton(
                          payment: payment,
                          onSuccess: () {
                            queryBloc.add(
                                const TransactionPaymentQueryEvent.fetch());
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterType() {
    return DropDownSmall<TransactionJournalType>(
      labelText: 'type'.tr(),
      initialValue: _type,
      icon: Icons.list,
      itemAsString: (type) => type.label.tr(),
      items: TransactionJournalType.list,
      onChanged: (type) {
        if (type == null) return;
        _type = type;
        _supplier = null;
        _customer = null;
        _fetch();
        setState(() {});
      },
    );
  }

  Widget _buildFilterPaidType() {
    return DropDownSmall<TransactionJournalPaidType>(
      labelText: 'type'.tr(),
      initialValue: _paidType,
      icon: Icons.list,
      itemAsString: (type) => type.value.tr(),
      items: TransactionJournalPaidType.list,
      onChanged: (type) {
        if (type == null) return;
        _paidType = type;
        _fetch();
        setState(() {});
      },
    );
  }

  Widget _buildDropDownSupplier() {
    return FDropDownSearchSmallSupplier(
      key: ValueKey(_type),
      width: 400,
      initialValue: _supplier,
      onChanged: (supplier) {
        if (supplier == null) return;

        _supplier = supplier;
        _fetch();
      },
    );
  }

  Widget _buildDropDownCustomer() {
    return FDropDownSearchSmallCustomer(
      key: ValueKey(_type),
      width: 400,
      initialValue: _customer,
      onChanged: (customer) {
        if (customer == null) return;
        _customer = customer;
        _fetch();
      },
    );
  }

  Widget _buildFilterSelectPeriod() => DropDownSmallDateRange(
        initialValue: _dateRange,
        maxDate: DateTime.now(),
        labelText: 'date'.tr(),
        onChanged: (date) {
          _dateRange = date;
          _fetch();
        },
      );
}
