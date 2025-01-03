import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/recap_expired_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/recap_product_expenditure.dart';
import 'package:flexurio_chiron_product_stock/src/app/resource/product_return.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recap_expired_product_query_bloc.freezed.dart';

@freezed
class RecapExpiredProductQueryState with _$RecapExpiredProductQueryState {
  const factory RecapExpiredProductQueryState.initial() = _Initial;
  const factory RecapExpiredProductQueryState.loading(
    PageOptions<RecapExpiredProduct> pageOptions,
  ) = _Loading;
  const factory RecapExpiredProductQueryState.loaded(
    PageOptions<RecapExpiredProduct> pageOptions,
  ) = _Loaded;
  const factory RecapExpiredProductQueryState.error(
    String error,
  ) = _Error;
}

@freezed
class RecapExpiredProductQueryEvent with _$RecapExpiredProductQueryEvent {
  const factory RecapExpiredProductQueryEvent.fetch({
    required DateTime dateExpired,
    required Product? product,
    required Division division,
    PageOptions<RecapExpiredProduct>? pageOptions,
  }) = _Fetch;
}

class RecapExpiredProductQueryBloc
    extends Bloc<RecapExpiredProductQueryEvent, RecapExpiredProductQueryState> {
  RecapExpiredProductQueryBloc() : super(const _Initial()) {
    on<RecapExpiredProductQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          DateTime dateExpired,
          Product? product,
          Division division,
          PageOptions<RecapExpiredProduct>? pageOptions,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await ProductReturnRepository.instance.fetchRecapExpiredProduct(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              dateExpired: dateExpired,
              productId: product?.id,
              division: division,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<RecapExpiredProduct> _pageOptions = PageOptions.empty();
}
