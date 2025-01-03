import 'package:appointment/src/app/util/picker_file.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExcelInvoiceReceive extends StatefulWidget {
  const ExcelInvoiceReceive({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => InvoiceReceiveQueryBloc(),
      child: const ExcelInvoiceReceive(),
    );
  }

  @override
  State<ExcelInvoiceReceive> createState() => _ExcelInvoiceReceiveState();
}

class _ExcelInvoiceReceiveState extends State<ExcelInvoiceReceive> {
  final _requiredObjectValidator = RequiredObjectValidator<dynamic>(
    errorText: pleaseFillOutThisField.tr(),
  );
  DateTime? _startDate;
  DateTime? _endDate;

  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  void _submit() {
    context.read<InvoiceReceiveQueryBloc>().add(
          InvoiceReceiveQueryEvent.fetch(
            createdAtStart: _startDate,
            createdAtEnd: _endDate,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportExcel;
    final entity = Entity.invoiceReceive;

    return BlocListener<InvoiceReceiveQueryBloc, InvoiceReceiveQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) {
            final bytes = simpleExcel<InvoiceReceive>(
              context: context,
              data: pageOptions.data,
              columns: [
                TColumn(
                  title: 'date_in'.tr(),
                  builder: (data, index) => data.createdAt.yMMMdHm,
                ),
                TColumn(
                  title: 'invoice_date'.tr(),
                  builder: (data, index) => data.invoiceDate.yMMMdHm,
                ),
                TColumn(
                  title: 'supplier'.tr(),
                  builder: (data, index) => data.supplier.name,
                ),
                TColumn(
                  title: 'no_invoice'.tr(),
                  builder: (data, index) => data.id,
                ),
                TColumn(
                  title: 'no_po'.tr(),
                  builder: (data, index) => data.purchaseOrder.id,
                ),
                TColumn(
                  title: 'values'.tr(),
                  builder: (data, index) => data.total.toString(),
                ),
                TColumn(
                  title: 'status'.tr(),
                  builder: (data, index) =>
                      data.receiveByFinanceAt != null ? 'CLOSE' : 'OPEN',
                ),
              ],
            );
            saveFile(
              bytes,
              'Report-Invoice-Receive-${_startDate?.yyyyMMdd}-${_endDate?.yyyyMMdd}.xlsx',
            );
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        title: 'Filter',
        icon: Icons.tune,
        actions: [
          Button(
            action: action,
            permission: null,
            onPressed: _submit,
          )
        ],
        popup: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FieldDatePicker(
              labelText: 'period_start'.tr(),
              controller: _startDateController,
              validator: _requiredObjectValidator.call,
              onChanged: (value) {
                _startDate = value;
              },
            ),
            const SizedBox(height: 12),
            FieldDatePicker(
              labelText: 'period_end'.tr(),
              controller: _endDateController,
              validator: _requiredObjectValidator.call,
              onChanged: (value) {
                _endDate = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
