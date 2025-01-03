import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/resource/product_receive.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_receive_detail_query_bloc.freezed.dart';

@freezed
class ProductReceiveDetailQueryState with _$ProductReceiveDetailQueryState {
  const factory ProductReceiveDetailQueryState.initial() = _Initial;
  const factory ProductReceiveDetailQueryState.loading(
    PageOptions<ProductReceiveDetail> pageOptions,
  ) = _Loading;
  const factory ProductReceiveDetailQueryState.loaded(
    PageOptions<ProductReceiveDetail> pageOptions,
  ) = _Success;
  const factory ProductReceiveDetailQueryState.error(String error) = _Error;
}

@freezed
class ProductReceiveDetailQueryEvent with _$ProductReceiveDetailQueryEvent {
  const factory ProductReceiveDetailQueryEvent.fetch({
    PageOptions<ProductReceiveDetail>? pageOptions,
    ProductReceive? productReceive,
    String? status,
  }) = _Fetch;
  const factory ProductReceiveDetailQueryEvent.print({
    required List<Warehouse> warehouseIn,
    PageOptions<ProductReceiveDetail>? pageOptions,
    Product? product,
    DateTime? createdAtGte,
    DateTime? createdAtLte,
  }) = _Print;
}

class ProductReceiveDetailQueryBloc extends Bloc<ProductReceiveDetailQueryEvent,
    ProductReceiveDetailQueryState> {
  final bool isExternal;
  ProductReceiveDetailQueryBloc({
    required this.isExternal,
  }) : super(const _Initial()) {
    on<ProductReceiveDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, productReceive, status) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            if (status != null) {
              _status = status;
            }
            _pageOptions = await ProductReceiveRepository.instance
                .productReceiveDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              productReceive: productReceive,
              status: _status,
              isExternal: isExternal,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        print: (
          warehouseIn,
          pageOptions,
          product,
          createdAtGte,
          createdAtLte,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await ProductReceiveRepository.instance
                .productReceiveDetailPrintFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              warehouseIn: warehouseIn,
              productId: product?.id,
              createdAtGte: createdAtGte,
              createdAtLte: createdAtLte,
              isExternal: isExternal,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductReceiveDetail> _pageOptions = PageOptions.empty();
  String? _status;
}
