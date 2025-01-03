import 'package:flexurio_chiron_accounting/src/app/model/asset_data.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_location.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_type.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'asset_data_bloc.freezed.dart';

@freezed
class AssetDataState with _$AssetDataState {
  factory AssetDataState.initial() = _Initial;
  factory AssetDataState.loading() = _Loading;
  factory AssetDataState.success() = _Success;
  factory AssetDataState.error(String error) = _Error;
}

@freezed
class AssetDataEvent with _$AssetDataEvent {
  factory AssetDataEvent.create({
    required Department department,
    required Supplier supplier,
    required AssetType assetType,
    required AssetLocation assetLocation,
    required AssetLocation assetCurrentLocation,
    required DateTime date,
    required String assetName,
    required int quantity,
    required MaterialUnit materialUnit,
    required double price,
    required String remark,
    required String serialNumber,
    String? pic,
  }) = _Create;
  factory AssetDataEvent.update({
    required AssetData assetData,
    required Department department,
    required Supplier supplier,
    required String assetName,
    required int quantity,
    required MaterialUnit materialUnit,
    required double price,
    required String remark,
    required String serialNumber,
    String? pic,
  }) = _Update;
  factory AssetDataEvent.delete({
    required String id,
  }) = _Delete;
  factory AssetDataEvent.nonActive({
    required AssetData assetData,
    required String note,
  }) = _NonActive;
  factory AssetDataEvent.moving({
    required AssetData assetData,
    required AssetLocation location,
  }) = _Moving;
}

class AssetDataBloc extends Bloc<AssetDataEvent, AssetDataState> {
  AssetDataBloc() : super(_Initial()) {
    on<AssetDataEvent>(
      (event, emit) async {
        await event.when(
          create: (
            department,
            supplier,
            assetType,
            assetLocation,
            assetCurrentLocation,
            date,
            assetName,
            quantity,
            materialUnit,
            price,
            remark,
            serialNumber,
            pic,
          ) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.assetDataCreate(
                department: department,
                supplier: supplier,
                assetType: assetType,
                assetLocation: assetLocation,
                assetCurrentLocation: assetCurrentLocation,
                date: date,
                assetName: assetName,
                quantity: quantity,
                materialUnit: materialUnit,
                price: price,
                remark: remark,
                pic: pic,
                serialNumber: serialNumber,
                accessToken: UserRepositoryApp.instance.token!,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          update: (
            assetData,
            department,
            supplier,
            assetName,
            quantity,
            materialUnit,
            price,
            remark,
            serialNumber,
            pic,
          ) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.assetDataUpdate(
                assetData: assetData,
                department: department,
                supplier: supplier,
                assetName: assetName,
                quantity: quantity,
                materialUnit: materialUnit,
                price: price,
                remark: remark,
                pic: pic,
                serialNumber: serialNumber,
                accessToken: UserRepositoryApp.instance.token!,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          delete: (id) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.assetDataDelete(
                accessToken: UserRepositoryApp.instance.token!,
                assetDataId: id,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          nonActive: (assetData, note) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.assetDataNonActive(
                accessToken: UserRepositoryApp.instance.token!,
                note: note,
                assetData: assetData,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          moving: (assetData, location) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.assetDataMoving(
                accessToken: UserRepositoryApp.instance.token!,
                assetLocation: location,
                assetData: assetData,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
}
