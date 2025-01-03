import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MaterialIssueExportPdfButton extends StatefulWidget {
  const MaterialIssueExportPdfButton({
    super.key,
  });

  static Widget prepare({
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                MaterialIssueBomQueryBloc(isExternal: isExternal)),
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: isExternal)
            ..add(
              ProductQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => ProductionOrderQueryBloc(isExternal: isExternal)
            ..add(
              ProductionOrderQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(
              MaterialGroupQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: MaterialIssueExportPdfButton(),
    );
  }

  @override
  State<MaterialIssueExportPdfButton> createState() =>
      _MaterialIssueExportPdfButtonState();
}

class _MaterialIssueExportPdfButtonState
    extends State<MaterialIssueExportPdfButton> {
  Product? _product;
  MaterialGroup? _matGroup;
  ProductionOrder? _batch;
  ProductionProductScale? _scale;

  @override
  void initState() {
    _product = _product;
    _matGroup = _matGroup;
    _batch = _batch;
    _scale = _scale;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<MaterialIssueBomQueryBloc>();
    final productBloc = context.read<ProductQueryBloc>();
    final productionOrderBloc = context.read<ProductionOrderQueryBloc>();
    final materialGroupBloc = context.read<MaterialGroupQueryBloc>();
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'BOM vs MI Comparison Summary',
      permission:
          PermissionMaterialStock.materialIssueComparisonSummaryReportExportPdf,
      onPressed: () async {
        await _showPeriod(
          context,
          queryBloc,
          productBloc,
          productionOrderBloc,
          materialGroupBloc,
        );
      },
    );
  }

  Future<void> _showPeriod(
    BuildContext context,
    MaterialIssueBomQueryBloc queryBloc,
    ProductQueryBloc productBloc,
    ProductionOrderQueryBloc productionOrderBloc,
    MaterialGroupQueryBloc materialGroupBloc,
  ) async {
    await showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CardForm(
          popup: true,
          title: 'Filter',
          icon: Icons.sort,
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
            BlocListener<MaterialIssueBomQueryBloc, MaterialIssueBomQueryState>(
              bloc: queryBloc,
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (error) => Toast(context).fail(error),
                  loaded: (materialIssueBom) async {
                    final pdf = pw.Document()
                      ..addPage(
                        await pdfMaterialIssueBom(
                          data: materialIssueBom,
                        ),
                      );
                    await Printing.sharePdf(
                      bytes: await pdf.save(),
                      filename: 'BOM vs MI Comparison Summary.pdf',
                    );
                  },
                );
              },
              child: BlocBuilder<MaterialIssueBomQueryBloc,
                  MaterialIssueBomQueryState>(
                bloc: queryBloc,
                builder: (context, state) {
                  return Button.small(
                    action: DataAction.exportPdf,
                    permission: null,
                    onPressed: () {
                      if (_scale != null &&
                          _product != null &&
                          _matGroup != null &&
                          _batch != null) {
                        queryBloc.add(
                          MaterialIssueBomQueryEvent.fetch(
                            scale: _scale ?? ProductionProductScale.empty,
                            product: _product ?? Product.empty(),
                            materialGroup: _matGroup ?? MaterialGroup.empty(),
                            productionOrder: _batch ?? ProductionOrder.empty(),
                          ),
                        );
                      } else {
                        Toast(context).fail(
                          'You must insert the Scale, Product, Material Group & Batch',
                        );
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
              FDropDownSearch<ProductionProductScale>(
                labelText: 'Scale',
                itemAsString: (value) => value.id,
                items: ProductionProductScale.list,
                onChanged: (scale) {
                  if (scale != null) {
                    _scale = scale;
                  }
                },
              ),
              const Gap(12),
              BlocBuilder<ProductQueryBloc, ProductQueryState>(
                bloc: productBloc,
                builder: (context, state) {
                  return FDropDownSearch<Product>(
                    labelText: 'Product',
                    itemAsString: (product) => product.name,
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (product) {
                        final group = groupBy(product.data, (product) {
                          return product.id;
                        });
                        final products = group.values.expand((element) {
                          return element;
                        }).toList();
                        return products;
                      },
                    ),
                    onChanged: (products) {
                      if (products != null) {
                        _product = products;
                      }
                    },
                  );
                },
              ),
              const Gap(12),
              BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>(
                bloc: materialGroupBloc,
                builder: (context, state) {
                  return FDropDownSearch<MaterialGroup>(
                    labelText: 'Group',
                    itemAsString: (materialGroup) => materialGroup.id,
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (materialGroups) => materialGroups.data,
                    ),
                    onChanged: (materialGroup) {
                      if (materialGroup != null) {
                        _matGroup = materialGroup;
                      }
                    },
                  );
                },
              ),
              const Gap(12),
              BlocBuilder<ProductionOrderQueryBloc, ProductionOrderQueryState>(
                bloc: productionOrderBloc,
                builder: (context, state) {
                  return FDropDownSearch<ProductionOrder>(
                    labelText: 'Batch',
                    itemAsString: (productionOrder) => productionOrder.id,
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (productionOrders) {
                        final group = groupBy(productionOrders.data, (batch) {
                          return batch.id;
                        });
                        final batch = group.values.expand((element) {
                          return element;
                        }).toList();
                        return batch;
                      },
                    ),
                    onChanged: (productionOrder) {
                      if (productionOrder != null) {
                        _batch = productionOrder;
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
