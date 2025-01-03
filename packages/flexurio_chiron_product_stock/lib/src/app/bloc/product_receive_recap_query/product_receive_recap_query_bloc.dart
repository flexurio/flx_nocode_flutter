// import 'package:appointment/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_recap.dart';
import 'package:flexurio_chiron_product_stock/src/app/resource/product_receive_recap.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_receive_recap_query_bloc.freezed.dart';

@freezed
class ProductReceiveRecapQueryState with _$ProductReceiveRecapQueryState {
  const factory ProductReceiveRecapQueryState.initial() = _Initial;
  const factory ProductReceiveRecapQueryState.loading(
    PageOptions<ProductReceiveRecap> pageOptions,
  ) = _Loading;
  const factory ProductReceiveRecapQueryState.loaded(
    PageOptions<ProductReceiveRecap> pageOptions,
  ) = _Success;
  const factory ProductReceiveRecapQueryState.error(String error) = _Error;
}

@freezed
class ProductReceiveRecapQueryEvent with _$ProductReceiveRecapQueryEvent {
  const factory ProductReceiveRecapQueryEvent.fetch({
    required DateTime periodStart,
    required DateTime periodEnd,
    required Product product,
    required List<Warehouse> warehouseIn,
    PageOptions<ProductReceiveRecap>? pageOptions,
  }) = _Fetch;
}

class ProductReceiveRecapQueryBloc
    extends Bloc<ProductReceiveRecapQueryEvent, ProductReceiveRecapQueryState> {
  ProductReceiveRecapQueryBloc() : super(const _Initial()) {
    on<ProductReceiveRecapQueryEvent>((event, emit) async {
      await event.when(
        fetch:
            (periodStart, periodEnd, product, warehouseIn, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await ProductReceiveRecapRepository.instance
                .productReturnReceiveReportFetch(
              accessToken: UserRepositoryApp.instance.token!,
              periodStart: periodStart,
              periodEnd: periodEnd,
              product: product,
              warehouseIn: warehouseIn,
              pageOptions: _pageOptions,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductReceiveRecap> _pageOptions = PageOptions.empty(
    sortBy: 'created_at',
  );
}
