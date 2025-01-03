import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_check.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_check_query_bloc.freezed.dart';

@freezed
class ProductReturnCheckQueryState with _$ProductReturnCheckQueryState {
  const factory ProductReturnCheckQueryState.initial() = _Initial;
  const factory ProductReturnCheckQueryState.loading(
    PageOptions<ProductReturnCheck> pageOptions,
  ) = _Loading;
  const factory ProductReturnCheckQueryState.loaded(
    PageOptions<ProductReturnCheck> pageOptions,
  ) = _Loaded;
  const factory ProductReturnCheckQueryState.error(String? error) = _Error;
}

@freezed
class ProductReturnCheckQueryEvent with _$ProductReturnCheckQueryEvent {
  const factory ProductReturnCheckQueryEvent.fetch({
    required String productReturnId,
    PageOptions<ProductReturnCheck>? pageOptions,
    String? productId,
    String? batchId,
    }) = _Fetch;
}

class ProductReturnCheckQueryBloc
    extends Bloc<ProductReturnCheckQueryEvent, ProductReturnCheckQueryState> {
  ProductReturnCheckQueryBloc() : super(const _Initial()) {
    on<ProductReturnCheckQueryEvent>((event, emit) async {
      await event.when(
        fetch: (productReturnId,pageOptions, productId, batchId) async {
          emit( _Loading(_pageOptions));
          try {
            if (pageOptions != null) {
                _pageOptions = pageOptions;
              }
            _pageOptions =
                await ProductRepository.instance.productReturnCheckFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              productReturnId: productReturnId,
              productId: productId,
              batchId: batchId,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductReturnCheck> _pageOptions = PageOptions.empty();
}
