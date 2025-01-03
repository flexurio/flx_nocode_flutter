import 'package:flexurio_chiron_finance/src/app/bloc/currency/currency_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'currency_query_bloc.freezed.dart';

@freezed
class CurrencyQueryState with _$CurrencyQueryState {
  const factory CurrencyQueryState.initial() = _Initial;
  const factory CurrencyQueryState.loading(
    PageOptions<Currency> pageOptions,
  ) = _Loading;
  const factory CurrencyQueryState.loaded(
    PageOptions<Currency> pageOptions,
  ) = _Loaded;
  const factory CurrencyQueryState.error(String message) = _Error;
}

@freezed
class CurrencyQueryEvent with _$CurrencyQueryEvent {
  const factory CurrencyQueryEvent.fetch({
    PageOptions<Currency>? pageOptions,
  }) = _Fetch;
  const factory CurrencyQueryEvent.addOfflineData({
    required Currency currency,
  }) = _AddOfflineData;
}

class CurrencyQueryBloc
    extends HydratedBloc<CurrencyQueryEvent, CurrencyQueryState> {
  CurrencyQueryBloc() : super(const _Initial()) {
    on<CurrencyQueryEvent>((event, emit) async {
      await event.when(
        addOfflineData: (currency) async {
          emit(_Loading(_pageOptions));
          _pageOptions = _pageOptions.copyWith(
            data: List.from(_pageOptions.data)..add(currency),
          );
          emit(_Loaded(_pageOptions));
        },
        fetch: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            await offlineActionHandler(
              () async {
                _pageOptions =
                    await AccountingRepository.instance.currencyFetch(
                  accessToken: UserRepositoryApp.instance.token!,
                  pageOptions: _pageOptions,
                );
              },
              whenOffline: (request, dateTime) {
                print('offline  sss');
              },
            );

            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<Currency> _pageOptions = PageOptions.empty();

  @override
  CurrencyQueryState? fromJson(Map<String, dynamic> json) {
    if (json.containsKey('data')) {
      final userId = UserRepositoryApp.instance.user?.id;
      final data = (json['data-$userId'] as List)
          .map((e) => Currency.fromJson(e))
          .toList();
      final pageOptions = PageOptions<Currency>.empty()
          .copyWith(data: data, totalRows: data.length);
      return _Loaded(pageOptions);
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(CurrencyQueryState state) {
    if (state is _Loaded) {
      final userId = UserRepositoryApp.instance.user?.id;
      return {
        'data-$userId': state.pageOptions.data.map((e) => e.toJson()).toList(),
      };
    }
    return null;
  }
}
