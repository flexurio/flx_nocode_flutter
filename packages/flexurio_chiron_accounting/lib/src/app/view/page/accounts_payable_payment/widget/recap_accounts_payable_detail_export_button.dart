import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class RecapAccountsPayablePaymentDetailExportPdfButton extends StatefulWidget {
  const RecapAccountsPayablePaymentDetailExportPdfButton({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AccountsPayablePaymentDetailQueryBloc(),
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
      child: const RecapAccountsPayablePaymentDetailExportPdfButton(),
    );
  }

  @override
  State<RecapAccountsPayablePaymentDetailExportPdfButton> createState() => _RecapAccountsPayablePaymentDetailExportPdfButtonState();
}

class _RecapAccountsPayablePaymentDetailExportPdfButtonState extends State<RecapAccountsPayablePaymentDetailExportPdfButton> {
  Supplier? _supplier;
  DateTime? _startDate;
  DateTime? _endDate;
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    _supplier = _supplier;
    _startDate = _startDate;
    _endDate = _endDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<AccountsPayablePaymentDetailQueryBloc>();
    final supplierBloc = context.read<SupplierQueryBloc>();
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'recap_accounts_payable_payment_detail'.tr(),
      permission: PermissionAccounting.recapAccountsPayablePaymentDetailExportPdf,
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
    AccountsPayablePaymentDetailQueryBloc queryBloc,
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
            BlocListener<AccountsPayablePaymentDetailQueryBloc, AccountsPayablePaymentDetailQueryState>(
              bloc: queryBloc,
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (error) => Toast(context).fail(error),
                  loaded: (accountsPayablePaymentDetail) async {
                    final pdf = pw.Document()
                      ..addPage(
                        await pdfAccountsPayablePaymentDetail(
                          data: accountsPayablePaymentDetail.data,
                        ),
                      );
                    await Printing.sharePdf(
                      bytes: await pdf.save(),
                      filename: 'Accounts_Payable_Payment_Detail.pdf',
                    );
                  },
                );
              },
              child: BlocBuilder<AccountsPayablePaymentDetailQueryBloc, AccountsPayablePaymentDetailQueryState>(
                bloc: queryBloc,
                builder: (context, state) {
                  return Button.small(
                    action: DataAction.exportPdf,
                    permission: null,
                    onPressed: () {
                      if (_supplier != null &&
                          _startDate != null &&
                          _endDate != null) {
                        queryBloc.add(
                          AccountsPayablePaymentDetailQueryEvent.fetch(
                            supplier: _supplier,
                            startDate: _startDate,
                            endDate: _endDate,
                            pageOptions: PageOptions.emptyNoLimit(
                              sortBy: 'transaction_date',
                            ),
                          ),
                        );
                      } else {
                        Toast(context).fail(
                          'You must insert the Customer & Date',
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
                labelText: 'Period Start',
                controller: _startDateController,
                onChanged: (value) => _startDate = value,
              ),
              const SizedBox(height: 12),
              FieldDatePicker(
                labelText: 'Period End',
                controller: _endDateController,
                onChanged: (value) => _endDate = value,
              ),
            ],
          ),
        );
      },
    );
  }
}
