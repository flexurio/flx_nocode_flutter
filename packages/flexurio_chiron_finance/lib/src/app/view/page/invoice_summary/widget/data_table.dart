import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormA1DataTable extends StatefulWidget {
  const FormA1DataTable({super.key});

  @override
  State<FormA1DataTable> createState() => _FormA1DataTableState();
}

class _FormA1DataTableState extends State<FormA1DataTable> {
  DateTime? _periodStartFormA1;
  DateTime? _periodEndFormA1;
  String? _divisiFormA1;
  String? _type;
  final format = NumberFormat('#,##0.00', 'en_US');

  @override
  void initState() {
    super.initState();
    _type = 'Form A1';
    _fetchDataFormA1(context, PageOptions.empty(sortBy: 'date, C.name'));
  }

  void _fetchDataFormA1(
    BuildContext context,
    PageOptions<FormA1>? pageOptions,
  ) {
    context.read<FormA1QueryBloc>().add(
          FormA1QueryEvent.fetch(
            pageOptions: pageOptions,
            periodStart: _periodStartFormA1,
            periodEnd: _periodEndFormA1,
            divisi: _divisiFormA1,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormA1QueryBloc, FormA1QueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<FormA1>(
            pagination: false,
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () => _fetchDataFormA1(context, null),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              _fetchDataFormA1(context, pageOptions);
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: () => PageOptions.empty(sortBy: 'date, C.name'),
            ),
            actionLeft: [
              _buildDropDownType(context),
            ],
            actionRight: (refreshButton) => [
              LightButtonSmallGroup(
                action: DataAction.exportExcel,
                children: {
                  PermissionFinance.invoiceSummaryExportExcel:
                      ReportSalesCreditNoteExportExcelButton.prepare(),
                  PermissionFinance.deliveryNoteInvoiceExportExcel:
                      DeliveryNoteInvoiceExportExcelButton.prepare(),
                },
              ),
              FormA1ExportPdfButton.prepare(),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'Tgl FAKTUR',
                  backendColumn: 'tgl_faktur',
                ),
                body: (formA1) {
                  return DataCell(
                    Text(
                      DateFormat('yyyy-MM-dd').format(formA1.date),
                    ),
                  );
                },
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'PBF',
                  backendColumn: 'customer',
                ),
                body: (formA1) {
                  return DataCell(Text(formA1.customer));
                },
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'NPWP PBF',
                  backendColumn: 'NPWP_PBF',
                ),
                body: (formA1) {
                  return DataCell(Text(formA1.npwp));
                },
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'Seri Pjk',
                  backendColumn: 'Seri Pjk',
                ),
                body: (formA1) {
                  return DataCell(Text(formA1.taxInvoiceNo));
                },
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'DPP',
                  backendColumn: 'DPP',
                ),
                body: (formA1) {
                  return DataCell(
                    Text(
                      formA1.subAfterTax == 0
                          ? '0'
                          : format.format(formA1.subAfterTax),
                    ),
                  );
                },
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'PPn',
                  backendColumn: 'PPn',
                ),
                body: (formA1) {
                  return DataCell(
                    Text(
                      formA1.ppnValue == 0
                          ? '0'
                          : format.format(formA1.ppnValue),
                    ),
                  );
                },
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'pph22Value',
                  backendColumn: 'pph22Value',
                ),
                body: (formA1) {
                  return DataCell(
                    Text(
                      formA1.pph22Value == 0
                          ? '0'
                          : format.format(formA1.pph22Value),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDropDownType(BuildContext context) {
    return DropDownSmall<String>(
      icon: Icons.list,
      initialValue: 'Form A1',
      labelText: 'type'.tr(),
      itemAsString: (type) => type,
      items: const ['Form A1'],
      onChanged: (type) {
        if (type == null) return;
        _type = type;
        _fetchDataFormA1(context, PageOptions.empty(sortBy: 'date, C.name'));
      },
    );
  }
}
