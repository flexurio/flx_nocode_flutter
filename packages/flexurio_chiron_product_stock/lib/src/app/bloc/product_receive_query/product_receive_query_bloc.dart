import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive.dart';
import 'package:flexurio_chiron_product_stock/src/app/resource/product_receive.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_receive_query_bloc.freezed.dart';

@freezed
class ProductReceiveQueryState with _$ProductReceiveQueryState {
  const factory ProductReceiveQueryState.initial() = _Initial;
  const factory ProductReceiveQueryState.loading() = _Loading;
  const factory ProductReceiveQueryState.loaded(
    List<ProductReceive> productReceives,
  ) = _Success;
  const factory ProductReceiveQueryState.error(String error) = _Error;
}

@freezed
class ProductReceiveQueryEvent with _$ProductReceiveQueryEvent {
  const factory ProductReceiveQueryEvent.fetch({
    PurchaseOrder? purchaseOrder,
  }) = _Fetch;
}

class ProductReceiveQueryBloc
    extends Bloc<ProductReceiveQueryEvent, ProductReceiveQueryState> {
  final bool isExternal;
  ProductReceiveQueryBloc({
    required this.isExternal,
  }) : super(const _Initial()) {
    on<ProductReceiveQueryEvent>((event, emit) async {
      await event.when(
        fetch: (purchaseOrder) async {
          emit(const _Loading());
          try {
            final productReceive =
                await ProductReceiveRepository.instance.productReceiveFetch(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrderId: purchaseOrder?.id,
              isExternal: isExternal,
            );
            emit(_Success(productReceive));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
