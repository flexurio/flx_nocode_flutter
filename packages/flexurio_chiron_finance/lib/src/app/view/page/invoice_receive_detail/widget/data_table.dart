import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/invoice_receive_detail_query/invoice_receive_detail_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive_detail.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receive_detail/widget/create_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receive_detail/widget/view_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceReceiveDetailDataTable extends StatelessWidget {
  const InvoiceReceiveDetailDataTable({
    required this.invoiceReceive,
    super.key,
  });

  final InvoiceReceive invoiceReceive;

  static Widget prepare({
    required InvoiceReceive invoiceReceive,
  }) {
    return BlocProvider(
      create: (context) => InvoiceReceiveDetailQueryBloc()
        ..add(
            InvoiceReceiveDetailQueryEvent.fetch(invoiceId: invoiceReceive.id)),
      child: InvoiceReceiveDetailDataTable(
        invoiceReceive: invoiceReceive,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceReceiveDetailQueryBloc,
        InvoiceReceiveDetailQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<InvoiceReceiveDetail>(
            key: ValueKey(state.hashCode),
            freezeFirstColumn: true,
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<InvoiceReceiveDetailQueryBloc>().add(
                    InvoiceReceiveDetailQueryEvent.fetch(
                        pageOptions: pageOptions, invoiceId: invoiceReceive.id),
                  );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              refreshButton,
              InvoiceReceiveDetailCreateButton(
                invoiceReceive: invoiceReceive,
              ),
            ],
            onRefresh: () => context.read<InvoiceReceiveDetailQueryBloc>().add(
                  InvoiceReceiveDetailQueryEvent.fetch(
                    invoiceId: invoiceReceive.id,
                  ),
                ),
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'product'.tr(),
                  backendColumn: 'product.id',
                ),
                body: (invoiceReceiveDetail) => DataCell(
                  Text(invoiceReceiveDetail.product.id.isEmpty
                          ? '-'
                          : invoiceReceiveDetail.product.id)
                      .canCopy(
                    onTap: () {
                      Navigator.push(
                        context,
                        InvoiceReceiveDetailViewPage.route(
                            invoiceReceiveDetail),
                      ).then((_) {
                        context
                            .read<InvoiceReceiveDetailQueryBloc>()
                            .add(InvoiceReceiveDetailQueryEvent.fetch(
                                invoiceId: invoiceReceive.id));
                      });
                    },
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'product_name'.tr(),
                  backendColumn: 'product.name',
                ),
                body: (invoiceReceiveDetail) => DataCell(
                  Text(invoiceReceiveDetail.product.name.isEmpty
                      ? '-'
                      : invoiceReceiveDetail.product.name),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'material'.tr(),
                  backendColumn: 'material.id',
                ),
                body: (invoiceReceiveDetail) => DataCell(
                  Text(
                    invoiceReceiveDetail.material.id.isEmpty
                        ? '-'
                        : invoiceReceiveDetail.material.id,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'material_name'.tr(),
                  backendColumn: 'material.name',
                ),
                body: (invoiceReceiveDetail) => DataCell(
                  Text(
                    invoiceReceiveDetail.material.name.isEmpty
                        ? '-'
                        : invoiceReceiveDetail.material.name,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'quantity'.tr(),
                  backendColumn: 'quantity_invoice',
                ),
                body: (invoiceReceiveDetail) => DataCell(
                  Text(
                    invoiceReceiveDetail.qtyInvoice.toString().isEmpty
                        ? '-'
                        : invoiceReceiveDetail.qtyInvoice.toString(),
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'unit'.tr(),
                  backendColumn: 'unit_id',
                ),
                body: (invoiceReceiveDetail) => DataCell(
                  Text(
                    invoiceReceiveDetail.unitId.isEmpty
                        ? '-'
                        : invoiceReceiveDetail.unitId,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'price'.tr(),
                  backendColumn: 'price',
                ),
                body: (invoiceReceiveDetail) => DataCell(
                  Text(
                    invoiceReceiveDetail.price.format().isEmpty
                        ? '-'
                        : invoiceReceiveDetail.price.format(),
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'total'.tr(),
                  backendColumn: 'total',
                ),
                body: (invoiceReceiveDetail) => DataCell(
                  Text(
                    invoiceReceiveDetail.total.format().isEmpty
                        ? '-'
                        : invoiceReceiveDetail.total.format(),
                  ),
                ),
              ),
              // DTColumnX(
              //   head: const DTHeadX(
              //     label: Text('Actions'),
              //   ),
              //   body: (invoiceReceiveDetail) => DataCell(
              //     Row(
              //       children: [
              //         InvoiceReceiveDetailDeleteButton.prepare(
              //           invoiceReceiveDetail: invoiceReceiveDetail,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
