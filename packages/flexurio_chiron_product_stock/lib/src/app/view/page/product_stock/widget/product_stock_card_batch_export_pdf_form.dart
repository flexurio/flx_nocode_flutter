import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_stock_card_batch_query/product_stock_card_batch_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_stock/util/pdf_product_stock_card_batch.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';
import 'package:gap/gap.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ProductStockCardBatchExportPdfForm extends StatefulWidget {
  const ProductStockCardBatchExportPdfForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductStockCardBatchQueryBloc(),
        ),
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(
              ProductQueryEvent.fetch(pageOptions: PageOptions.emptyNoLimit()),
            ),
        ),
      ],
      child: const ProductStockCardBatchExportPdfForm._(),
    );
  }

  @override
  State<ProductStockCardBatchExportPdfForm> createState() =>
      _ProductStockCardBatchExportPdfFormState();
}

class _ProductStockCardBatchExportPdfFormState
    extends State<ProductStockCardBatchExportPdfForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _dateStart;
  DateTime? _dateEnd;
  late Warehouse _warehouse;
  late Product _product;

  final _dateStartController = TextEditingController();
  final _dateEndController = TextEditingController();
  final _warehouseController = TextEditingController();

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ProductStockCardBatchQueryBloc>().add(
            ProductStockCardBatchQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(sortBy: 'product_id'),
              startDate: _dateStart!,
              endDate: _dateEnd!,
              product: _product,
              warehouse: _warehouse,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;
    final entity = Entity.productReturn;

    return BlocListener<ProductStockCardBatchQueryBloc,
        ProductStockCardBatchQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (data) {
            state.maybeWhen(
              orElse: () {},
              error: (error) => Toast(context).fail(error),
              loaded: (productStock) async {
                final pdf = pw.Document()
                  ..addPage(
                    await pdfProductStockCardBatch(
                      data: productStock.data,
                    ),
                  );
                await Printing.sharePdf(
                  bytes: await pdf.save(),
                  filename: 'Kartu Stok Per Produk Per Batch.pdf',
                );
              },
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
          BlocBuilder<ProductStockCardBatchQueryBloc,
              ProductStockCardBatchQueryState>(
            builder: (context, state) {
              return Button(
                permission: null,
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
                    onChanged: (value) {
                      _dateStart = value;
                    },
                    initialSelectedDate: _dateStart,
                    controller: _dateStartController,
                  ),
                  FieldDatePicker(
                    validator: requiredObjectValidator.call,
                    labelText: 'end_date'.tr(),
                    onChanged: (value) {
                      _dateEnd = value;
                    },
                    initialSelectedDate: _dateEnd,
                    controller: _dateEndController,
                  ),
                ],
              ),
              Gap(12),
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
                  SelectChipField<Warehouse>(
                    label: 'warehouse'.tr(),
                    getLabel: (warehouse) => warehouse.label,
                    controller: _warehouseController,
                    validator: requiredValidator.call,
                    options: Warehouse.products,
                    onChanged: (value) {
                      _warehouse = value;
                      _warehouseController.text = value.label;
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
