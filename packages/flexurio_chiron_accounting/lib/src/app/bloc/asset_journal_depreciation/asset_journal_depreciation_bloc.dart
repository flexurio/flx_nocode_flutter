import 'package:flexurio_chiron_accounting/src/app/model/asset_journal_depreciation.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/asset_journal_depreciation.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'asset_journal_depreciation_bloc.freezed.dart';

@freezed
class AssetJournalDepreciationState with _$AssetJournalDepreciationState {
  factory AssetJournalDepreciationState.initial() = _Initial;
  factory AssetJournalDepreciationState.loading() = _Loading;
  factory AssetJournalDepreciationState.success() = _Success;
  factory AssetJournalDepreciationState.error(String error) = _Error;
}

@freezed
class AssetJournalDepreciationEvent with _$AssetJournalDepreciationEvent {
  factory AssetJournalDepreciationEvent.create({
    required DateTime periodStart,
    required DateTime periodEnd,
  }) = _Create;
  factory AssetJournalDepreciationEvent.delete({
    required AssetJournalDepreciation assetJournalDepreciation,
  }) = _Delete;
}

class AssetJournalDepreciationBloc extends Bloc<AssetJournalDepreciationEvent, AssetJournalDepreciationState> {
  AssetJournalDepreciationBloc() : super(_Initial()) {
    on<AssetJournalDepreciationEvent>(
      (event, emit) async {
        await event.when(
          create: (
            periodStart,
            periodEnd,
          ) async {
            emit(_Loading());
            try {
              await AssetJournalDepreciationRepository.instance.assetJournalDepreciationCreate(
                accessToken: UserRepositoryApp.instance.token!,
                periodStart: periodStart,
                periodEnd: periodEnd,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          delete: (assetJournalDepreciation) async {
            emit(_Loading());
            try {
              await AssetJournalDepreciationRepository.instance.assetJournalDepreciationDelete(
                accessToken: UserRepositoryApp.instance.token!,
                asset: assetJournalDepreciation,
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
