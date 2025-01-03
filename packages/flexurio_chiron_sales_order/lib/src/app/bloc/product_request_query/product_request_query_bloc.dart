import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_request_query_bloc.freezed.dart';

@freezed
class ProductRequestQueryState with _$ProductRequestQueryState {
  const factory ProductRequestQueryState.initial() = _Initial;
  const factory ProductRequestQueryState.loading(
    PageOptions<ProductRequest> pageOptions,
  ) = _Loading;
  const factory ProductRequestQueryState.loaded(
    PageOptions<ProductRequest> pageOptions,
  ) = _Loaded;
  const factory ProductRequestQueryState.error(String error) = _Error;
}

@freezed
class ProductRequestQueryEvent with _$ProductRequestQueryEvent {
  const factory ProductRequestQueryEvent.fetch({
    PageOptions<ProductRequest>? pageOptions,
    String? purchaseOrderDistributorId,
    String? status,
  }) = _Fetch;
}

class ProductRequestQueryBloc
    extends Bloc<ProductRequestQueryEvent, ProductRequestQueryState> {
  ProductRequestQueryBloc() : super(const _Initial()) {
    on<ProductRequestQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, purchaseOrderDistributorId, status) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions =
                await PurchasingRepository.instance.productRequestFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              purchaseOrderDistributorId: purchaseOrderDistributorId,
              status: status,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductRequest> _pageOptions = PageOptions.empty(
    sortBy: 'created_at',
  );
}
