import 'package:appointment/src/app/bloc/value/bloc/value_bloc.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({
    required this.productStockQueryBloc,
    super.key,
    this.closeWhenSubmitted = false,
  });
  static Widget prepare({
    required ProductStockQueryBloc productStockQueryBloc,
    bool closeWhenSubmitted = false,
  }) {
    return BlocProvider(
      create: (_) =>
          ProductStockQueryBloc()..add(const ProductStockQueryEvent.fetch()),
      child: FilterForm(
        productStockQueryBloc: productStockQueryBloc,
        closeWhenSubmitted: closeWhenSubmitted,
      ),
    );
  }

  @override
  State<FilterForm> createState() => _FilterFormState();
  final ProductStockQueryBloc productStockQueryBloc;
  final bool closeWhenSubmitted;
}

class _FilterFormState extends State<FilterForm> {
  final _periodController = TextEditingController();

  List<String>? _products;
  DateTime? _period;
  String? _productId;
  String? _productGroupId;
  String? _batchId;

  void productGroupOnChanged(String? p, List<ProductStock> productStocks) {
    if (p != null) {
      setState(() {
        final filteredProduct = productStocks
            .where(
              (item) => item.productGroup.id.toLowerCase() == p.toLowerCase(),
            )
            .toList();
        _products = filteredProduct.map((p) => p.product.id).toSet().toList();
        _productGroupId = p;
      });
    }
  }

  void _submit() {
    context.read<ValueBloc<ProductStockFilter>>().add(
          ProductStockFilter(
            period: _period,
            batchId: _batchId,
            productId: _productId,
            productGroupId: _productGroupId,
          ),
        );
    widget.productStockQueryBloc.add(
      ProductStockQueryEvent.fetch(
        period: _period,
        productGroupId: _productGroupId,
        productId: _productId,
        batchId: _batchId,
      ),
    );
    if (widget.closeWhenSubmitted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductStockQueryBloc, ProductStockQueryState>(
      builder: (context, state) {
        final status = state.maybeWhen(
          orElse: () => Status.progress,
          loaded: (productsStock) => Status.loaded,
          error: (message) => Status.error,
        );
        final items = state.maybeWhen(
          orElse: () => <ProductStock>[],
          loaded: (productsStock) => productsStock,
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Filter',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            FieldMonthPicker(
              controller: _periodController,
              labelText: 'Month',
              maxDate: DateTime.now(),
              onChanged: (d) {
                setState(() {
                  _period = d;
                });
              },
            ),
            const SizedBox(height: 12),
            FDropDownSearch<String>(
              labelText: 'Product Group',
              itemAsString: (productGroupId) => productGroupId,
              items: items.map((p) => p.productGroup.id).toSet().toList(),
              status: status,
              onChanged: (p) {
                productGroupOnChanged(p, items);
              },
            ),
            const SizedBox(height: 12),
            FDropDownSearch<String>(
              labelText: 'Product',
              itemAsString: (p) => p,
              items:
                  _products ?? items.map((p) => p.product.id).toSet().toList(),
              status: status,
              onChanged: (p) {
                if (p != null) {
                  setState(() {
                    _productId = p;
                  });
                }
              },
            ),
            const SizedBox(height: 12),
            FDropDownSearch<String>(
              labelText: 'Batch',
              itemAsString: (b) => b,
              items: items.map((p) => p.batch.id).toSet().toList(),
              status: status,
              onChanged: (p) {
                if (p != null) {
                  _batchId = p;
                }
              },
            ),
            const SizedBox(height: 12),
            BlocBuilder<ProductStockQueryBloc, ProductStockQueryState>(
              bloc: widget.productStockQueryBloc,
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
    );
  }
}

class ProductStockFilter {
  ProductStockFilter({
    required this.period,
    required this.batchId,
    required this.productId,
    required this.productGroupId,
  });
  DateTime? period;
  String? productId;
  String? productGroupId;
  String? batchId;
}
