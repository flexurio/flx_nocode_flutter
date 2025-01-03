import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounts_receivable_payment/util/pdf_accounts_receivable_payment_value.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class RecapAccountsReceivablePaymentValueExportPdfButton
    extends StatefulWidget {
  const RecapAccountsReceivablePaymentValueExportPdfButton({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AccountsReceivablePaymentValueQueryBloc(),
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
      child: const RecapAccountsReceivablePaymentValueExportPdfButton(),
    );
  }

  @override
  State<RecapAccountsReceivablePaymentValueExportPdfButton> createState() =>
      _RecapAccountsReceivablePaymentValueExportPdfButtonState();
}

class _RecapAccountsReceivablePaymentValueExportPdfButtonState
    extends State<RecapAccountsReceivablePaymentValueExportPdfButton> {
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
    final queryBloc = context.read<AccountsReceivablePaymentValueQueryBloc>();
    final customerBloc = context.read<CustomerQueryBloc>();

    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'accounts_receivable_payment_value',
      permission:
          PermissionAccounting.recapAccountsReceivablePaymentValueExportPdf,
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
    AccountsReceivablePaymentValueQueryBloc queryBloc,
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
            BlocListener<AccountsReceivablePaymentValueQueryBloc,
                AccountsReceivablePaymentValueQueryState>(
              bloc: queryBloc,
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (error) => Toast(context).fail(error),
                  loaded: (accountsReceivablePaymentValue) async {
                    final pdf = pw.Document()
                      ..addPage(
                        await pdfAccountsReceivablePaymentValue(
                          data: accountsReceivablePaymentValue.data,
                        ),
                      );
                    await Printing.sharePdf(
                      bytes: await pdf.save(),
                      filename: 'Accounts_Receivable_Payment_Value.pdf',
                    );
                  },
                );
              },
              child: BlocBuilder<AccountsReceivablePaymentValueQueryBloc,
                  AccountsReceivablePaymentValueQueryState>(
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
                          AccountsReceivablePaymentValueQueryEvent.fetch(
                            customer: _customer,
                            startDate: _startDate,
                            endDate: _endDate,
                            pageOptions: PageOptions.emptyNoLimit(
                              sortBy: 'C.id, name, city_name, P.date',
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
