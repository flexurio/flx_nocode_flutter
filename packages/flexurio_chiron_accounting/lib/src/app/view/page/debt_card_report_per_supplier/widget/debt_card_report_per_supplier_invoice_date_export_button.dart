import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/debt_card_report_per_supplier/util/pdf_debt_card_report_per_supplier_invoice_date.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class DebtCardReportPerSupplierInvoiceDateExportPdfButton
    extends StatefulWidget {
  const DebtCardReportPerSupplierInvoiceDateExportPdfButton({
    super.key,
  });

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DebtCardReportPerSupplierInvoiceDateQueryBloc(),
        ),
        BlocProvider(
          create: (context) => SupplierQueryBloc()
            ..add(
              SupplierQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const DebtCardReportPerSupplierInvoiceDateExportPdfButton(),
    );
  }

  @override
  State<DebtCardReportPerSupplierInvoiceDateExportPdfButton> createState() =>
      _DebtCardReportPerSupplierInvoiceDateExportPdfButtonState();
}

class _DebtCardReportPerSupplierInvoiceDateExportPdfButtonState
    extends State<DebtCardReportPerSupplierInvoiceDateExportPdfButton> {
  DateTime? _startPeriod;
  DateTime? _endPeriod;
  Supplier? _supplier;

  final _startPeriodController = TextEditingController();
  final _endPeriodController = TextEditingController();

  @override
  void initState() {
    _startPeriod = _startPeriod;
    _endPeriod = _endPeriod;
    _supplier = _supplier;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc =
        context.read<DebtCardReportPerSupplierInvoiceDateQueryBloc>();
    final supplierBloc = context.read<SupplierQueryBloc>();

    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'Invoice Date',
      permission:
          PermissionAccounting.debtCardReportPerSupplierInvoiceDateExportPdf,
      onPressed: () async {
        await _showFilter(
          context,
          queryBloc,
          supplierBloc,
        );
      },
    );
  }

  Future<void> _showFilter(
    BuildContext context,
    DebtCardReportPerSupplierInvoiceDateQueryBloc queryBloc,
    SupplierQueryBloc supplierBloc,
  ) async {
    await showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CardForm(
          popup: true,
          title: 'filter'.tr(),
          icon: Icons.sort,
          actions: [
            Button(
              action: DataAction.cancel,
              permission: null,
              isSecondary: true,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(width: 12),
            BlocListener<DebtCardReportPerSupplierInvoiceDateQueryBloc,
                DebtCardReportPerSupplierInvoiceDateQueryState>(
              bloc: queryBloc,
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (error) => Toast(context).fail(error),
                  loaded: (debtCardReportPerSupplierInvoiceDate) async {
                    final pdf = pw.Document()
                      ..addPage(
                        await pdfDebtCardReportPerSupplierInvoiceDate(
                          data: debtCardReportPerSupplierInvoiceDate.data,
                        ),
                      );
                    await Printing.sharePdf(
                      bytes: await pdf.save(),
                      filename:
                          'Debt_Card_Report_Per_Supplier_Invoice_Date.pdf',
                    );
                  },
                );
              },
              child: BlocBuilder<DebtCardReportPerSupplierInvoiceDateQueryBloc,
                  DebtCardReportPerSupplierInvoiceDateQueryState>(
                bloc: queryBloc,
                builder: (context, state) {
                  return Button.small(
                    action: DataAction.exportPdf,
                    permission: null,
                    onPressed: () {
                      if (_supplier != null &&
                          _startPeriod != null &&
                          _endPeriod != null) {
                        queryBloc.add(
                          DebtCardReportPerSupplierInvoiceDateQueryEvent.fetch(
                            transactionDateGte: _startPeriod,
                            transactionDateLte: _endPeriod,
                            supplier: _supplier,
                            pageOptions: PageOptions.emptyNoLimit(
                              sortBy: 'transaction_date',
                            ),
                          ),
                        );
                      } else {
                        Toast(context).fail(
                          'You must insert the Supplier & (Start End) Date',
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<SupplierQueryBloc, SupplierQueryState>(
                bloc: supplierBloc,
                builder: (context, state) {
                  return FDropDownSearch<Supplier>(
                    labelText: 'supplier'.tr(),
                    // "id": "S207",
                    // "name": "supplier207",
                    itemAsString: (supplier) {
                      return '${supplier.id} - ${supplier.name}';
                    },
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (supplier) => supplier.data,
                    ),
                    onChanged: (supplier) {
                      if (supplier != null) {
                        _supplier = supplier;
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 12),
              FieldDatePicker(
                labelText: 'start_date'.tr(),
                controller: _startPeriodController,
                onChanged: (value) => _startPeriod = value,
              ),
              const SizedBox(height: 12),
              FieldDatePicker(
                labelText: 'end_date'.tr(),
                controller: _endPeriodController,
                onChanged: (value) => _endPeriod = value,
              ),
            ],
          ),
        );
      },
    );
  }
}
