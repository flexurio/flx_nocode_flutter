import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_stock_query/product_stock_query_bloc.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductRequestColumProductStock extends StatefulWidget {
  const ProductRequestColumProductStock({
    super.key,
    this.product,
    this.onQuantityChanged,
  });

  final Product? product;
  final void Function(int quantity, DateTime? expiredDate)? onQuantityChanged;

  static Widget prepare({
    Product? product,
    List<Warehouse>? warehouse,
    double endingBalance = 0,
    String? unitId,
    void Function(int quantity, DateTime? expiredDate)? onQuantityChanged,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductStockQueryBloc()
            ..add(
              ProductStockQueryEvent.fetch(
                period: DateTime.now(),
                productId: product!.id,
                endingBalance: endingBalance,
                warehouse: warehouse,
                unitId: unitId,
              ),
            ),
        ),
      ],
      child: ProductRequestColumProductStock(
        product: product,
        onQuantityChanged: onQuantityChanged,
      ),
    );
  }

  @override
  State<ProductRequestColumProductStock> createState() =>
      _ProductRequestColumProductStockState();
}

class _ProductRequestColumProductStockState
    extends State<ProductRequestColumProductStock> {
  final _stock = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime? expiredDate = null;
    return BlocBuilder<ProductStockQueryBloc, ProductStockQueryState>(
      builder: (context, state) {
        state.maybeWhen(
          loaded: (productsStock) {
            var quantity = 0;

            if (productsStock.isNotEmpty) {
              expiredDate = productsStock.first.expiredDate;
              quantity = productsStock.fold(
                0,
                (quantity, item) => quantity + item.endingBalanceMarketing,
              );
            }
            _stock.text = quantity.toString();
            widget.onQuantityChanged?.call(quantity, expiredDate);
          },
          orElse: () => const Center(
            child: CupertinoActivityIndicator(),
          ),
        );
        return Text('${_stock.text} (ED: ${expiredDate?.formatMMMyy ?? ''})');
      },
    );
  }
}
