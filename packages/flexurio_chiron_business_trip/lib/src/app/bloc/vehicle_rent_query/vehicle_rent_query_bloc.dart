import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_rent_query_bloc.freezed.dart';

@freezed
class VehicleRentQueryState with _$VehicleRentQueryState {
  const factory VehicleRentQueryState.initial() = _Initial;
  const factory VehicleRentQueryState.loading(
    PageOptions<VehicleRent> vehicles,
  ) = _Loading;
  const factory VehicleRentQueryState.loaded(
    List<Employee> employees,
    PageOptions<VehicleRent> vehicles,
  ) = _Loaded;
  const factory VehicleRentQueryState.error(String message) = _Error;
}

@freezed
class VehicleRentQueryEvent with _$VehicleRentQueryEvent {
  const factory VehicleRentQueryEvent.fetch({
    PageOptions<VehicleRent>? pageOptions,
    Vehicle? vehicle,
    String? status,
    DateTime? scheduleStart,
    DateTime? scheduleEnd,
  }) = _Fetch;
}

class VehicleRentQueryBloc
    extends Bloc<VehicleRentQueryEvent, VehicleRentQueryState> {
  VehicleRentQueryBloc() : super(const _Initial()) {
    on<VehicleRentQueryEvent>((event, emit) async {
      await event.when(
        fetch:
            (pageOptions, vehicle, status, scheduleStart, scheduleEnd) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            final employee = await EmployeeRepository.fetch(
              UserRepositoryApp.instance.token!,
            );

            _pageOptions = await PurchasingRepository.instance.vehicleRentFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              vehicle: vehicle,
              status: status,
              scheduleStart: scheduleStart,
              scheduleEnd: scheduleEnd,
            );
            emit(_Loaded(employee, _pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<VehicleRent> _pageOptions = PageOptions.empty();
}
