import 'package:flexurio_chiron_sales_order/src/app/bloc/order_cart/order_cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSelectedBloc extends Bloc<CartItem?, CartItem?> {
  ProductSelectedBloc() : super(null) {
    on<CartItem?>((event, emit) async {
      return emit(event);
    });
  }
}
