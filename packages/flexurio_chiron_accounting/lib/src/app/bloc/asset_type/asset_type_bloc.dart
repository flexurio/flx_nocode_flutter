import 'package:flexurio_chiron_accounting/src/app/model/asset_type.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'asset_type_bloc.freezed.dart';

@freezed
class AssetTypeState with _$AssetTypeState {
  factory AssetTypeState.initial() = _Initial;
  factory AssetTypeState.loading() = _Loading;
  factory AssetTypeState.success() = _Success;
  factory AssetTypeState.error(String error) = _Error;
}

@freezed
class AssetTypeEvent with _$AssetTypeEvent {
  factory AssetTypeEvent.create({
    required String id,
    required String name,
    required int amountOfDepreciation,
    ChartOfAccountNumber? coa,
    ChartOfAccountNumber? coaInvoice,
    ChartOfAccountNumber? coaAccumulation,
  }) = _Create;
  factory AssetTypeEvent.update({
    required AssetType assetType,
    required String name,
    required int amountOfDepreciation,
    ChartOfAccountNumber? coa,
    ChartOfAccountNumber? coaInvoice,
    ChartOfAccountNumber? coaAccumulation,
  }) = _Update;
  factory AssetTypeEvent.delete({
    required String id,
  }) = _Delete;
}

class AssetTypeBloc extends Bloc<AssetTypeEvent, AssetTypeState> {
  AssetTypeBloc() : super(_Initial()) {
    on<AssetTypeEvent>(
      (event, emit) async {
        await event.when(
          create: (
            id,
            name,
            amountOfDepreciation,
            coa,
            coaInvoice,
            coaAccumulation,
          ) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.assetTypeCreate(
                id: id,
                name: name,
                amountOfDepreciation: amountOfDepreciation,
                coa: coa,
                coaAccumulation: coaAccumulation,
                coaInvoice: coaInvoice,
                accessToken: UserRepositoryApp.instance.token!,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          update: (
            assetType,
            name,
            amountOfDepreciation,
            coa,
            coaInvoice,
            coaAccumulation,
          ) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.assetTypeUpdate(
                assetType: assetType,
                name: name,
                amountOfDepreciation: amountOfDepreciation,
                coa: coa,
                coaAccumulation: coaAccumulation,
                coaInvoice: coaInvoice,
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
              await AccountingRepository.instance.assetTypeDelete(
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
