import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_tax/src/app/bloc/sales_tax_report_query/sales_tax_report_query_bloc.dart';
import 'package:flexurio_chiron_tax/src/app/model/sales_tax_report.dart';
import 'package:flexurio_chiron_tax/src/app/view/page/sales_tax_report/widget/salex_tax_report_excel_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesTaxReportDataTable extends StatefulWidget {
  const SalesTaxReportDataTable({super.key});

  @override
  State<SalesTaxReportDataTable> createState() =>
      _SalesTaxReportDataTableState();
}

class _SalesTaxReportDataTableState extends State<SalesTaxReportDataTable> {
  late DateTime _dateStart;
  late DateTime _dateEnd;

  @override
  void initState() {
    super.initState();
    _dateStart = DateTime.now().startOfMonth;
    _dateEnd = DateTime.now().endOfMonth;

    _fetch();
  }

  void _fetch() {
    context.read<SalesTaxReportQueryBloc>().add(
          SalesTaxReportQueryEvent.fetch(
            dateStart: _dateStart,
            dateEnd: _dateEnd,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<SalesTaxReportQueryBloc>();
    return BlocBuilder<SalesTaxReportQueryBloc, SalesTaxReportQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<SalesTaxReport>(
            onRefresh: () => queryBloc.add(
              SalesTaxReportQueryEvent.fetch(
                dateEnd: _dateEnd,
                dateStart: _dateStart,
              ),
            ),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              _fetch();
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionLeft: [
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
              SalesTaxReportExportExcelButton.prepare(
                dateTimeStart: _dateStart,
                dateTimeEnd: _dateEnd,
              ),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'tax_invoice_number'.tr(),
                  backendColumn: 'tax_invoice_number',
                ),
                body: (salesTaxReport) => DataCell(
                  Text(salesTaxReport.taxInvoiceNumber),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  label: 'transaction_no'.tr(),
                  backendColumn: 'transaction_no',
                ),
                body: (salesTaxReport) => DataCell(
                  Text(salesTaxReport.transactionNo.replaceFirst('No. Invoice: ', '')),
                ),
              ),
              DTColumn(
                widthFlex: 2,
                head: DTHead(
                  label: 'period'.tr(),
                  backendColumn: 'period',
                ),
                body: (salesTaxReport) => DataCell(
                  Text(salesTaxReport.period),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  label: 'customer_name'.tr(),
                  backendColumn: 'customer_name',
                ),
                body: (salesTaxReport) => DataCell(
                  Text(salesTaxReport.customerName),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  numeric: true,
                  label: 'subtotal_after_discount'.tr(),
                  backendColumn: 'subtotal_after_discount',
                ),
                body: (salesTaxReport) => DataCell(
                  Text(salesTaxReport.subTotalAfterDiscount.format()),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  numeric: true,
                  label: 'ppn_amount'.tr(),
                  backendColumn: 'ppn_value',
                ),
                body: (salesTaxReport) => DataCell(
                  Text(salesTaxReport.ppnValue.format()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
