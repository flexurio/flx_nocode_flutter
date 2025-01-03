import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/report_sales_credit_note/report_sales_credit_note_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_chiron_finance/src/app/model/report_sales_credit_note.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportSalesCreditNoteExportExcelButton extends StatefulWidget {
  const ReportSalesCreditNoteExportExcelButton({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ReportSalesCreditNoteQueryBloc(),
        ),
      ],
      child: const ReportSalesCreditNoteExportExcelButton(),
    );
  }

  @override
  State<ReportSalesCreditNoteExportExcelButton> createState() =>
      _ReportSalesCreditNoteExportExcelButtonState();
}

class _ReportSalesCreditNoteExportExcelButtonState
    extends State<ReportSalesCreditNoteExportExcelButton> {
  final _requiredObjectValidator = RequiredObjectValidator<dynamic>(
    errorText: pleaseFillOutThisField.tr(),
  );
  DateTime? _startDate;
  DateTime? _endDate;

  final _formKey = GlobalKey<FormState>();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    _startDateController.text = _startDate?.yyyyMMdd ?? '';
    _endDateController.text = _endDate?.yyyyMMdd ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<ReportSalesCreditNoteQueryBloc>();
    final ReportSalesCreditNoteBloc =
        context.read<ReportSalesCreditNoteQueryBloc>();

    return LightButtonSmall(
      action: DataAction.exportExcel,
      title: 'sales_credit_note'.tr(),
      permission: null,
      onPressed: () async {
        await _showPeriod(
          context,
          queryBloc,
          ReportSalesCreditNoteBloc,
        );
      },
    );
  }

  Future<void> _showPeriod(
    BuildContext context,
    ReportSalesCreditNoteQueryBloc queryBloc,
    ReportSalesCreditNoteQueryBloc ReportSalesCreditNoteBloc,
  ) async {
    await showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CardForm(
          popup: true,
          title: 'export_excel'.tr(),
          icon: FontAwesomeIcons.fileExcel,
          actions: [
            Button(
              action: DataAction.cancel,
              permission: null,
              isSecondary: true,
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(width: 12),
            UsersBuilder(
              builder: (users) {
                return BlocListener<ReportSalesCreditNoteQueryBloc,
                    ReportSalesCreditNoteQueryState>(
                  bloc: queryBloc,
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      error: (error) => Toast(context).fail(error),
                      loaded: (materialRequest) {
                        final bytes = simpleExcel<ReportSalesCreditNote>(
                          context: context,
                          data: materialRequest.data,
                          columns: [
                            TColumn(
                              title: 'Transaction No',
                              builder: (data, index) => data.transactionNo,
                            ),
                            TColumn(
                              title: 'Date',
                              builder: (data, index) => data.date.yyyyMMdd,
                            ),
                            TColumn(
                              title: 'No Ref',
                              builder: (data, index) {
                                return data.purchaseOrderId;
                              },
                            ),
                            TColumn(
                              title: 'Amount',
                              builder: (data, index) =>
                                  data.subTotal.toString(),
                            ),
                            TColumn(
                              title: 'Discount',
                              builder: (data, index) =>
                                  data.discountValue.toString(),
                            ),
                            TColumn(
                              title: 'PPN',
                              builder: (data, index) =>
                                  data.ppnValue.toString(),
                            ),
                            TColumn(
                              title: 'Total',
                              builder: (data, index) => data.total.toString(),
                            ),
                          ],
                        );
                        saveFile(bytes, 'recap_material_price_supplier.xlsx');
                      },
                    );
                  },
                  child: BlocBuilder<ReportSalesCreditNoteQueryBloc,
                      ReportSalesCreditNoteQueryState>(
                    bloc: queryBloc,
                    builder: (context, state) {
                      return Button(
                        action: DataAction.export,
                        permission: PermissionFinance.invoiceSummaryExportExcel,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            queryBloc.add(
                              ReportSalesCreditNoteQueryEvent.fetch(
                                pageOptions: PageOptions.emptyNoLimit(),
                                dateStart: _startDate,
                                dateEnd: _endDate,
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
          child: Form(
            key: _formKey,
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
      },
    );
  }
}
