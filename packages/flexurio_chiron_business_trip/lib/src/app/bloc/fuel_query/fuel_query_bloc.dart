import 'package:flexurio_chiron_business_trip/src/app/model/fuel.dart';
import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fuel_query_bloc.freezed.dart';

@freezed
class FuelQueryState with _$FuelQueryState {
  const factory FuelQueryState.initial() = _Initial;
  const factory FuelQueryState.loading() = _Loading;
  const factory FuelQueryState.loaded(
    List<Fuel> fuels,
  ) = _Loaded;
  const factory FuelQueryState.error(String message) = _Error;
}

@freezed
class FuelQueryEvent with _$FuelQueryEvent {
  const factory FuelQueryEvent.fetch() = _Fetch;
  const factory FuelQueryEvent.fetchCurrentPeriod() = _FetchCurrentPeriod;
  const factory FuelQueryEvent.historyFetch({
    required Fuel fuel,
  }) = _HistoryFetch;
}

class FuelQueryBloc extends Bloc<FuelQueryEvent, FuelQueryState> {
  FuelQueryBloc() : super(const _Initial()) {
    on<FuelQueryEvent>((event, emit) async {
      await event.when(
        fetch: () async {
          emit(const _Loading());
          try {
            final fuels = await PurchasingRepository.instance.fuelFetch(
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(
              _Loaded(
                fuels,
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetchCurrentPeriod: () async {
          emit(const _Loading());
          try {
            final fuels =
                await PurchasingRepository.instance.fuelFetchCurrentPeriod(
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(
              _Loaded(
                fuels,
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        historyFetch: (fuel) async {
          emit(const _Loading());
          try {
            final fuels = await PurchasingRepository.instance.fuelHistoryFetch(
              accessToken: UserRepositoryApp.instance.token!,
              fuel: fuel,
            );
            emit(
              _Loaded(
                fuels,
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
