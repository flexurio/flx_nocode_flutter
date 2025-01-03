import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'vehicle_rent_bloc.freezed.dart';

@freezed
class VehicleRentState with _$VehicleRentState {
  const factory VehicleRentState.initial({
    required List<LatLng> destination,
    VehicleRentFormHeader? vehicleRentFormHeader,
  }) = _Initial;
  const factory VehicleRentState.loading() = _Loading;
  const factory VehicleRentState.success() = _Success;
  const factory VehicleRentState.error(String error) = _Error;
}

@freezed
class VehicleRentEvent with _$VehicleRentEvent {
  const factory VehicleRentEvent.create() = _Create;
  const factory VehicleRentEvent.createHeaderToLocal({
    required VehicleRentFormHeader vehicleRentFormHeader,
  }) = _CreateHeaderToLocal;
  const factory VehicleRentEvent.addDestinationToLocal({
    required LatLng destination,
  }) = _AddDestinationToLocal;
  const factory VehicleRentEvent.addAllDestinationToLocal({
    required List<LatLng> destinations,
    VehicleRentFormHeader? vehicleRentFormHeader,
  }) = _AddAllDestinationToLocal;
  const factory VehicleRentEvent.updateHeader({
    required VehicleRentFormHeader vehicleRentFormHeader,
  }) = _UpdateHeader;
  const factory VehicleRentEvent.approveManager({
    required VehicleRent vehicleRent,
  }) = _ApproveManager;
  const factory VehicleRentEvent.rejectManager({
    required VehicleRent vehicleRent,
    required String reason,
  }) = _RejectManager;
  const factory VehicleRentEvent.approveCs({
    required VehicleRent vehicleRent,
    required int driverId,
    required Vehicle vehicle,
  }) = _ApproveCs;
  const factory VehicleRentEvent.rejectCs({
    required VehicleRent vehicleRent,
    required String reason,
  }) = _RejectCs;
  const factory VehicleRentEvent.updateActualStart({
    required VehicleRent vehicleRent,
    required DateTime startDate,
    required double actualKilometer,
    required int fuelBar,
    required String vehicleCheckNote,
    required List<PlatformFile> attachments,
  }) = _UpdateActualStart;
  const factory VehicleRentEvent.updateActualEnd({
    required VehicleRent vehicleRent,
    required DateTime endDate,
    required double actualKilometer,
    required int fuelBar,
    required String vehicleCheckNote,
    required List<PlatformFile> attachments,
  }) = _UpdateActualEnd;
  const factory VehicleRentEvent.updateDestinations({
    required VehicleRentFormHeader vehicleRentFormHeader,
    required List<LatLng> destinations,
  }) = _UpdateDestinations;
  const factory VehicleRentEvent.fetchById({
    required VehicleRentFormHeader header,
  }) = _FetchById;
  const factory VehicleRentEvent.remove(LatLng destination) = _Remove;
  const factory VehicleRentEvent.delete(VehicleRent vehicleRent) = _Delete;
}

class VehicleRentBloc extends Bloc<VehicleRentEvent, VehicleRentState> {
  VehicleRentBloc() : super(const _Initial(destination: [])) {
    on<VehicleRentEvent>((event, emit) async {
      await event.when(
        createHeaderToLocal: (form) async {
          _vehicleRentFormHeader = form;
          emit(
            _Initial(
              vehicleRentFormHeader: _vehicleRentFormHeader,
              destination: _destinations,
            ),
          );
        },
        addDestinationToLocal: (destination) async {
          emit(const _Loading());
          try {
            _destinations.add(destination);

            final destinations = List<LatLng>.from(_destinations);
            emit(
              _Initial(
                vehicleRentFormHeader: _vehicleRentFormHeader,
                destination: destinations,
              ),
            );
          } catch (e) {
            return null;
          }
        },
        addAllDestinationToLocal:
            (initialDestinations, vehicleRentFormHeader) async {
          emit(const _Loading());
          try {
            _vehicleRentFormHeader = vehicleRentFormHeader;
            final lenDestination = initialDestinations.length;
            for (var i = 0; i < lenDestination; i++) {
              _destinations.add(initialDestinations[i]);
            }

            final destinations = List<LatLng>.from(_destinations);
            emit(
              _Initial(
                vehicleRentFormHeader: _vehicleRentFormHeader,
                destination: destinations,
              ),
            );
          } catch (e) {
            return null;
          }
        },
        remove: (destination) {
          _destinations.removeWhere((element) => element == destination);
          final destinations = List<LatLng>.from(_destinations);
          emit(
            _Initial(
              vehicleRentFormHeader: _vehicleRentFormHeader,
              destination: destinations,
            ),
          );
        },
        create: () async {
          emit(const _Loading());
          try {
            final dataPoint =
                '[${_destinations.map((e) => '(${e.latitude},${e.longitude})').toList().join(',')}]';
            await PurchasingRepository.instance.vehicleRentCreate(
              accessToken: UserRepositoryApp.instance.token!,
              driverId: _vehicleRentFormHeader!.driver ?? null,
              vehicle: _vehicleRentFormHeader!.vehicle ?? null,
              userId: _vehicleRentFormHeader!.user!,
              description: _vehicleRentFormHeader!.description!,
              totalCost: _vehicleRentFormHeader!.totalCost!,
              department: _vehicleRentFormHeader!.department!,
              startDate: _vehicleRentFormHeader!.startDate!,
              endDate: _vehicleRentFormHeader!.endDate!,
              points: dataPoint,
              type: _vehicleRentFormHeader!.type!.type,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        updateHeader: (vehicleRentFormHeader) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.vehicleRentUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              id: vehicleRentFormHeader.id!,
              driverId: vehicleRentFormHeader.driver ?? null,
              vehicle: vehicleRentFormHeader.vehicle ?? null,
              userId: vehicleRentFormHeader.user!,
              description: vehicleRentFormHeader.description!,
              totalCost: vehicleRentFormHeader.totalCost!,
              department: vehicleRentFormHeader.department!,
              startDate: vehicleRentFormHeader.startDate!,
              endDate: vehicleRentFormHeader.endDate!,
              points: vehicleRentFormHeader.point!,
              type: vehicleRentFormHeader.type!.type,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        approveManager: (vehicleRent) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.vehicleRentApproveManager(
              accessToken: UserRepositoryApp.instance.token!,
              vehicleRent: vehicleRent,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        rejectManager: (vehicleRent, reason) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.vehicleRentRejectManager(
              accessToken: UserRepositoryApp.instance.token!,
              vehicleRent: vehicleRent,
              reason: reason,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        approveCs: (vehicleRent, driverId, vehicle) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.vehicleRentApproveCS(
              accessToken: UserRepositoryApp.instance.token!,
              vehicleRent: vehicleRent,
              driverId: driverId,
              vehicleRegistrationNumber: vehicle.vehicleRegistrationNumber,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        rejectCs: (vehicleRent, reason) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.vehicleRentRejectCS(
              accessToken: UserRepositoryApp.instance.token!,
              vehicleRent: vehicleRent,
              reason: reason,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        updateActualStart: (vehicleRent, startDate, actualKilometer, fuelBar,
            vehicleCheckNote, attachments) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance
                .vehicleRentActualStartDateUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              vehicleRent: vehicleRent,
              startDate: startDate,
              kiloMeter: actualKilometer,
              fuelBar: fuelBar,
              vehicleCheckNote: vehicleCheckNote,
              attachments: attachments,
            );
            emit(const _Success());
          } catch (error, stack) {
            print(stack);
            emit(_Error(errorMessage(error)));
          }
        },
        updateActualEnd: (vehicleRent, endDate, actualKilometer, fuelBar,
            vehicleCheckNote, attachments) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.vehicleRentActualEndDateUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              vehicleRent: vehicleRent,
              endDate: endDate,
              kiloMeter: actualKilometer,
              fuelBar: fuelBar,
              vehicleCheckNote: vehicleCheckNote,
              attachments: attachments,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        updateDestinations: (vehicleRentFormHeader, destination) async {
          emit(const _Loading());
          try {
            late var dataPoint = '';
            final destinationLen = destination.length;
            for (var index = 0; index < destinationLen; index++) {
              final item = destination[index];
              if (index == 0) {
                dataPoint += '[(${item.latitude},${item.longitude}),';
              } else if (destinationLen - 1 == index) {
                dataPoint += '(${item.latitude},${item.longitude})]';
              } else {
                dataPoint += '(${item.latitude},${item.longitude}),';
              }
            }
            await PurchasingRepository.instance.vehicleRentUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              id: vehicleRentFormHeader.id!,
              driverId: vehicleRentFormHeader.driver ?? null,
              vehicle: vehicleRentFormHeader.vehicle ?? null,
              userId: vehicleRentFormHeader.user!,
              description: vehicleRentFormHeader.description!,
              totalCost: vehicleRentFormHeader.totalCost!,
              department: vehicleRentFormHeader.department!,
              startDate: vehicleRentFormHeader.startDate!,
              endDate: vehicleRentFormHeader.endDate!,
              type: vehicleRentFormHeader.type!.type,
              points: dataPoint,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetchById: (header) async {
          emit(const _Loading());
          try {
            final data =
                await PurchasingRepository.instance.vehicleRentFetchById(
              accessToken: UserRepositoryApp.instance.token!,
              vehicleRent: header,
            );
            _vehicleRentFormHeader = VehicleRentFormHeader(
              point: header.point,
              id: data.id,
              driver: data.driverId,
              vehicle: data.vehicle,
              user: data.userId,
              description: data.description,
              totalCost: data.totalCost,
              department: data.department,
              startDate: data.scheduledStartDate,
              endDate: data.scheduledEndDate,
              costPerKilometer: data.costPerKilometer,
              initialKilometer: data.initialKilometer,
              finalKilometer: data.finalKilometer,
              type: data.type,
            );

            final destinations = List<LatLng>.from(
              data.point!
                  .replaceAll('[(', '')
                  .replaceAll(')]', '')
                  .replaceAll(',(', '')
                  .split(')')
                  .map(
                    (e) => LatLng(
                      double.parse(e.split(',')[0]),
                      double.parse(e.split(',')[1]),
                    ),
                  )
                  .toList(),
            );

            emit(
              _Initial(
                vehicleRentFormHeader: _vehicleRentFormHeader,
                destination: destinations,
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (vehicleRent) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.vehicleRentDelete(
              accessToken: UserRepositoryApp.instance.token!,
              vehicleRent: vehicleRent,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }

  final List<LatLng> _destinations = [];
  VehicleRentFormHeader? _vehicleRentFormHeader;
}
