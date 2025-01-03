import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_cart_bloc.freezed.dart';

class CartItem {
  CartItem({
    required this.product,
    required this.quantity,
  });

  final ProductStockWithPrice product;
  double quantity;
}

@freezed
abstract class OrderCartEvent with _$OrderCartEvent {
  const factory OrderCartEvent.increaseQuantity({
    required ProductStockWithPrice product,
  }) = _IncreaseQuantity;
  const factory OrderCartEvent.decreaseQuantity({
    required ProductStockWithPrice product,
  }) = _DecreaseQuantity;
  const factory OrderCartEvent.setQuantity({
    required ProductStockWithPrice product,
    required double quantity,
  }) = _SetQuantity;
  const factory OrderCartEvent.removeProduct({
    required ProductStockWithPrice product,
  }) = _RemoveProduct;
}

class OrderCartBloc extends Bloc<OrderCartEvent, List<CartItem>> {
  OrderCartBloc() : super([]) {
    on<OrderCartEvent>((event, emit) async {
      event.when(
        increaseQuantity: (product) {
          final itemIndex = _cart.indexWhere((item) => item.product == product);

          if (itemIndex != -1) {
            _cart[itemIndex].quantity = _cart[itemIndex].quantity + 1;
          } else {
            _cart.add(
              CartItem(
                product: product,
                quantity: 1,
              ),
            );
          }

          emit(List.from(_cart));
        },
        decreaseQuantity: (product) {
          final itemIndex = _cart.indexWhere((item) => item.product == product);

          if (itemIndex != -1) {
            _cart[itemIndex].quantity = _cart[itemIndex].quantity - 1;
            if (_cart[itemIndex].quantity == 0) {
              _cart.removeAt(itemIndex);
            }
          }

          emit(List.from(_cart));
        },
        setQuantity: (product, quantity) {
          final itemIndex = _cart.indexWhere((item) => item.product == product);
          if (itemIndex != -1) {
            _cart[itemIndex].quantity = quantity;
          } else {
            _cart.add(
              CartItem(
                product: product,
                quantity: quantity,
              ),
            );
          }
          if (itemIndex != -1 && _cart[itemIndex].quantity == 0) {
            _cart.removeAt(itemIndex);
          }
          emit(List.from(_cart));
        },
        removeProduct: (product) {
          _cart.removeWhere((item) => item.product == product);
          emit(List.from(_cart));
        },
      );
    });
  }
  final _cart = <CartItem>[];
}
