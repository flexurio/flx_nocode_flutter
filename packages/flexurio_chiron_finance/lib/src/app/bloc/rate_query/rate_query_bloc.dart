import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_finance/src/app/model/rate.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'rate_query_bloc.freezed.dart';

@freezed
class RateQueryState with _$RateQueryState {
  const factory RateQueryState.initial() = _Initial;
  const factory RateQueryState.loading(
    PageOptions<Rate> pageOptions,
  ) = _Loading;
  const factory RateQueryState.loaded(
    PageOptions<Rate> pageOptions,
  ) = _Loaded;
  const factory RateQueryState.error(String error) = _Error;
}

@freezed
class RateQueryEvent with _$RateQueryEvent {
  const factory RateQueryEvent.fetch({
    PageOptions<Rate>? pageOptions,
    Currency? currency,
  }) = _Fetch;
}

class RateQueryBloc extends Bloc<RateQueryEvent, RateQueryState> {
  RateQueryBloc() : super(const _Initial()) {
    on<RateQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: (pageOptions, currency) async {
            emit(_Loading(_pageOptions));
            try {
              if (pageOptions != null) {
                _pageOptions = pageOptions;
              }

              _pageOptions = await AccountingRepository.instance.rateFetch(
                accessToken: UserRepositoryApp.instance.token!,
                currency: currency,
                pageOptions: _pageOptions,
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
  PageOptions<Rate> _pageOptions = PageOptions.empty();
}
