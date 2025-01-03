import 'package:flexurio_chiron_finance/src/app/bloc/invoice_receive_query/invoice_receive_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receive/widget/export_excel_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receive/widget/create_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receive/widget/view_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receive_with_qr_code_create/widget/create_with_qr_code_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceReceiveDataTable extends StatelessWidget {
  const InvoiceReceiveDataTable({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => InvoiceReceiveQueryBloc()
        ..add(const InvoiceReceiveQueryEvent.fetch()),
      child: const InvoiceReceiveDataTable(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceReceiveQueryBloc, InvoiceReceiveQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<InvoiceReceive>(
            freezeFirstColumn: true,
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<InvoiceReceiveQueryBloc>().add(
                    InvoiceReceiveQueryEvent.fetch(pageOptions: pageOptions),
                  );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              refreshButton,
              const CreateWithQrCodeButton(),
              const ExcelInvoiceReceiveButton(),
              const InvoiceReceiveCreateButton(),
            ],
            onRefresh: () => context
                .read<InvoiceReceiveQueryBloc>()
                .add(const InvoiceReceiveQueryEvent.fetch()),
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'invoice_number'.tr(),
                  backendColumn: 'invoice_no',
                ),
                body: (invoiceReceive) => DataCell(
                  Text(invoiceReceive.id).canCopy(
                    onTap: () {
                      Navigator.push(
                        context,
                        InvoiceReceiveViewPage.route(invoiceReceive),
                      ).then((_) {
                        context
                            .read<InvoiceReceiveQueryBloc>()
                            .add(InvoiceReceiveQueryEvent.fetch());
                      });
                    },
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  label: 'Purchase Order',
                  backendColumn: 'PurchaseOrder.id',
                ),
                body: (invoiceReceive) => DataCell(
                  Text(invoiceReceive.purchaseOrder.id),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'transaction_number'.tr(),
                  backendColumn: 'transaction_id',
                ),
                body: (invoiceReceive) => DataCell(
                  Text(invoiceReceive.transactionId),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'invoice_date'.tr(),
                  backendColumn: 'invoice_date',
                ),
                body: (invoiceReceive) => DataCell(
                  Text(invoiceReceive.invoiceDate.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  numeric: true,
                  label: 'Total',
                  backendColumn: 'total',
                ),
                body: (invoiceReceive) => DataCell(
                  Text(invoiceReceive.total.format()),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (invoiceReceive) => DataCell(
                  Text(invoiceReceive.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'updated_at'.tr(),
                  backendColumn: 'updated_at',
                ),
                body: (invoiceReceive) => DataCell(
                  Text(invoiceReceive.updatedAt.yMMMdHm),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
