import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_stock_mutation_product_detail_query/product_stock_mutation_product_detail_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_stock/util/pdf_product_stock_mutation_product_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';
import 'package:gap/gap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ProductStockMutationProductDetailExportPdfForm extends StatefulWidget {
  const ProductStockMutationProductDetailExportPdfForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductStockMutationProductDetailQueryBloc(),
        ),
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)..add(
            ProductQueryEvent.fetch(pageOptions: PageOptions.emptyNoLimit()),
          ),
        ),
      ],
      child: const ProductStockMutationProductDetailExportPdfForm._(),
    );
  }

  @override
  State<ProductStockMutationProductDetailExportPdfForm> createState() =>
  _ProductStockMutationProductDetailExportPdfFormState();
}

class _ProductStockMutationProductDetailExportPdfFormState
  extends State<ProductStockMutationProductDetailExportPdfForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _dateStart;
  DateTime? _dateEnd;
  late Product _product;

  final _dateStartController = TextEditingController();
  final _dateEndController = TextEditingController();

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ProductStockMutationProductDetailQueryBloc>().add(
        ProductStockMutationProductDetailQueryEvent.fetch(
          pageOptions: PageOptions.emptyNoLimit(sortBy: 'product_id'),
          startPeriod: _dateStart!,
          endPeriod: _dateEnd!,
          product: _product,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;

    return BlocListener<ProductStockMutationProductDetailQueryBloc, ProductStockMutationProductDetailQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (data) {
            state.maybeWhen(
              orElse: () {},
              error: (error) => Toast(context).fail(error),
              loaded: (productStockMutationProductDetail) async {
                final pdf = pw.Document()..addPage(
                  await pdfProductStockMutationProductDetail(
                    data: productStockMutationProductDetail.data,
                  ),
                );
                await Printing.sharePdf(
                  bytes: await pdf.save(),
                  // ReportMutasiProdukDetail
                  filename: 'Product Stock Mutation Product Detail.pdf',
                );
              },
            );
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} Product Stock Mutation Product Detail',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<ProductStockMutationProductDetailQueryBloc, ProductStockMutationProductDetailQueryState>(
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
