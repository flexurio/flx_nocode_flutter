import 'package:flexurio_chiron_product_stock/src/app/model/recap_product_stock.dart';
import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recap_product_stock_query_bloc.freezed.dart';

@freezed
class RecapProductStockQueryState with _$RecapProductStockQueryState {
  const factory RecapProductStockQueryState.initial() = _Initial;
  const factory RecapProductStockQueryState.loading() = _Loading;
  const factory RecapProductStockQueryState.loaded(
    List<RecapProductStock> recapProductStocks,
  ) = _Loaded;
  const factory RecapProductStockQueryState.error(String message) = _Error;
}

@freezed
class RecapProductStockQueryEvent with _$RecapProductStockQueryEvent {
  const factory RecapProductStockQueryEvent.fetch({
    DateTime? period,
    String? productGroupId,
    String? productId,
    String? batchId,
  }) = _Fetch;
}

class RecapProductStockQueryBloc
    extends Bloc<RecapProductStockQueryEvent, RecapProductStockQueryState> {
  RecapProductStockQueryBloc() : super(const _Initial()) {
    on<RecapProductStockQueryEvent>((event, emit) async {
      await event.when(
        fetch: (period, productGroupId, productId, batchId) async {
          emit(const _Loading());
          try {
            final productsStock =
                await ProductRepository.instance.recapProductStockFetch(
              accessToken: UserRepositoryApp.instance.token!,
              period: period,
              productGroupId: productGroupId,
              productId: productId,
              batchId: batchId,
            );
            emit(_Loaded(productsStock));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
