import 'package:flexurio_chiron_product_stock/src/app/bloc/product_stock_query/product_stock_query_bloc.dart';
import 'package:appointment/src/app/bloc/value/bloc/value_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_stock/widget/filter_form.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_stock/widget/print_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_stock/widget/product_stock_data_table.dart';

import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:screen_identifier/screen_identifier.dart';

class ProductStockPage extends StatelessWidget {
  const ProductStockPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductStockQueryBloc()
            ..add(const ProductStockQueryEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => ValueBloc<ProductStockFilter>(
            ProductStockFilter(
              period: null,
              batchId: null,
              productId: null,
              productGroupId: null,
            ),
          ),
        ),
      ],
      child: const ProductStockPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final productStockBloc = context.read<ProductStockQueryBloc>();
    Widget buildFilter() {
      return SizedBox(
        width: 300,
        child: Column(
          children: [
            const SizedBox(height: 12),
            FilterForm.prepare(
              productStockQueryBloc: productStockBloc,
            ),
            const Divider(),
            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: PrintButton()),
              ],
            ),
          ],
        ),
      );
    }

    Widget buildContent() {
      return FCard(
        padding: const EdgeInsets.all(18),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ProductStockDataTable(
            productStockQueryBloc: context.read<ProductStockQueryBloc>(),
          ),
        ),
      );
    }

    FloatingActionButton buildFabFilter(
      ColorScheme colorScheme,
      BuildContext context,
      ProductStockQueryBloc productStockQueryBloc,
    ) {
      return FloatingActionButton(
        backgroundColor: colorScheme.secondary,
        child: const Icon(FontAwesomeIcons.filter),
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: FilterForm.prepare(
                  productStockQueryBloc: productStockQueryBloc,
                  closeWhenSubmitted: true,
                ),
              );
            },
          );
        },
      );
    }

    return ScreenIdentifierBuilder(
      builder: (context, screenIdentifier) {
        return screenIdentifier.conditions(
          md: Scaffold(
            backgroundColor: Colors.transparent,
            floatingActionButton: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const PrintButton(
                  isFab: true,
                ),
                const Gap(12),
                buildFabFilter(
                  colorScheme,
                  context,
                  productStockBloc,
                ),
              ],
            ),
            body: buildContent(),
          ),
          lg: ContentWithRightPanel(
            rightPanel: buildFilter(),
            child: buildContent(),
          ),
        );
      },
    );
  }
}
