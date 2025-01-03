import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_detail/sales_order_detail_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_detail.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownBatch extends StatefulWidget {
  const DropdownBatch({
    required this.productId,
    required this.salesOrderDetail,
    required this.bloc,
    required this.batchNo,
    this.onChanged,
    super.key,
  });

  static Widget prepare({
    required String productId,
    required SalesOrderDetailBloc bloc,
    required SalesOrderDetail salesOrderDetail,
    required String batchNo,
    void Function(ProductStock?)? onChanged,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductStockQueryBloc()
            ..add(ProductStockQueryEvent.fetch(productId: productId)),
        ),
      ],
      child: DropdownBatch(
        productId: productId,
        batchNo: batchNo,
        bloc: bloc,
        salesOrderDetail: salesOrderDetail,
        onChanged: onChanged,
      ),
    );
  }

  final SalesOrderDetail salesOrderDetail;
  final String productId;
  final String batchNo;
  final SalesOrderDetailBloc bloc;
  final void Function(ProductStock?)? onChanged;

  @override
  State<DropdownBatch> createState() => _DropdownBatchState();
}

class _DropdownBatchState extends State<DropdownBatch> {
  late ProductStock _productStock;

  @override
  void initState() {
    _productStock = ProductStock.empty().copyWith(
        batch: Batch(
      widget.batchNo,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductStockQueryBloc, ProductStockQueryState>(
      builder: (context, state) {
        return FDropDownSearch<ProductStock>(
          initialValue: _productStock,
          labelText: 'Batch',
          items: state.maybeWhen(
            loaded: (productStock) => productStock,
            orElse: () => [],
          ),
          onChanged: (value) {
            if (value != null) {
              widget.bloc.add(
                SalesOrderDetailEvent.updateProductStock(
                  salesOrderDetail: widget.salesOrderDetail,
                  batchNo: value.batch.id,
                ),
              );
              widget.onChanged!(value);
            }
          },
          itemAsString: (productStock) => productStock.batch.id,
          validator: requiredObjectValidator.call,
        );
      },
    );
  }
}
