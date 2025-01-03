import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CostReportDataTable extends StatefulWidget {
  const CostReportDataTable({super.key});

  @override
  State<CostReportDataTable> createState() => _CostReportDataTableState();
}

class _CostReportDataTableState extends State<CostReportDataTable> {
  DateTime? _dateStart;
  DateTime? _dateEnd;
  Department? _department;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _dateStart = now.startOfMonth;
    _dateEnd = now.endOfMonth;
    _fetch();
  }

  void _fetch({PageOptions<CostReport>? pageOptions}) {
    context.read<CostReportQueryBloc>().add(
          CostReportQueryEvent.fetch(
            startDate: _dateStart!,
            endDate: _dateEnd!,
            department: _department?.id,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CostReportQueryBloc, CostReportQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<CostReport>(
            freezeFirstColumn: true,
            onRefresh: _fetch,
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              _fetch(pageOptions: pageOptions);
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionLeft: [
              BlocBuilder<DepartmentQueryBloc, DepartmentQueryState>(
                builder: (context, state) {
                  return DropDownSmall<Department>(
                    labelText: 'department'.tr(),
                    initialValue: _department,
                    itemAsString: (filter) => filter.name,
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (pageOptions) => pageOptions.data,
                    ),
                    onChanged: (value) {
                      _department = value;
                      _fetch();
                    },
                  );
                },
              ),
              DropDownSmallDate(
                initialValue: _dateStart,
                labelText: 'start_date'.tr(),
                onChanged: (date) {
                  _dateStart = date;
                  _fetch();
                },
              ),
              DropDownSmallDate(
                initialValue: _dateEnd,
                labelText: 'end_date'.tr(),
                onChanged: (date) {
                  _dateEnd = date;
                  _fetch();
                },
              ),
            ],
            actionRight: (refreshButton) => [
              LightButtonSmallGroup(
                action: DataAction.exportPdf,
                children: {
                  PermissionAccounting.costReportExportPdf:
                      CostReportExportPdfButton.prepare(
                    dateTimeStart: _dateStart!,
                    dateTimeEnd: _dateEnd!,
                    departmentId: _department?.id,
                  ),
                  PermissionAccounting.costReportDetailExportPdf:
                      CostReportDetailExportPdfButton.prepare(
                    dateTimeStart: _dateStart!,
                    dateTimeEnd: _dateEnd!,
                    departmentId: _department?.id,
                  ),
                  PermissionAccounting.costReportDetailWithTotalExportPdf:
                      CostReportDetailWithTotalExportPdfButton.prepare(
                    dateTimeStart: _dateStart!,
                    dateTimeEnd: _dateEnd!,
                    departmentId: _department?.id,
                  ),
                },
              ),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'chart_of_account'.tr(),
                  backendColumn: 'chart_of_account_name',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.chartOfAccountName),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'transaction_no'.tr(),
                  backendColumn: 'transaction_no',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.transactionNo),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'department'.tr(),
                  backendColumn: 'department_name',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.departmentName),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  numeric: true,
                  label: 'debit'.tr(),
                  backendColumn: 'debit',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.debit.format()),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  numeric: true,
                  label: 'credit'.tr(),
                  backendColumn: 'credit',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.credit.format()),
                ),
              ),
              DTColumn(
                widthFlex: 12,
                head: DTHead(
                  label: 'description'.tr(),
                  backendColumn: 'description',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.description),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
