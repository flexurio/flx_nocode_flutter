import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/purchase_summary_detail_query/purchase_summary_detail_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/purchase_summary_detail.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/purchase_summary/widget/purchase_summary_detail_export_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/purchase_summary/widget/purchase_summary_global_export_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchaseSummaryDetailDataTable extends StatefulWidget {
  const PurchaseSummaryDetailDataTable({super.key});

  @override
  State<PurchaseSummaryDetailDataTable> createState() =>
      _PurchaseSummaryDetailDataTableState();
}

class _PurchaseSummaryDetailDataTableState
    extends State<PurchaseSummaryDetailDataTable> {
  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<PurchaseSummaryDetailQueryBloc>();
    return BlocBuilder<PurchaseSummaryDetailQueryBloc,
        PurchaseSummaryDetailQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<PurchaseSummaryDetail>(
            freezeFirstColumn: true,
            onRefresh: () {
              queryBloc.add(
                PurchaseSummaryDetailQueryEvent.fetch(
                  pageOptions: PageOptions.empty(sortBy: 'transaction_date'),
                ),
              );
            },
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<PurchaseSummaryDetailQueryBloc>().add(
                    PurchaseSummaryDetailQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: () => PageOptions.empty(sortBy: 'transaction_date'),
            ),
            actionRight: (refreshButton) => [
              PurchaseSummaryDetailExportPdfButton.prepare(),
              PurchaseSummaryGlobalExportPdfButton.prepare(),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'description'.tr(),
                  backendColumn: 'description',
                ),
                body: (purchaseSummaryDetail) => DataCell(
                  Text(purchaseSummaryDetail.description),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'unit'.tr(),
                  backendColumn: 'unit_id',
                ),
                body: (purchaseSummaryDetail) => DataCell(
                  Text(purchaseSummaryDetail.unitId ?? '-'),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'quantity'.tr(),
                  backendColumn: 'quantity',
                ),
                body: (purchaseSummaryDetail) => DataCell(
                  Text(
                    (purchaseSummaryDetail.quantity ?? 0).format(),
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'price'.tr(),
                  backendColumn: 'price',
                ),
                body: (purchaseSummaryDetail) => DataCell(
                  Text(purchaseSummaryDetail.price.format()),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'subtotal'.tr(),
                  backendColumn: 'subtotal',
                ),
                body: (purchaseSummaryDetail) => DataCell(
                  Text(purchaseSummaryDetail.subtotal.format()),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'ppn_value'.tr(),
                  backendColumn: 'ppn_value',
                ),
                body: (purchaseSummaryDetail) => DataCell(
                  Text(purchaseSummaryDetail.ppnValue.format()),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'pph22_value'.tr(),
                  backendColumn: 'pph22_value',
                ),
                body: (purchaseSummaryDetail) => DataCell(
                  Text(purchaseSummaryDetail.pph22Value.format()),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'total'.tr(),
                  backendColumn: 'total',
                ),
                body: (purchaseSummaryDetail) => DataCell(
                  Text(purchaseSummaryDetail.total.format()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
