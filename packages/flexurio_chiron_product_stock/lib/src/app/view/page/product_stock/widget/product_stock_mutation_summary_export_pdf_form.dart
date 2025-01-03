import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_stock_mutation_summary_query/product_stock_mutation_summary_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_stock/util/pdf_product_stock_card_mutation_summary.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/recap_product_expenditure.dart';

class ProductStockMutationSummaryExportPdfForm extends StatefulWidget {
  const ProductStockMutationSummaryExportPdfForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductStockMutationSummaryQueryBloc(),
        ),
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(
              ProductQueryEvent.fetch(pageOptions: PageOptions.emptyNoLimit()),
            ),
        ),
      ],
      child: const ProductStockMutationSummaryExportPdfForm._(),
    );
  }

  @override
  State<ProductStockMutationSummaryExportPdfForm> createState() =>
      _ProductStockMutationSummaryExportPdfFormState();
}

class _ProductStockMutationSummaryExportPdfFormState
    extends State<ProductStockMutationSummaryExportPdfForm> {
  final _formKey = GlobalKey<FormState>();
  Product? _product;
  DateTime? _period;
  Division? _division;
  List<Warehouse>? _warehouse;

  final _periodController = TextEditingController();
  final _divisionController = TextEditingController();
  final _requiredObjectValidator = RequiredObjectValidator<dynamic>(
    errorText: pleaseFillOutThisField,
  );

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ProductStockMutationSummaryQueryBloc>().add(
            ProductStockMutationSummaryQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(sortBy: 'product_id'),
              product: _product,
              period: _period,
              division: _division,
              warehouse: _warehouse,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;
    final entity = Entity.productReturn;

    return BlocListener<ProductStockMutationSummaryQueryBloc,
        ProductStockMutationSummaryQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () => Toast(context).fail(''),
          error: (error) => Toast(context).fail(error),
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfProductStockCardMutationSummary(
                  data: pageOptions.data,
                  startDate: _period,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Report_Mutasi_Product_Per_Product.pdf',
            );
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${entity.title}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<ProductStockMutationSummaryQueryBloc,
              ProductStockMutationSummaryQueryState>(
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
              RowFields(children: [
                FDropDownSearchProduct(
                  onChanged: (product) {
                    if (product != null) {
                      _product = product;
                    }
                  },
                ),
                FieldDatePicker(
                  validator: requiredObjectValidator.call,
                  labelText: 'start_date'.tr(),
                  onChanged: (value) {
                    _period = value;
                  },
                  initialSelectedDate: _period,
                  controller: _periodController,
                ),
              ]),
              Gap(12),
              RowFields(
                children: [
                  SelectChipField<Division>(
                    label: 'division'.tr(),
                    getLabel: (ppn) => ppn.label,
                    controller: _divisionController,
                    validator: requiredValidator.call,
                    options: Division.list,
                    onChanged: (value) {
                      _division = value;
                      _divisionController.text = value.label;
                    },
                  ),
                  FDropDownSearchMultiple<Warehouse>(
                    validator: _requiredObjectValidator.call,
                    labelText: 'warehouse'.tr(),
                    items: Warehouse.products,
                    status: Status.loaded,
                    onChanged: (warhouses) => _warehouse = warhouses,
                    itemAsString: (warhouse) => warhouse.label,
                    selectedItems: _warehouse!,
                    dropdownBuilder: (context, selectedItems) {
                      final theme = Theme.of(context);
                      return Wrap(
                        spacing: 10,
                        children: selectedItems.map((e) {
                          return Container(
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.lighten(.33),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            margin: const EdgeInsets.only(top: 8),
                            padding: const EdgeInsets.only(left: 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  e.id,
                                  style: TextStyle(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: theme.colorScheme.primary,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      selectedItems.remove(e);
                                      _warehouse!.remove(e);
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                  // SelectChipField<Warehouse>(
                  //   label: 'warehouse'.tr(),
                  //   getLabel: (warehouse) => warehouse.label,
                  //   controller: _warehouseController,
                  //   validator: requiredValidator.call,
                  //   options: Warehouse.list,
                  //   onChanged: (value) {
                  //     _warehouse = value;
                  //     _warehouseController.text = value.label;
                  //   },
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
