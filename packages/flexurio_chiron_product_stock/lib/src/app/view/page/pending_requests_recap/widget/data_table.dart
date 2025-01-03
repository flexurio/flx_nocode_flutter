import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/pending_requests_recap.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/pending_requests_recap/widget/pending_requests_detail_export_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/pending_requests_recap/widget/pending_requests_recap_export_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/pending_requests_recap/widget/pending_requests_recap_global_export_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/pending_requests_recap/widget/pending_requests_unserved_export_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/pending_requests_recap_query/pending_requests_recap_query_bloc.dart';

class PendingRequestsRecapDataTable extends StatefulWidget {
  const PendingRequestsRecapDataTable({super.key});

  @override
  State<PendingRequestsRecapDataTable> createState() =>
      _PendingRequestsRecapDataTableState();
}

class _PendingRequestsRecapDataTableState
    extends State<PendingRequestsRecapDataTable> {
  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<PendingRequestsRecapQueryBloc>();
    return BlocBuilder<PendingRequestsRecapQueryBloc,
        PendingRequestsRecapQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<PendingRequestsRecap>(
            freezeFirstColumn: true,
            onRefresh: () {
              queryBloc.add(
                PendingRequestsRecapQueryEvent.fetch(
                  pageOptions: PageOptions.empty(sortBy: 'product_name'),
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
              context.read<PendingRequestsRecapQueryBloc>().add(
                    PendingRequestsRecapQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: () => PageOptions.empty(sortBy: 'product_name'),
            ),
            actionRight: (refreshButton) => [
              const PendingRequestsRecapGlobalExportButton(),
              const PendingRequestsDetailExportButton(),
              const PendingRequestsUnservedExportButton(),
              const PendingRequestsRecapExportButton(),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 12,
                head: DTHead(
                  label: 'product_name'.tr(),
                  backendColumn: 'product_name',
                ),
                body: (pendingRequestsRecap) => DataCell(
                  Text(pendingRequestsRecap.productName),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'qty_request_remaining'.tr(),
                  backendColumn: 'quantity_remaining',
                ),
                body: (pendingRequestsRecap) => DataCell(
                  Text(pendingRequestsRecap.quantityRemaining.format()),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'qty_stock_remaining'.tr(),
                  backendColumn: 'product_stock_quantity_remaining',
                ),
                body: (pendingRequestsRecap) => DataCell(
                  Text(
                    pendingRequestsRecap.productStockQuantityRemaining.format(),
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'value'.tr(),
                  backendColumn: 'total_product_request_price',
                ),
                body: (pendingRequestsRecap) => DataCell(
                  Text(pendingRequestsRecap.totalProductRequestPrice.format()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
