// import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request_detail.dart';
import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_request_detail_query_bloc.freezed.dart';

@freezed
class ProductRequestDetailQueryState with _$ProductRequestDetailQueryState {
  const factory ProductRequestDetailQueryState.initial() = _Initial;
  const factory ProductRequestDetailQueryState.loading() = _Loading;
  const factory ProductRequestDetailQueryState.loaded(
    List<ProductRequestDetail> productRequestDetail,
  ) = _Loaded;
  const factory ProductRequestDetailQueryState.error(String error) = _Error;
}

@freezed
class ProductRequestDetailQueryEvent with _$ProductRequestDetailQueryEvent {
  const factory ProductRequestDetailQueryEvent.fetch({
    required ProductRequest productRequest,
  }) = _Fetch;
}

class ProductRequestDetailQueryBloc extends Bloc<ProductRequestDetailQueryEvent,
    ProductRequestDetailQueryState> {
  ProductRequestDetailQueryBloc() : super(const _Initial()) {
    on<ProductRequestDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          ProductRequest productRequest,
        ) async {
          emit(const _Loading());
          try {
            final response =
                await PurchasingRepository.instance.productRequestDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              productRequest: productRequest,
            );
            emit(_Loaded(response));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
