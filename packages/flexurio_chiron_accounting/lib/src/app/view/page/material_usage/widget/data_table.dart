import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/material_usage_global_query/material_usage_global_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_usage_global.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_usage/widget/material_usage_detail_export_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_usage/widget/material_usage_global_export_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialUsageDetailDataTable extends StatefulWidget {
  const MaterialUsageDetailDataTable({super.key});

  @override
  State<MaterialUsageDetailDataTable> createState() =>
      _MaterialUsageDetailDataTableState();
}

class _MaterialUsageDetailDataTableState
    extends State<MaterialUsageDetailDataTable> {
  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<MaterialGlobalUsageQueryBloc>();
    return BlocBuilder<MaterialGlobalUsageQueryBloc,
        MaterialUsageGlobalQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<MaterialUsageGlobal>(
            freezeFirstColumn: true,
            onRefresh: () {
              queryBloc.add(
                MaterialUsageGlobalQueryEvent.fetch(
                  pageOptions: PageOptions.empty(sortBy: 'material_issue_id'),
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
              context.read<MaterialGlobalUsageQueryBloc>().add(
                    MaterialUsageGlobalQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: () => PageOptions.empty(
                sortBy: 'material_issue_id',
              ),
            ),
            actionRight: (refreshButton) => [
              MaterialUsageDetailExportPdfButton.prepare(),
              MaterialUsageGlobalExportPdfButton.prepare(),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 15,
                head: const DTHead(
                  label: 'MI.No',
                  backendColumn: 'material_issue_id',
                ),
                body: (apPaymentDetail) => DataCell(
                  Text(apPaymentDetail.materialIssueId),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'date'.tr(),
                  backendColumn: 'material_issue_date',
                ),
                body: (apPaymentDetail) => DataCell(
                  Text(
                    DateFormat('dd/MM/yyyy')
                        .format(apPaymentDetail.materialIssueDate),
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 15,
                head: DTHead(
                  label: 'description_usage'.tr(),
                  backendColumn: 'description',
                ),
                body: (apPaymentDetail) => DataCell(
                  Text(apPaymentDetail.description),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'total'.tr(),
                  backendColumn: 'total_price',
                ),
                body: (apPaymentDetail) => DataCell(
                  Text(apPaymentDetail.totalPrice.format()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
