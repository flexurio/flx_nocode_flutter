import 'package:flexurio_chiron_product/src/app/bloc/product_group_query/product_group_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/recap_product_stock_query/recap_product_stock_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_query/bloc/product_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RecapProductStockFilterForm extends StatefulWidget {
  const RecapProductStockFilterForm({
    required this.recapProductStockQueryBloc,
    this.closeWhenSubmitted = false,
    super.key,
  });

  final RecapProductStockQueryBloc recapProductStockQueryBloc;
  final bool closeWhenSubmitted;

  static Widget prepare({
    required RecapProductStockQueryBloc recapProductStockQueryBloc,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecapProductStockQueryBloc()
            ..add(const RecapProductStockQueryEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => ProductionOrderQueryBloc(isExternal: false)
            ..add(const ProductionOrderQueryEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(const ProductQueryEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => ProductGroupQueryBloc()
            ..add(const ProductGroupQueryEvent.fetch()),
        ),
      ],
      child: RecapProductStockFilterForm(
        recapProductStockQueryBloc: recapProductStockQueryBloc,
      ),
    );
  }

  @override
  State<RecapProductStockFilterForm> createState() =>
      _RecapProductStockFilterFormState();
}

class _RecapProductStockFilterFormState
    extends State<RecapProductStockFilterForm> {
  final _formKey = GlobalKey<FormState>();
  final _periodController = TextEditingController();

  DateTime? _period;
  String? _productId;
  String? _batchId;

  void _submit() {
    widget.recapProductStockQueryBloc.add(
      RecapProductStockQueryEvent.fetch(
        period: _period,
        batchId: _batchId,
        productId: _productId,
      ),
    );
    if (widget.closeWhenSubmitted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child:
          BlocBuilder<RecapProductStockQueryBloc, RecapProductStockQueryState>(
        bloc: widget.recapProductStockQueryBloc,
        builder: (context, state) {
          final status = state.maybeWhen(
            orElse: () => Status.progress,
            loaded: (recapProductsStock) => Status.loaded,
            error: (error) => Status.error,
          );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filter',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(12),
              FieldMonthPicker(
                maxDate: DateTime.now(),
                labelText: 'Period',
                controller: _periodController,
                onChanged: (value) => _period = value,
              ),
              const Gap(12),
              BlocBuilder<ProductQueryBloc, ProductQueryState>(
                builder: (context, state) {
                  return FDropDownSearch<Product>(
                    labelText: 'Product',
                    itemAsString: (product) => product.name,
                    status: status,
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (product) {
                        final group =
                            groupBy(product.data, (product) => product.id);
                        final products =
                            group.values.expand((element) => element).toList();
                        return products;
                      },
                    ),
                    onChanged: (products) {
                      if (products != null) {
                        _productId = products.id;
                      }
                    },
                  );
                },
              ),
              const Gap(12),
              BlocBuilder<ProductionOrderQueryBloc, ProductionOrderQueryState>(
                builder: (context, state) {
                  return FDropDownSearch<ProductionOrder>(
                    labelText: 'Batch',
                    itemAsString: (productionOrder) => productionOrder.id,
                    status: status,
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (productionOrders) {
                        final group =
                            groupBy(productionOrders.data, (batch) => batch.id);
                        final batch =
                            group.values.expand((element) => element).toList();
                        return batch;
                      },
                    ),
                    onChanged: (productionOrder) {
                      if (productionOrder != null) {
                        _batchId = productionOrder.id;
                      }
                    },
                  );
                },
              ),
              const Gap(12),
              BlocBuilder<RecapProductStockQueryBloc,
                  RecapProductStockQueryState>(
                builder: (context, state) {
                  return Button(
                    permission: null,
                    onPressed: state.maybeWhen(
                      orElse: () => _submit,
                      loading: () => null,
                    ),
                    action: DataAction.applyFilter,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
