import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_data_report_query/production_data_report_query_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/production_data_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductionDataReportExportExcelForm extends StatefulWidget {
  const ProductionDataReportExportExcelForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductionDataReportQueryBloc(),
        ),
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(
              ProductQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const ProductionDataReportExportExcelForm._(),
    );
  }

  @override
  State<ProductionDataReportExportExcelForm> createState() => _MaterialStockCardRupiahExportPdfFormState();
}

class _MaterialStockCardRupiahExportPdfFormState extends State<ProductionDataReportExportExcelForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _startDate;
  DateTime? _endDate;
  Product ? _product;
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    _product = _product;
    _startDate = _startDate;
    _endDate = _endDate;
    super.initState();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ProductionDataReportQueryBloc>().add(
        ProductionDataReportQueryEvent.fetch(
          pageOptions: PageOptions.emptyNoLimit(sortBy: 'actual_start_time'),
          periodStart: _startDate!,
          periodEnd: _endDate!,
          product: _product!,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportExcel;

    return BlocListener<ProductionDataReportQueryBloc, ProductionDataReportQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final bytes = simpleExcel<ProductionDataReport>(
              context: context,
              data: pageOptions.data,
              columns: [
                TColumn(
                  title: 'product_name'.tr(),
                  builder: (data, index) => data.productName,
                ),
                TColumn(
                  title: 'batch_no'.tr(),
                  builder: (data, index) => data.productionOrder,
                ),
                TColumn(
                  title: 'date'.tr(),
                  builder: (data, index) {
                    return data.actualStartTime.ddMMyyyy;
                  },
                ),
                TColumn(
                  title: 'stage_name'.tr(),
                  builder: (data, index) => data.productionStageName,
                ),
                TColumn(
                  title: 'pic_name'.tr(),
                  builder: (data, index) => data.machine,
                ),
                TColumn(
                  title: 'machine_name'.tr(),
                  builder: (data, index) => data.machineName,
                ),
                TColumn(
                  title: 'sub_stage_name'.tr(),
                  builder: (data, index) => data.subStageName,
                ),
                TColumn(
                  title: 'status'.tr(),
                  builder: (data, index) => data.status,
                ),
                TColumn(
                  title: 'yield'.tr(),
                  builder: (data, index) => data.yield.toString(),
                ),
                TColumn(
                  title: 'period'.tr(),
                  builder: (data, index) {
                    return data.actualStartTime.ddMMyyyy;
                  },
                ),
              ],
            );
            saveFile(bytes, 'production_data_reports.xlsx');
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${'production_data_report'.tr()}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<ProductionDataReportQueryBloc, ProductionDataReportQueryState>(
            builder: (context, state) {
              return Button(
                permission: null,
                isInProgress: state.maybeWhen(
                  orElse: () => false,
                  loading: (_) => true,
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
              const Gap(24),
              RowFields(
                children: [
                  FDropDownSearchProduct(
                    onChanged: (product) {
                      if (product != null) {
                        _product = product;
                        setState(() {});
                      }
                    },
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
