import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/business_debt_report/util/pdf_debt_balance_detail_invoice_date.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class DebtBalanceDetailDueDateExportPdfButton extends StatefulWidget {
  const DebtBalanceDetailDueDateExportPdfButton({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DebtBalanceDetailInvoiceDateQueryBloc(),
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
      child: const DebtBalanceDetailDueDateExportPdfButton(),
    );
  }

  @override
  State<DebtBalanceDetailDueDateExportPdfButton> createState() =>
      _DebtBalanceDetailDueDateExportPdfButtonState();
}

class _DebtBalanceDetailDueDateExportPdfButtonState
    extends State<DebtBalanceDetailDueDateExportPdfButton> {
  Supplier? _supplier;
  DateTime? _dueDate;

  final _dueDateController = TextEditingController();

  @override
  void initState() {
    _supplier = _supplier;
    _dueDate = _dueDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<DebtBalanceDetailInvoiceDateQueryBloc>();
    final supplierBloc = context.read<SupplierQueryBloc>();

    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'Detail Due Date',
      permission: PermissionAccounting.debtBalanceDetailDueDateExportPdf,
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
    DebtBalanceDetailInvoiceDateQueryBloc queryBloc,
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
            BlocListener<DebtBalanceDetailInvoiceDateQueryBloc,
                DebtBalanceDetailInvoiceDateQueryState>(
              bloc: queryBloc,
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (error) => Toast(context).fail(error),
                  loaded: (debtBalanceDetailInvoiceDate) async {
                    final pdf = pw.Document()
                      ..addPage(
                        await pdfDebtBalanceDetailInvoiceDate(
                          data: debtBalanceDetailInvoiceDate.data,
                          isDueDate: true,
                        ),
                      );
                    await Printing.sharePdf(
                      bytes: await pdf.save(),
                      filename: 'Debt_Balance_Detail_Due_Date.pdf',
                    );
                  },
                );
              },
              child: BlocBuilder<DebtBalanceDetailInvoiceDateQueryBloc,
                  DebtBalanceDetailInvoiceDateQueryState>(
                bloc: queryBloc,
                builder: (context, state) {
                  return Button.small(
                    action: DataAction.exportPdf,
                    permission: null,
                    onPressed: () {
                      if (_supplier != null && _dueDate != null) {
                        queryBloc.add(
                          DebtBalanceDetailInvoiceDateQueryEvent.fetch(
                            supplier: _supplier,
                            dueDate: _dueDate,
                            pageOptions: PageOptions.emptyNoLimit(
                              sortBy: 'transaction_id',
                            ),
                          ),
                        );
                      } else {
                        Toast(context).fail(
                          'You must insert the Supplier & Due Date',
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
                    itemAsString: (supplier) => supplier.name,
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
                labelText: 'due_date'.tr(),
                controller: _dueDateController,
                onChanged: (value) => _dueDate = value,
              ),
            ],
          ),
        );
      },
    );
  }
}
