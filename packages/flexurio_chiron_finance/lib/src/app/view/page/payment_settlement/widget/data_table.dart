import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentSettlementDataTable extends StatefulWidget {
  const PaymentSettlementDataTable({super.key});

  @override
  State<PaymentSettlementDataTable> createState() =>
      _PaymentSettlementDataTableState();
}

class _PaymentSettlementDataTableState
    extends State<PaymentSettlementDataTable> {
  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<PaymentSettlementQueryBloc>();
    return BlocBuilder<PaymentSettlementQueryBloc, PaymentSettlementQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<PaymentSettlement>(
            freezeFirstColumn: true,
            onRefresh: () =>
                queryBloc.add(const PaymentSettlementQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<PaymentSettlementQueryBloc>().add(
                    PaymentSettlementQueryEvent.fetch(pageOptions: pageOptions),
                  );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              LightButtonSmallGroup(
                action: DataAction.exportPdf,
                children: {
                  PermissionFinance.paymentSettlementExportPdf:
                      PaymentSettlementExportPdfButton.prepare(),
                  PermissionFinance.paymentSettlementReturnExportPdf:
                      PaymentSettlementReturnExportPdfButton.prepare(),
                  PermissionFinance.paymentSettlementNewExportPdf:
                      PaymentSettlementNewExportPdfButton.prepare(),
                },
              ),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'payment'.tr(),
                  backendColumn: 'payment_no',
                ),
                body: (paymentSettlement) => DataCell(
                  Text(paymentSettlement.paymentNo).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'transaction'.tr(),
                  backendColumn: 'transaction_no',
                ),
                body: (paymentSettlement) => DataCell(
                  Text(paymentSettlement.transactionNo).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'transaction_date'.tr(),
                  backendColumn: 'transaction_date',
                ),
                body: (paymentSettlement) => DataCell(
                  Text(paymentSettlement.transactionDate.yMMMd),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'customer_name'.tr(),
                  backendColumn: 'customer_name',
                ),
                body: (paymentSettlement) => DataCell(
                  Text(paymentSettlement.customerName),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'customer_id'.tr(),
                  backendColumn: 'customer_id',
                ),
                body: (paymentSettlement) => DataCell(
                  Text(paymentSettlement.customerId),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  numeric: true,
                  label: 'Amount'.tr(),
                  backendColumn: 'value_transaction_type',
                ),
                body: (paymentSettlement) => DataCell(
                  Text(paymentSettlement.valueTransactionType.format()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
