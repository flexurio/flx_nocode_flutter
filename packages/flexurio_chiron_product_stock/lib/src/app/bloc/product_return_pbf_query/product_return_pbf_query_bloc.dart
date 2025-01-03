import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_pbf.dart';
import 'package:flexurio_chiron_product_stock/src/app/resource/product_return.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_pbf_query_bloc.freezed.dart';

@freezed
class ProductReturnPbfQueryState with _$ProductReturnPbfQueryState {
  const factory ProductReturnPbfQueryState.initial() = _Initial;
  const factory ProductReturnPbfQueryState.loading(
    PageOptions<ProductReturnPbf> pageOptions,
  ) = _Loading;
  const factory ProductReturnPbfQueryState.loaded(
    PageOptions<ProductReturnPbf> pageOptions,
  ) = _Loaded;
  const factory ProductReturnPbfQueryState.error(String error) = _Error;
}

@freezed
class ProductReturnPbfQueryEvent with _$ProductReturnPbfQueryEvent {
  const factory ProductReturnPbfQueryEvent.fetch({
    PageOptions<ProductReturnPbf>? pageOptions,
    String? productId,
    DateTime? deliverOrderDataStart,
    DateTime? deliverOrderDataEnd,
  }) = _Fetch;
}

class ProductReturnPbfQueryBloc
    extends Bloc<ProductReturnPbfQueryEvent, ProductReturnPbfQueryState> {
  ProductReturnPbfQueryBloc() : super(const _Initial()) {
    on<ProductReturnPbfQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, productId, deliverOrderDataStart,
            deliverOrderDataEnd) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await ProductReturnRepository.instance.pbfFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              deliverOrderDataStart: deliverOrderDataStart,
              deliverOrderDataEnd: deliverOrderDataEnd,
              productId: productId,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductReturnPbf> _pageOptions = PageOptions.empty(
    sortBy: 'delivery_order_id',
  );
}
