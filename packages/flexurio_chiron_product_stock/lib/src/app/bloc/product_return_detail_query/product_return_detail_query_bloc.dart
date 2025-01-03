import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_detail_query_bloc.freezed.dart';

@freezed
class ProductReturnDetailQueryState with _$ProductReturnDetailQueryState {
  const factory ProductReturnDetailQueryState.initial() = _Initial;
  const factory ProductReturnDetailQueryState.loading(
    PageOptions<ProductReturnDetail> pageOptions,
  ) = _Loading;
  const factory ProductReturnDetailQueryState.loaded(
    PageOptions<ProductReturnDetail> pageOptions,
  ) = _Loaded;
  const factory ProductReturnDetailQueryState.error(String error) = _Error;
}

@freezed
class ProductReturnDetailQueryEvent with _$ProductReturnDetailQueryEvent {
  const factory ProductReturnDetailQueryEvent.fetch({
    required String productReturnId,
    PageOptions<ProductReturnDetail>? pageOptions,
  }) = _Fetch;
  const factory ProductReturnDetailQueryEvent.fetchById({
    required int idDetail,
    required String productReturnId,
    PageOptions<ProductReturnDetail>? pageOptions,
  }) = _FetchById;
}

class ProductReturnDetailQueryBloc
    extends Bloc<ProductReturnDetailQueryEvent, ProductReturnDetailQueryState> {
  ProductReturnDetailQueryBloc() : super(const _Initial()) {
    on<ProductReturnDetailQueryEvent>(
      (event, emit) async {
        await event.when(
          fetchById: (idDetail, productReturnId, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
                _pageOptions = pageOptions;
              }
            _pageOptions =
                await ProductRepository.instance.productReturnDetailFetchById(
              accessToken: UserRepositoryApp.instance.token!,
              idDetail: idDetail,
              productReturnId: productReturnId,
              pageOptions: _pageOptions,
            );
            emit(_Loaded(_pageOptions));
          } catch (error, stack) {
            print(stack);
            emit(_Error(errorMessage(error)));
          }
        },
          fetch: (productReturnId, pageOptions) async {
            emit( _Loading(_pageOptions));
            try {
              if (pageOptions != null) {
                _pageOptions = pageOptions;
              }

              _pageOptions =
                  await ProductRepository.instance.productReturnDetailFetch(
                productReturnId: productReturnId,
                pageOptions: _pageOptions,
                accessToken: UserRepositoryApp.instance.token!,
              );
              emit(
                _Loaded(_pageOptions),
              );
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
  PageOptions<ProductReturnDetail> _pageOptions = PageOptions.empty();
}
