import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/petty_cash_query/petty_cash_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/petty_cash.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/petty_cash/widget/create_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/petty_cash/widget/export_excel_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/petty_cash/widget/export_excel_report_completed_petty_cash.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/petty_cash/widget/export_report_pdf_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/petty_cash_view/petty_cash_view_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PettyCashDataTable extends StatefulWidget {
  const PettyCashDataTable({super.key});

  @override
  State<PettyCashDataTable> createState() => _PettyCashDataTableState();
}

class _PettyCashDataTableState extends State<PettyCashDataTable> {
  var _status = PettyCashStatus.input;
  var _month = DateTime.now();

  void _fetch() {
    context.read<PettyCashQueryBloc>().add(
          PettyCashQueryEvent.fetch(
            status: _status,
            startDate: _month.startOfMonth,
            endDate: _month.endOfMonth,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PettyCashQueryBloc, PettyCashQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<PettyCash>(
            freezeFirstColumn: true,
            onRefresh: () => _fetch(),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<PettyCashQueryBloc>().add(
                    PettyCashQueryEvent.fetch(pageOptions: pageOptions),
                  );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              LightButtonSmallGroup(
                action: DataAction.export,
                children: {
                  PettyCashExportReportPDFButton.permission:
                      PettyCashExportReportPDFButton.prepare(),
                  PettyCashExportExcelButton.permission:
                      PettyCashExportExcelButton.prepare(),
                  ReportCompletedPettyCashExportExcelButton.permission:
                      ReportCompletedPettyCashExportExcelButton.prepare(),
                },
              ),
              refreshButton,
              const PettyCashCreateButton(),
            ],
            actionLeft: [
              _buildDropDownStatus(),
              _buildFilterSelectPeriod(),
            ],
            columns: [
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'ID',
                  backendColumn: 'id',
                ),
                body: (pettyCash) => DataCell(
                  Text(pettyCash.id).canCopy(
                    onTap: () {
                      Navigator.push(
                        context,
                        PettyCashViewPage.route(pettyCash),
                      ).then((_) {
                        _fetch();
                      });
                    },
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 9,
                head: DTHead(
                  label: 'status'.tr(),
                  backendColumn: 'status',
                ),
                body: (pettyCash) => DataCell(ChipType(pettyCash.status)),
              ),
              DTColumn(
                widthFlex: 9,
                head: DTHead(
                  label: 'purchase_order'.tr(),
                  backendColumn: 'PurchaseOrder__id',
                ),
                body: (pettyCash) => DataCell(
                  Text(pettyCash.purchaseOrder.id).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 9,
                head: DTHead(
                  label: 'down_payment'.tr(),
                  backendColumn: 'PurchaseOrderDownPayment__id',
                ),
                body: (pettyCash) => DataCell(
                  Text(pettyCash.purchaseOrderDownPayment.id).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'amount'.tr(),
                  backendColumn: 'amount',
                  numeric: true,
                ),
                body: (pettyCash) => DataCell(Text(pettyCash.amount.format())),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'Realization No',
                  backendColumn: 'realization_no',
                ),
                body: (pettyCash) => DataCell(
                  pettyCash.realizationNo != null
                      ? Text(pettyCash.realizationNo!).canCopy()
                      : const SizedBox(),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'Realization Amount',
                  backendColumn: 'realization_amount',
                  numeric: true,
                ),
                body: (pettyCash) =>
                    DataCell(Text(pettyCash.realizationAmount.format())),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  label: 'Return Amount',
                  backendColumn: 'return_amount',
                  numeric: true,
                ),
                body: (pettyCash) =>
                    DataCell(Text(pettyCash.returnAmount?.format() ?? '-')),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'created_by'.tr(),
                  backendColumn: 'created_by_id',
                ),
                body: (pettyCash) => DataCell(
                  GetNameUser(userId: pettyCash.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (pettyCash) =>
                    DataCell(Text(pettyCash.createdAt.yMMMdHm)),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'updated_by'.tr(),
                  backendColumn: 'updated_by_id',
                ),
                body: (pettyCash) => DataCell(
                  GetNameUser(userId: pettyCash.updateById),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'updated_at'.tr(),
                  backendColumn: 'updated_at',
                ),
                body: (pettyCash) =>
                    DataCell(Text(pettyCash.updatedAt.yMMMdHm)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDropDownStatus() => DropDownSmall<PettyCashStatus>(
        key: ValueKey(_status),
        initialValue: _status,
        labelText: 'Status',
        icon: Icons.filter_list,
        itemAsString: (status) => status.label,
        items: PettyCashStatus.list,
        onChanged: (status) {
          if (status != null) {
            _status = status;
            _fetch();
          }
        },
      );

  Widget _buildFilterSelectPeriod() => DropDownSmallYearMonth(
        initialValue: _month,
        maxDate: DateTime.now(),
        labelText: 'period'.tr(),
        onChanged: (date) {
          _month = date;
          _fetch();
        },
      );
}
