import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_query/bloc/product_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ProductionOrderReportJobsheetButton extends StatefulWidget {
  const ProductionOrderReportJobsheetButton({super.key});

  static Widget prepare({
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: isExternal),
        ),
        BlocProvider(
          create: (context) => ProductionOrderQueryBloc(isExternal: isExternal),
        ),
      ],
      child: const ProductionOrderReportJobsheetButton(),
    );
  }

  @override
  State<ProductionOrderReportJobsheetButton> createState() =>
      _ProductionOrderReportJobsheetButtonState();
}

class _ProductionOrderReportJobsheetButtonState
    extends State<ProductionOrderReportJobsheetButton> {
  Product? _product;
  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<ProductionOrderQueryBloc>();
    final productBloc = context.read<ProductQueryBloc>();
    return BlocListener<ProductionOrderQueryBloc, ProductionOrderQueryState>(
      bloc: queryBloc,
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            print(pageOptions.data.length);
            final data = pageOptions.data;
            Future<Uint8List> generatePdf() async {
              final pdf = pw.Document(
                title: 'Production_Order_Report_Jobsheet_${_product!.name}.pdf'
                    .replaceAll(' ', '_'),
              );
              for (final productionOrder in data) {
                pdf.addPage(
                  await reportJobsheetProductionOrder(productionOrder),
                );
              }
              return pdf.save();
            }

            await Printing.layoutPdf(
              format: PdfPageFormat.a4.portrait,
              onLayout: (format) => generatePdf(),
            );
          },
        );
      },
      child: LightButtonSmall(
        action: DataAction.exportJobsheet,
        permission: null,
        onPressed: () async {
          productBloc.add(
            ProductQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            ),
          );
          await _showFilter(context, queryBloc, productBloc);
        },
      ),
    );
  }

  Future<void> _showFilter(
    BuildContext context,
    ProductionOrderQueryBloc queryBloc,
    ProductQueryBloc productBloc,
  ) async {
    await showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CardForm(
          popup: true,
          title: 'select_data'.tr(namedArgs: {'data': 'product'.tr()}),
          icon: FontAwesomeIcons.filter,
          actions: [
            Button(
              action: DataAction.cancel,
              isSecondary: true,
              permission: null,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Gap(12),
            BlocBuilder<ProductionOrderQueryBloc, ProductionOrderQueryState>(
              bloc: queryBloc,
              builder: (context, state) {
                final isInProgress = state.maybeWhen(
                  orElse: () => false,
                  loading: (_) => true,
                );
                return Button(
                  action: DataAction.print,
                  permission: null,
                  isInProgress: isInProgress,
                  onPressed: () {
                    if (_product != null) {
                      queryBloc.add(
                        ProductionOrderQueryEvent.fetch(product: _product),
                      );
                    } else {
                      Toast(context).fail('Please select the Product');
                    }
                  },
                );
              },
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
            ],
          ),
        );
      },
    );
  }
}
