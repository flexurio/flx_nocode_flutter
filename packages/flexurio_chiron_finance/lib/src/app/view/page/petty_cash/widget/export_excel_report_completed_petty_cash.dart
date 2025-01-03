import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/report_completed_petty_cash/report_completed_petty_cash_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_chiron_finance/src/app/model/report_completed_petty_cash.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportCompletedPettyCashExportExcelButton extends StatefulWidget {
  const ReportCompletedPettyCashExportExcelButton({super.key});

  static String permission = PermissionFinance.pettyCashCompletedExportExcel;

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ReportCompletedPettyCashQueryBloc(),
        ),
      ],
      child: const ReportCompletedPettyCashExportExcelButton(),
    );
  }

  @override
  State<ReportCompletedPettyCashExportExcelButton> createState() =>
      _ReportCompletedPettyCashExportExcelButtonState();
}

class _ReportCompletedPettyCashExportExcelButtonState
    extends State<ReportCompletedPettyCashExportExcelButton> {
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
    final queryBloc = context.read<ReportCompletedPettyCashQueryBloc>();
    final reportCompletedPettyCashBloc =
        context.read<ReportCompletedPettyCashQueryBloc>();

    return LightButtonSmall(
      action: DataAction.exportExcel,
      title: 'completed_petty_cash'.tr(),
      permission: ReportCompletedPettyCashExportExcelButton.permission,
      onPressed: () async {
        await _showPeriod(
          context,
          queryBloc,
          reportCompletedPettyCashBloc,
        );
      },
    );
  }

  Future<void> _showPeriod(
    BuildContext context,
    ReportCompletedPettyCashQueryBloc queryBloc,
    ReportCompletedPettyCashQueryBloc reportCompletedPettyCashBloc,
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
                return BlocListener<ReportCompletedPettyCashQueryBloc,
                    ReportCompletedPettyCashQueryState>(
                  bloc: queryBloc,
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      error: (error) => Toast(context).fail(error),
                      loaded: (materialRequest) {
                        final bytes = simpleExcel<ReportCompletedPettyCash>(
                          context: context,
                          data: materialRequest.data,
                          columns: [
                            TColumn(
                              title: 'Period',
                              builder: (data, index) => data.createdAt.yyyyMMdd,
                            ),
                            TColumn(
                              title: 'No Petty Cash',
                              builder: (data, index) => data.id,
                            ),
                            TColumn(
                              title: 'Date Petty Cash',
                              builder: (data, index) =>
                                  data.createdAt.ddMMyyyySlash,
                            ),
                            TColumn(
                              title: 'No Trans',
                              builder: (data, index) => data.realizationNo,
                            ),
                            TColumn(
                              title: 'Dept',
                              builder: (data, index) => data.departmentId ?? '',
                            ),
                            TColumn(
                              title: 'Amount',
                              builder: (data, index) => data.amount.toString(),
                            ),
                            TColumn(
                              title: 'Total',
                              builder: (data, index) => data.amount.toString(),
                            ),
                            TColumn(
                              title: 'PPN',
                              builder: (data, index) => data.ppn.toString(),
                            ),
                            TColumn(
                              title: 'PPH',
                              builder: (data, index) => data.pph.toString(),
                            ),
                            TColumn(
                              title: 'No Purchase Order',
                              builder: (data, index) => data.purchaseOrderId,
                            ),
                            TColumn(
                              title: 'Supplier',
                              builder: (data, index) => data.supplierId ?? '',
                            ),
                            TColumn(
                              title: 'Description',
                              builder: (data, index) => data.description,
                            ),
                            TColumn(
                              title: 'Status',
                              builder: (data, index) => data.status,
                            ),
                          ],
                        );
                        saveFile(bytes, 'report_completed_petty_cash.xlsx');
                      },
                    );
                  },
                  child: BlocBuilder<ReportCompletedPettyCashQueryBloc,
                      ReportCompletedPettyCashQueryState>(
                    bloc: queryBloc,
                    builder: (context, state) {
                      return Button(
                        action: DataAction.export,
                        permission: PermissionFinance.invoiceSummaryExportExcel,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            queryBloc.add(
                              ReportCompletedPettyCashQueryEvent.fetch(
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
