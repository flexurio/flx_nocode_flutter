import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'asset_location_bloc.freezed.dart';

@freezed
class AssetLocationState with _$AssetLocationState {
  factory AssetLocationState.initial() = _Initial;
  factory AssetLocationState.loading() = _Loading;
  factory AssetLocationState.success() = _Success;
  factory AssetLocationState.error(String error) = _Error;
}

@freezed
class AssetLocationEvent with _$AssetLocationEvent {
  factory AssetLocationEvent.create({
    required String id,
    required String name,
  }) = _Create;
  factory AssetLocationEvent.delete({
    required String id,
  }) = _Delete;
}

class AssetLocationBloc extends Bloc<AssetLocationEvent, AssetLocationState> {
  AssetLocationBloc() : super(_Initial()) {
    on<AssetLocationEvent>(
      (event, emit) async {
        await event.when(
          create: (
            id,
            name,
          ) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.assetLocationCreate(
                id: id,
                name: name,
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
              await AccountingRepository.instance.assetLocationDelete(
                accessToken: UserRepositoryApp.instance.token!,
                id: id,
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
