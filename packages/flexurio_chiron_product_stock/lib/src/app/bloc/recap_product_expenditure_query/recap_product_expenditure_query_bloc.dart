import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/recap_product_expenditure.dart';
import 'package:flexurio_chiron_product_stock/src/app/resource/product_return.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recap_product_expenditure_query_bloc.freezed.dart';

@freezed
class RecapProductExpenditureQueryState
    with _$RecapProductExpenditureQueryState {
  const factory RecapProductExpenditureQueryState.initial() = _Initial;
  const factory RecapProductExpenditureQueryState.loading(
    PageOptions<RecapProductExpenditure> pageOptions,
  ) = _Loading;
  const factory RecapProductExpenditureQueryState.loaded(
    PageOptions<RecapProductExpenditure> pageOptions,
  ) = _Loaded;
  const factory RecapProductExpenditureQueryState.error(
    String error,
  ) = _Error;
}

@freezed
class RecapProductExpenditureQueryEvent
    with _$RecapProductExpenditureQueryEvent {
  const factory RecapProductExpenditureQueryEvent.fetch({
    required DateTime dateStart,
    required DateTime dateEnd,
    required Division division,
    required RecapProductExpenditureWarehouse warehouse,
    PageOptions<RecapProductExpenditure>? pageOptions,
  }) = _Fetch;
}

class RecapProductExpenditureQueryBloc extends Bloc<
    RecapProductExpenditureQueryEvent, RecapProductExpenditureQueryState> {
  RecapProductExpenditureQueryBloc() : super(const _Initial()) {
    on<RecapProductExpenditureQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          DateTime dateStart,
          DateTime dateEnd,
          Division division,
          RecapProductExpenditureWarehouse warehouse,
          PageOptions<RecapProductExpenditure>? pageOptions,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await ProductReturnRepository.instance.fetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              dateStart: dateStart,
              dateEnd: dateEnd,
              division: division,
              warehouse: warehouse,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<RecapProductExpenditure> _pageOptions = PageOptions.empty();
}
