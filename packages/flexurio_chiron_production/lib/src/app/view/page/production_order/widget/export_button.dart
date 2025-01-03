import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_query/bloc/product_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_order_query/production_order_query_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/production_order.dart';
import 'package:flexurio_chiron_production/src/app/view/page/production_order/util/pdf_production_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ProductionOrderBatchExportButton extends StatefulWidget {
  const ProductionOrderBatchExportButton({super.key});

  static Widget prepare({
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductionOrderQueryBloc(isExternal: isExternal),
        ),
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: isExternal)
            ..add(
              ProductQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const ProductionOrderBatchExportButton(),
    );
  }

  @override
  State<ProductionOrderBatchExportButton> createState() =>
      _ProductionOrderBatchExportButtonState();
}

class _ProductionOrderBatchExportButtonState
    extends State<ProductionOrderBatchExportButton> {
  DateTime? _startDate;
  DateTime? _endDate;
  Product? _product;

  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _exportDocumentTypeController = TextEditingController();

  final _listExportDocument = ['PDF', 'Excel'];
  String _exportDocumentType = 'PDF';

  @override
  void initState() {
    _startDateController.text = _startDate?.yyyyMMdd ?? '';
    _endDateController.text = _endDate?.yyyyMMdd ?? '';
    _exportDocumentTypeController.text = 'PDF';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<ProductionOrderQueryBloc>();
    final productBloc = context.read<ProductQueryBloc>();

    return LightButtonSmall(
      action: DataAction.export,
      title: 'Master Batch',
      permission: null,
      onPressed: () async {
        await _showPeriod(context, queryBloc, productBloc);
      },
    );
  }

  Future<void> _showPeriod(
    BuildContext context,
    ProductionOrderQueryBloc queryBloc,
    ProductQueryBloc productBloc,
  ) async {
    await showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CardForm(
          popup: true,
          title: 'Select Period',
          icon: Icons.calendar_month_rounded,
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
            BlocListener<ProductionOrderQueryBloc, ProductionOrderQueryState>(
              bloc: queryBloc,
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (error) => Toast(context).fail(error),
                  loaded: (productionOrder) async {
                    if (_exportDocumentType == 'Excel') {
                      final bytes = simpleExcel<ProductionOrder>(
                        context: context,
                        data: productionOrder.data,
                        columns: [
                          TColumn(
                            title: 'period'.tr(),
                            builder: (data, index) =>
                                DateFormat('yyyyMM').format(
                              data.createdAt,
                            ),
                          ),
                          TColumn(
                            title: 'product_code'.tr(),
                            builder: (data, index) => data.product.id,
                          ),
                          TColumn(
                            title: 'product_name'.tr(),
                            builder: (data, index) => data.product.name,
                          ),
                          TColumn(
                            title: 'batch'.tr(),
                            builder: (data, index) => data.id,
                          ),
                          TColumn(
                            title: 'batch_size'.tr(),
                            builder: (data, index) => data.batchSize.toString(),
                          ),
                          TColumn(
                            title: 'division'.tr(),
                            builder: (data, index) => 'PT. Metiska Farma',
                          ),
                          TColumn(
                            title: 'scale'.tr(),
                            builder: (data, index) => data.scale.id,
                          ),
                        ],
                      );
                      saveFile(bytes, 'master_batch_period.xlsx');
                    }
                    if (_exportDocumentType == 'PDF') {
                      final pdf = pw.Document()
                        ..addPage(
                          await pdfProductionOrderBatch(
                            startDate: _startDate ?? DateTime.now(),
                            endDate: _endDate ?? DateTime.now(),
                            data: productionOrder.data,
                            primaryColor: Theme.of(context).colorScheme.primary,
                          ),
                        );
                      await Printing.sharePdf(
                        bytes: await pdf.save(),
                        filename: 'master_batch_period.pdf',
                      );
                    }
                  },
                );
              },
              child: BlocBuilder<ProductionOrderQueryBloc,
                  ProductionOrderQueryState>(
                bloc: queryBloc,
                builder: (context, state) {
                  return Button.small(
                    action: DataAction.exportDocument,
                    permission: null,
                    onPressed: () {
                      if (_startDate != null && _endDate != null) {
                        queryBloc.add(
                          ProductionOrderQueryEvent.fetch(
                            product: _product,
                            periodStart: _startDate,
                            periodEnd: _endDate,
                            pageOptions: PageOptions.emptyNoLimit(),
                          ),
                        );
                      } else {
                        Toast(context).fail('You must insert the Date');
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
              BlocBuilder<ProductQueryBloc, ProductQueryState>(
                bloc: productBloc,
                builder: (context, state) {
                  return FDropDownSearch<Product>(
                    labelText: 'product'.tr(),
                    itemAsString: (product) => product.name,
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (pageOptions) => pageOptions.data,
                    ),
                    status: state.maybeWhen(
                      orElse: () => Status.error,
                      loading: (_) => Status.progress,
                      loaded: (_) => Status.loaded,
                    ),
                    onChanged: (product) async {
                      if (product != null) {
                        _product = product;
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 12),
              FieldDatePicker(
                labelText: 'Period Start',
                controller: _startDateController,
                onChanged: (value) {
                  _startDate = value;
                },
              ),
              const SizedBox(height: 12),
              FieldDatePicker(
                labelText: 'Period End',
                controller: _endDateController,
                onChanged: (value) {
                  _endDate = value;
                },
              ),
              const SizedBox(height: 12),
              SelectChipField<String>(
                label: 'Select Document',
                getLabel: (type) => type,
                controller: _exportDocumentTypeController,
                options: _listExportDocument,
                validator: requiredValidator.call,
                onChanged: (value) {
                  setState(() {
                    _exportDocumentType = value;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
