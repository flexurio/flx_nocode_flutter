import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_query_bloc.freezed.dart';

@freezed
class ProductReturnQueryState with _$ProductReturnQueryState {
  const factory ProductReturnQueryState.initial() = _Initial;
  const factory ProductReturnQueryState.loading(
    PageOptions<ProductReturn> pageOptions,
  ) = _Loading;
  const factory ProductReturnQueryState.loaded(
    PageOptions<ProductReturn> pageOptions,
  ) = _Loaded;
  const factory ProductReturnQueryState.error(String error) = _Error;
}

@freezed
class ProductReturnQueryEvent with _$ProductReturnQueryEvent {
  const factory ProductReturnQueryEvent.fetch({
    PageOptions<ProductReturn>? pageOptions,
    String? status,
    String? customerId,
    String? departmentId,
    DateTime? createdDateStart,
    DateTime? createdDateEnd,
  }) = _Fetch;
  const factory ProductReturnQueryEvent.fetchById(String id) = _FetchById;
}

class ProductReturnQueryBloc
    extends Bloc<ProductReturnQueryEvent, ProductReturnQueryState> {
  ProductReturnQueryBloc() : super(const _Initial()) {
    on<ProductReturnQueryEvent>(
      (event, emit) async {
        await event.when(
          fetchById: (id) async {
          emit(_Loading(_pageOptions));
          try {
            final productReturn =
                await ProductRepository.instance.productReturnFetchById(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
            );
            emit(_Loaded(PageOptions.empty(data: [productReturn])));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
          fetch: (
            pageOptions,
            status,
            customerId,
            departmentId,
            createdAtStart,
            createdAtEnd,
          ) async {
            emit(_Loading(_pageOptions));
            try {
              if (pageOptions != null) {
                _pageOptions = pageOptions;
              }

              _pageOptions =
                  await ProductRepository.instance.productReturnFetch(
                accessToken: UserRepositoryApp.instance.token!,
                pageOptions: _pageOptions,
                status: status,
                customerId: customerId,
                departmentId: departmentId,
                createdDateStart: createdAtStart,
                createdDateEnd: createdAtEnd,
              );
              emit(_Loaded(_pageOptions));
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
  PageOptions<ProductReturn> _pageOptions = PageOptions.empty();
}
