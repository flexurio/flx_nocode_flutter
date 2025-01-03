import 'package:flexurio_chiron_business_trip/src/app/model/vehicle.dart';
import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_query_bloc.freezed.dart';

@freezed
class VehicleQueryState with _$VehicleQueryState {
  const factory VehicleQueryState.initial() = _Initial;
  const factory VehicleQueryState.loading(
    PageOptions<Vehicle> vehicles,
  ) = _Loading;
  const factory VehicleQueryState.loaded(
    PageOptions<Vehicle> vehicles,
  ) = _Loaded;
  const factory VehicleQueryState.error(String message) = _Error;
}

@freezed
class VehicleQueryEvent with _$VehicleQueryEvent {
  const factory VehicleQueryEvent.fetch({
    PageOptions<Vehicle>? pageOptions,
    bool? isActive,
  }) = _Fetch;
}

class VehicleQueryBloc extends Bloc<VehicleQueryEvent, VehicleQueryState> {
  VehicleQueryBloc() : super(const _Initial()) {
    on<VehicleQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, isActive) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions = await PurchasingRepository.instance.vehicleFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              isActive: isActive,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<Vehicle> _pageOptions = PageOptions.empty();
}
