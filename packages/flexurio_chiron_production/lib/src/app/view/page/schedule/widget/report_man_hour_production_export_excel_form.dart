import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/production_order.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_production/src/app/bloc/report_man_hour_production_query/report_man_hour_production_query_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ReportManHourProductionExportExcelForm extends StatefulWidget {
  const ReportManHourProductionExportExcelForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ReportManHourProductionQueryBloc(isExternal: false),
        ),
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(
              ProductQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => ProductionOrderQueryBloc(isExternal: false),
        ),
      ],
      child: const ReportManHourProductionExportExcelForm._(),
    );
  }

  @override
  State<ReportManHourProductionExportExcelForm> createState() =>
      _MaterialStockCardRupiahExportPdfFormState();
}

class _MaterialStockCardRupiahExportPdfFormState
    extends State<ReportManHourProductionExportExcelForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _period;
  String? _batchNo;
  Product? _product;
  final _periodController = TextEditingController();

  @override
  void initState() {
    _product = _product;
    _period = _period;
    _batchNo = _batchNo;
    super.initState();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ReportManHourProductionQueryBloc>().add(
            ReportManHourProductionQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(sortBy: 'period'),
              period: _period,
              batchNo: _batchNo,
              product: _product,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportExcel;

    return BlocListener<ReportManHourProductionQueryBloc,
        ReportManHourProductionQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final bytes = simpleExcel<ReportManHourProduction>(
              context: context,
              data: pageOptions.data,
              columns: [
                TColumn(
                  title: 'period'.tr(),
                  builder: (data, index) => data.period,
                ),
                TColumn(
                  title: 'product_name'.tr(),
                  builder: (data, index) => data.productName,
                ),
                TColumn(
                  title: 'batch_no'.tr(),
                  builder: (data, index) => data.batchNo,
                ),
                TColumn(
                  title: 'man_hour'.tr(),
                  builder: (data, index) => data.manHour.toString(),
                ),
                TColumn(
                  title: 'man_hour_weighing'.tr(),
                  builder: (data, index) => data.manHourWeight.toString(),
                ),
                TColumn(
                  title: 'man_hour_production'.tr(),
                  builder: (data, index) => data.manHourProduction.toString(),
                ),
                TColumn(
                  title: 'man_hour_packing'.tr(),
                  builder: (data, index) => data.manHourPacking.toString(),
                ),
                TColumn(
                  title: 'standart'.tr(),
                  builder: (data, index) => data.standart.toString(),
                ),
                TColumn(
                  title: 'achievement'.tr(),
                  builder: (data, index) => data.achievement.toString(),
                ),
              ],
            );
            saveFile(bytes, 'Report_Man_Hour_Production.xlsx');
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${'man_hour_production'.tr()}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<ReportManHourProductionQueryBloc,
              ReportManHourProductionQueryState>(
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
                  FieldMonthPicker(
                    isRequired: false,
                    labelText: 'period'.tr(),
                    controller: _periodController,
                    onChanged: (value) => _period = value,
                    maxDate: DateTime.now(),
                  ),
                ],
              ),
              const Gap(24),
              RowFields(
                children: [
                  FDropDownSearchProduct(
                    isRequired: false,
                    onChanged: (product) {
                      if (product != null) {
                        _product = product;
                        context.read<ProductionOrderQueryBloc>().add(
                              ProductionOrderQueryEvent.fetch(
                                product: product,
                                pageOptions: PageOptions.emptyNoLimit(),
                              ),
                            );
                        setState(() {});
                      }
                    },
                  ),
                ],
              ),
              const Gap(24),
              FDropDownSearchProductionOrder(
                isRequired: false,
                onChanged: (batch) {
                  if (batch != null) {
                    _batchNo = batch.id;
                    setState(() {});
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
