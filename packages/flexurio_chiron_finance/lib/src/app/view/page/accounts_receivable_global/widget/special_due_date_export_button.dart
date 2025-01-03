import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_type_query/transaction_type_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/accounts_receivable_detail_query/accounts_receivable_detail_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/accounts_receivable_global/util/pdf_due_date.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class SpecialDueDateExportPdfButton extends StatefulWidget {
  const SpecialDueDateExportPdfButton({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AccountsReceivableDetailQueryBloc(),
        ),
        BlocProvider(
          create: (context) => TransactionTypeQueryBloc()
            ..add(
              const TransactionTypeQueryEvent.fetch(),
            ),
        ),
        BlocProvider(
          create: (context) => CustomerQueryBloc()
            ..add(
              const CustomerQueryEvent.fetch(),
            ),
        ),
      ],
      child: const SpecialDueDateExportPdfButton(),
    );
  }

  @override
  State<SpecialDueDateExportPdfButton> createState() =>
      _SpecialDueDateExportPdfButtonState();
}

class _SpecialDueDateExportPdfButtonState
    extends State<SpecialDueDateExportPdfButton> {
  TransactionType? _transactionType;
  Customer? _customer;
  DateTime? _dueDate;
  final _dueDateController = TextEditingController();

  @override
  void initState() {
    _transactionType = _transactionType;
    _customer = _customer;
    _dueDate = _dueDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<AccountsReceivableDetailQueryBloc>();
    final transactionTypeQueryBloc = context.read<TransactionTypeQueryBloc>();
    final customerQueryBloc = context.read<CustomerQueryBloc>();

    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'special_due_date'.tr(),
      permission: null,
      onPressed: () async {
        await _showPeriod(
            context, queryBloc, transactionTypeQueryBloc, customerQueryBloc);
      },
    );
  }

  Future<void> _showPeriod(
    BuildContext context,
    AccountsReceivableDetailQueryBloc queryBloc,
    TransactionTypeQueryBloc transactionTypeBloc,
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
            BlocListener<AccountsReceivableDetailQueryBloc,
                AccountsReceivableDetailQueryState>(
              bloc: queryBloc,
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (error) => Toast(context).fail(error),
                  loaded: (accountsReceivableDetail) async {
                    final pdf = pw.Document()
                      ..addPage(
                        await pdfDueDate(
                          data: accountsReceivableDetail.data,
                        ),
                      );
                    await Printing.sharePdf(
                      bytes: await pdf.save(),
                      filename:
                          'LPU - LAPORAN SALDO PIUTANG GLOBAL by TGL JATUH TEMPO KHUSUS.pdf',
                    );
                  },
                );
              },
              child: BlocBuilder<AccountsReceivableDetailQueryBloc,
                  AccountsReceivableDetailQueryState>(
                bloc: queryBloc,
                builder: (context, state) {
                  return Button.small(
                    action: DataAction.exportPdf,
                    permission: null,
                    onPressed: () {
                      if (_transactionType != null &&
                          _customer != null &&
                          _dueDate != null) {
                        queryBloc.add(
                          AccountsReceivableDetailQueryEvent.fetch(
                            pageOptions: PageOptions.empty(),
                            transactionType: _transactionType,
                            customer: _customer,
                            dueDate: _dueDate,
                            transactionDate: null,
                          ),
                        );
                      } else {
                        Toast(context)
                            .fail('You must insert the Type, Customer & Date');
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
              BlocBuilder<TransactionTypeQueryBloc, TransactionTypeQueryState>(
                bloc: transactionTypeBloc,
                builder: (context, state) {
                  return FDropDownSearch<TransactionType>(
                    labelText: 'transaction_type'.tr(),
                    itemAsString: (transactionType) => transactionType.name,
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (pageOptions) => pageOptions.data,
                    ),
                    status: state.maybeWhen(
                      orElse: () => Status.error,
                      loading: (_) => Status.progress,
                      loaded: (_) => Status.loaded,
                    ),
                    onChanged: (transactionType) async {
                      if (transactionType != null) {
                        _transactionType = transactionType;
                      }
                    },
                  );
                },
              ),
              BlocBuilder<CustomerQueryBloc, CustomerQueryState>(
                bloc: customerBloc,
                builder: (context, state) {
                  return FDropDownSearch<Customer>(
                    labelText: 'customer'.tr(),
                    itemAsString: (customer) => customer.name,
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (pageOptions) => pageOptions.data,
                    ),
                    status: state.maybeWhen(
                      orElse: () => Status.error,
                      loading: (_) => Status.progress,
                      loaded: (_) => Status.loaded,
                    ),
                    onChanged: (customer) async {
                      if (customer != null) {
                        _customer = customer;
                      }
                    },
                  );
                },
              ),
              FieldDatePicker(
                labelText: 'due_date'.tr(),
                controller: _dueDateController,
                onChanged: (value) {
                  _dueDate = value;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
