import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounts_receivable_payment/util/pdf_accounts_receivable_payment_global.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class RecapAccountsReceivablePaymentGlobalExportPdfButton
    extends StatefulWidget {
  const RecapAccountsReceivablePaymentGlobalExportPdfButton({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AccountsReceivablePaymentGlobalQueryBloc(),
        ),
        BlocProvider(
          create: (context) => CustomerQueryBloc()
            ..add(
              CustomerQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const RecapAccountsReceivablePaymentGlobalExportPdfButton(),
    );
  }

  @override
  State<RecapAccountsReceivablePaymentGlobalExportPdfButton> createState() =>
      _RecapAccountsReceivablePaymentGlobalExportPdfButtonState();
}

class _RecapAccountsReceivablePaymentGlobalExportPdfButtonState
    extends State<RecapAccountsReceivablePaymentGlobalExportPdfButton> {
  Customer? _customer;
  DateTime? _startDate;
  DateTime? _endDate;
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    _customer = _customer;
    _startDate = _startDate;
    _endDate = _endDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<AccountsReceivablePaymentGlobalQueryBloc>();
    final customerBloc = context.read<CustomerQueryBloc>();

    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'accounts_receivable_payment_global',
      permission:
          PermissionAccounting.recapAccountsReceivablePaymentGlobalExportPdf,
      onPressed: () async {
        await _showFilter(
          context,
          queryBloc,
          customerBloc,
        );
      },
    );
  }

  Future<void> _showFilter(
    BuildContext context,
    AccountsReceivablePaymentGlobalQueryBloc queryBloc,
    CustomerQueryBloc customerBloc,
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
            BlocListener<AccountsReceivablePaymentGlobalQueryBloc,
                AccountsReceivablePaymentGlobalQueryState>(
              bloc: queryBloc,
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (error) => Toast(context).fail(error),
                  loaded: (accountsReceivablePaymentGlobal) async {
                    final pdf = pw.Document()
                      ..addPage(
                        await pdfArPaymentGlobal(
                          data: accountsReceivablePaymentGlobal.data,
                        ),
                      );
                    await Printing.sharePdf(
                      bytes: await pdf.save(),
                      filename: 'Accounts_Receivable_Payment_Global.pdf',
                    );
                  },
                );
              },
              child: BlocBuilder<AccountsReceivablePaymentGlobalQueryBloc,
                  AccountsReceivablePaymentGlobalQueryState>(
                bloc: queryBloc,
                builder: (context, state) {
                  return Button.small(
                    action: DataAction.exportPdf,
                    permission: null,
                    onPressed: () {
                      if (_customer != null &&
                          _startDate != null &&
                          _endDate != null) {
                        queryBloc.add(
                          AccountsReceivablePaymentGlobalQueryEvent.fetch(
                            customer: _customer,
                            startDate: _startDate,
                            endDate: _endDate,
                            pageOptions: PageOptions.emptyNoLimit(
                              sortBy: 'kode,  name,  city_name',
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
              BlocBuilder<CustomerQueryBloc, CustomerQueryState>(
                bloc: customerBloc,
                builder: (context, state) {
                  return FDropDownSearch<Customer>(
                    labelText: 'customer'.tr(),
                    itemAsString: (customer) => customer.name,
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (customer) => customer.data,
                    ),
                    onChanged: (customer) {
                      if (customer != null) {
                        _customer = customer;
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
