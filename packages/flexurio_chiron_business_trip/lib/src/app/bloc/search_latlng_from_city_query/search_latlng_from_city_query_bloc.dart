import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'search_latlng_from_city_query_bloc.freezed.dart';

@freezed
class SearchLatLongFromCityQueryState with _$SearchLatLongFromCityQueryState {
  const factory SearchLatLongFromCityQueryState.initial() = _Initial;
  const factory SearchLatLongFromCityQueryState.loading() = _Loading;
  const factory SearchLatLongFromCityQueryState.loaded(
    LatLng latlng,
  ) = _Loaded;
  const factory SearchLatLongFromCityQueryState.error(String message) = _Error;
}

@freezed
class SearchLatLongFromCityQueryEvent with _$SearchLatLongFromCityQueryEvent {
  const factory SearchLatLongFromCityQueryEvent.fetch({
    required String city,
  }) = _Fetch;
}

class SearchLatLongFromCityQueryBloc extends Bloc<
    SearchLatLongFromCityQueryEvent, SearchLatLongFromCityQueryState> {
  SearchLatLongFromCityQueryBloc() : super(const _Initial()) {
    on<SearchLatLongFromCityQueryEvent>((event, emit) async {
      await event.when(
        fetch: (city) async {
          emit(const _Loading());
          try {
            final latLng =
                await PurchasingRepository.instance.cekAddressByCityFetch(
              city: city,
            );
            emit(
              _Loaded(
                latLng,
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
