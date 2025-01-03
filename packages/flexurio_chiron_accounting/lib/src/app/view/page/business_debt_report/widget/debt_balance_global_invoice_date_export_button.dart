import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/business_debt_report/util/pdf_debt_balance_global_invoice_date.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class DebtBalanceGlobalInvoiceDateExportPdfButton extends StatefulWidget {
  const DebtBalanceGlobalInvoiceDateExportPdfButton({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DebtBalanceGlobalInvoiceDateQueryBloc(),
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
      child: const DebtBalanceGlobalInvoiceDateExportPdfButton(),
    );
  }

  @override
  State<DebtBalanceGlobalInvoiceDateExportPdfButton> createState() =>
      _DebtBalanceGlobalInvoiceDateExportPdfButtonState();
}

class _DebtBalanceGlobalInvoiceDateExportPdfButtonState
    extends State<DebtBalanceGlobalInvoiceDateExportPdfButton> {
  DateTime? _transactionDate;

  final _transactionDateController = TextEditingController();

  @override
  void initState() {
    _transactionDate = _transactionDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<DebtBalanceGlobalInvoiceDateQueryBloc>();
    final supplierBloc = context.read<SupplierQueryBloc>();

    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'Global Invoice Date',
      permission: PermissionAccounting.debtBalanceGlobalInvoiceDateExportPdf,
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
    DebtBalanceGlobalInvoiceDateQueryBloc queryBloc,
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
            BlocListener<DebtBalanceGlobalInvoiceDateQueryBloc,
                DebtBalanceGlobalInvoiceDateQueryState>(
              bloc: queryBloc,
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (error) => Toast(context).fail(error),
                  loaded: (debtBalanceGlobalInvoiceDate) async {
                    final pdf = pw.Document()
                      ..addPage(
                        await pdfDebtBalanceGlobalInvoiceDate(
                          data: debtBalanceGlobalInvoiceDate.data,
                          isDueDate: false,
                        ),
                      );
                    await Printing.sharePdf(
                      bytes: await pdf.save(),
                      filename: 'Debt_Balance_Global_Invoice_Date.pdf',
                    );
                  },
                );
              },
              child: BlocBuilder<DebtBalanceGlobalInvoiceDateQueryBloc,
                  DebtBalanceGlobalInvoiceDateQueryState>(
                bloc: queryBloc,
                builder: (context, state) {
                  return Button.small(
                    action: DataAction.exportPdf,
                    permission: null,
                    onPressed: () {
                      if (_transactionDate != null) {
                        queryBloc.add(
                          DebtBalanceGlobalInvoiceDateQueryEvent.fetch(
                            transactionDate: _transactionDate,
                            pageOptions: PageOptions.emptyNoLimit(
                              sortBy: 'supplier_name',
                            ),
                          ),
                        );
                      } else {
                        Toast(context).fail(
                          'You must insert the Transaction Date',
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
              FieldDatePicker(
                labelText: 'transaction_date'.tr(),
                controller: _transactionDateController,
                onChanged: (value) => _transactionDate = value,
              ),
            ],
          ),
        );
      },
    );
  }
}
