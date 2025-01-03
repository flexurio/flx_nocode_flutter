import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/src/app/model/production_order.dart';
import 'package:flexurio_chiron_production/src/app/resource/production_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'production_order_query_bloc.freezed.dart';

@freezed
class ProductionOrderQueryState with _$ProductionOrderQueryState {
  const factory ProductionOrderQueryState.initial() = _Initial;
  const factory ProductionOrderQueryState.loading(
    PageOptions<ProductionOrder> pageOptions,
  ) = _Loading;
  const factory ProductionOrderQueryState.loaded(
    PageOptions<ProductionOrder> pageOptions,
  ) = _Success;
  const factory ProductionOrderQueryState.error(String error) = _Error;
}

@freezed
class ProductionOrderQueryEvent with _$ProductionOrderQueryEvent {
  const factory ProductionOrderQueryEvent.fetch({
    Product? product,
    PageOptions<ProductionOrder>? pageOptions,
    bool? isCancel,
    DateTime? periodStart,
    DateTime? periodEnd,
  }) = _Fetch;
}

class ProductionOrderQueryBloc
    extends Bloc<ProductionOrderQueryEvent, ProductionOrderQueryState> {
  ProductionOrderQueryBloc({required this.isExternal, bool? pagination})
      : super(const _Initial()) {
    on<ProductionOrderQueryEvent>((event, emit) async {
      await event.when(
        fetch: (product, pageOptions, isCancel, periodStart, periodEnd) async {
          if (pagination == false) {
            _pageOptions = PageOptions.emptyNoLimit();
          }
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions =
                await ProductionOrderRepository.instance.productionOrderFetch(
              accessToken: UserRepositoryApp.instance.token!,
              product: product,
              periodStart: periodStart,
              periodEnd: periodEnd,
              pageOptions: _pageOptions,
              isCancel: isCancel,
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
  final bool isExternal;
  PageOptions<ProductionOrder> _pageOptions = PageOptions.empty();
}
