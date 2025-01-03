import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/aging_schedule_ap_query/aging_schedule_ap_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/aging_schedule_ap.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/aging_schedule_ap/widget/aging_schedule_ap_detail_export_pdf_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/aging_schedule_ap/widget/aging_schedule_ap_export_pdf_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgingScheduleAPDataTable extends StatefulWidget {
  const AgingScheduleAPDataTable({super.key});

  @override
  State<AgingScheduleAPDataTable> createState() => _AgingScheduleAPDataTableState();
}

class _AgingScheduleAPDataTableState extends State<AgingScheduleAPDataTable> {
  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<AgingScheduleAPQueryBloc>();
    return BlocBuilder<AgingScheduleAPQueryBloc, AgingScheduleAPQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<AgingScheduleAP>(
            freezeFirstColumn: true,
            onRefresh: () {
              queryBloc.add(
                AgingScheduleAPQueryEvent.fetch(
                  pageOptions: PageOptions.empty(sortBy: ''),
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
              context.read<AgingScheduleAPQueryBloc>().add(
                AgingScheduleAPQueryEvent.fetch(
                  pageOptions: pageOptions,
                ),
              );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: () => PageOptions.empty(sortBy: ''),
            ),
            actionRight: (refreshButton) => [                  
              const AgingScheduleAPExportPdfButton(),
              const AgingScheduleAPDetailExportPdfButton(),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'supplier_name'.tr(),
                  backendColumn: 'supplier_name',
                ),
                body: (materialStockInRupiah) => DataCell(
                  Text(materialStockInRupiah.remainingDebtAll.format()),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'remaining_debt15'.tr(),
                  backendColumn: 'remaining_debt15',
                ),
                body: (materialStockInRupiah) => DataCell(
                  Text(materialStockInRupiah.remainingDebt15.format()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
