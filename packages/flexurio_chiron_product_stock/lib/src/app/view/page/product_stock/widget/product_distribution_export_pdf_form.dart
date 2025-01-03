import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_distribution_detail_query/product_distribution_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_stock/util/pdf_product_distribution.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';

class ProductDistributionExportPdfForm extends StatefulWidget {
  const ProductDistributionExportPdfForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductDistributionQueryBloc(),
        ),
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(
              ProductQueryEvent.fetch(pageOptions: PageOptions.emptyNoLimit()),
            ),
        ),
      ],
      child: const ProductDistributionExportPdfForm._(),
    );
  }

  @override
  State<ProductDistributionExportPdfForm> createState() =>
      _ProductDistributionExportPdfFormState();
}

class _ProductDistributionExportPdfFormState
    extends State<ProductDistributionExportPdfForm> {
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
      context.read<ProductDistributionQueryBloc>().add(
            ProductDistributionQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(sortBy: 'product_id'),
              createdAtStart: _dateStart!,
              createdAtEnd: _dateEnd!,
              warehouseId: _warehouse.id,
              productId: _product.id,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;
    final entity = Entity.productReturn;

    return BlocListener<ProductDistributionQueryBloc,
        ProductDistributionQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (data) {
            state.maybeWhen(
              orElse: () {},
              error: (error) => Toast(context).fail(error),
              loaded: (pageOptions) async {
                final pdf = pw.Document()
                  ..addPage(
                    await pdfProductDistribution(data: pageOptions.data),
                  );
                await Printing.sharePdf(
                  bytes: await pdf.save(),
                  filename: 'Product-Distribution.pdf',
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
          BlocBuilder<ProductDistributionQueryBloc,
              ProductDistributionQueryState>(
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
              FDropDownSearchProduct(
                onChanged: (product) {
                  if (product != null) {
                    _product = product;
                    setState(() {});
                  }
                },
              ),
              Gap(12),
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
              SelectChipField<Warehouse>(
                label: 'warehouse'.tr(),
                getLabel: (warehouse) => warehouse.label,
                controller: _warehouseController,
                validator: requiredValidator.call,
                options: Warehouse.products,
                onChanged: (value) {
                  _warehouse = value;
                  _warehouseController.text = value.label;
                  // setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
