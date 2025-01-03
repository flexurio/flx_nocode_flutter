import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_disposition_query_bloc.freezed.dart';

@freezed
class ProductReturnRecapDispositionQueryState
    with _$ProductReturnRecapDispositionQueryState {
  const factory ProductReturnRecapDispositionQueryState.initial() = _Initial;
  const factory ProductReturnRecapDispositionQueryState.loading(
    PageOptions<ProductReturnRecapDisposition> pageOptions,
  ) = _Loading;
  const factory ProductReturnRecapDispositionQueryState.loaded(
    PageOptions<ProductReturnRecapDisposition> pageOptions,
  ) = _Loaded;
  const factory ProductReturnRecapDispositionQueryState.error(String error) =
      _Error;
}

@freezed
class ProductReturnRecapDispositionQueryEvent
    with _$ProductReturnRecapDispositionQueryEvent {
  const factory ProductReturnRecapDispositionQueryEvent.fetch({
    PageOptions<ProductReturnRecapDisposition>? pageOptions,
    DateTime? createdAtStart,
    DateTime? createdAtEnd,
    ProductReturnCheckStatus? status,
    String? productId,
  }) = _Fetch;
}

class ProductReturnRecapDispositionQueryBloc extends Bloc<
    ProductReturnRecapDispositionQueryEvent,
    ProductReturnRecapDispositionQueryState> {
  ProductReturnRecapDispositionQueryBloc() : super(const _Initial()) {
    on<ProductReturnRecapDispositionQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, createdAtStart, createdAtEnd, status,
            productId,) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            final invoices =
                await ProductReturnRepository.instance.recapDispositionFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              createdAtEnd: createdAtEnd,
              createdAtStart: createdAtStart,
              status: status,
              productId: productId,
            );
            emit(_Loaded(invoices));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductReturnRecapDisposition> _pageOptions = PageOptions.empty();
}
