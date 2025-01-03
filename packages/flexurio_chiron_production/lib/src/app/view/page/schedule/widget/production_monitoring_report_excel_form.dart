import 'package:appointment/src/app/util/picker_file.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_monitoring_query/production_monitoring_query_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/production_monitoring.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductionMonitoringReportExportExcelForm extends StatefulWidget {
  const ProductionMonitoringReportExportExcelForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductionMonitoringQueryBloc(),
        ),
      ],
      child: const ProductionMonitoringReportExportExcelForm._(),
    );
  }

  @override
  State<ProductionMonitoringReportExportExcelForm> createState() =>
      _MaterialStockCardRupiahExportPdfFormState();
}

class _MaterialStockCardRupiahExportPdfFormState
    extends State<ProductionMonitoringReportExportExcelForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _startDate;
  DateTime? _endDate;
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    _startDate = _startDate;
    _endDate = _endDate;
    super.initState();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ProductionMonitoringQueryBloc>().add(
            ProductionMonitoringQueryEvent.fetch(
              startDate: _startDate!,
              endDate: _endDate!,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportExcel;

    return BlocListener<ProductionMonitoringQueryBloc,
        ProductionMonitoringQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (data) async {
            final bytes = simpleExcel<ProductionMonitoring>(
              context: context,
              data: data,
              columns: [
                TColumn(
                  title: 'batch_no'.tr(),
                  builder: (data, index) => data.batchNo,
                ),
                TColumn(
                  title: 'stage_name'.tr(),
                  builder: (data, index) =>
                      data.productionStageName,
                ),
                TColumn(
                  title: 'sub_stage_name'.tr(),
                  builder: (data, index) => data.productionSubStageName,
                ),
                TColumn(
                  title: 'machine_name'.tr(),
                  builder: (data, index) => data.machineName,
                ),
                TColumn(
                  title: 'start_date'.tr(),
                  builder: (data, index) => data.startTime.ddMMyyyy,
                ),
                TColumn(
                  title: 'end_date'.tr(),
                  builder: (data, index) => data.endTime.ddMMyyyy,
                ),
                TColumn(
                  title: 'status'.tr(),
                  builder: (data, index) => data.status,
                ),
                TColumn(
                  title: 'quarantine_date'.tr(),
                  builder: (data, index) => data.quarantineDate != null
                      ? data.quarantineDate!.ddMMyyyy
                      : '',
                ),
                TColumn(
                  title: 'release_date'.tr(),
                  builder: (data, index) => data.releaseDate != null
                      ? data.releaseDate!.ddMMyyyy
                      : '',
                ),
                TColumn(
                  title: 'expired_date'.tr(),
                  builder: (data, index) => data.expiredDate != null
                      ? data.expiredDate!.ddMMyyyy
                      : '',
                ),
                TColumn(
                  title: 'description'.tr(),
                  builder: (data, index) => data.description,
                ),
                TColumn(
                  title: 'sort'.tr(),
                  builder: (data, index) => data.ordinal,
                ),
              ],
            );
            saveFile(bytes, 'production_monitoring_reports.xlsx');
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${'production_monitoring_report'.tr()}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<ProductionMonitoringQueryBloc,
              ProductionMonitoringQueryState>(
            builder: (context, state) {
              return Button(
                permission: null,
                isInProgress: state.maybeWhen(
                  orElse: () => false,
                  loading: () => true,
                ),
                onPressed: () => _submit(context),
                action: action,
              );
            },
          ),
        ],
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowFields(
                children: [
                  FieldDatePicker(
                    validator: requiredObjectValidator.call,
                    labelText: 'start_date'.tr(),
                    controller: _startDateController,
                    onChanged: (value) => _startDate = value,
                  ),
                  FieldDatePicker(
                    labelText: 'end_date'.tr(),
                    validator: requiredObjectValidator.call,
                    controller: _endDateController,
                    onChanged: (value) => _endDate = value,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
