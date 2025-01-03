import 'package:flexurio_chiron_accounting/src/app/model/asset_journal_depreciation.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/asset_journal_depreciation.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'asset_journal_depreciation_query_bloc.freezed.dart';

@freezed
class AssetJournalDepreciationQueryState with _$AssetJournalDepreciationQueryState {
  factory AssetJournalDepreciationQueryState.initial() = _Initial;
  factory AssetJournalDepreciationQueryState.loading(
    PageOptions<AssetJournalDepreciation> pageOptions,
  ) = _Loading;
  factory AssetJournalDepreciationQueryState.loaded(
    PageOptions<AssetJournalDepreciation> pageOptions,
  ) = _Loaded;
  factory AssetJournalDepreciationQueryState.error(String error) = _Error;
}

@freezed
class AssetJournalDepreciationQueryEvent with _$AssetJournalDepreciationQueryEvent {
  factory AssetJournalDepreciationQueryEvent.fetch({
    PageOptions<AssetJournalDepreciation>? pageOptions,
  }) = _Fetch;
}

class AssetJournalDepreciationQueryBloc
    extends Bloc<AssetJournalDepreciationQueryEvent, AssetJournalDepreciationQueryState> {
  AssetJournalDepreciationQueryBloc() : super(_Initial()) {
    on<AssetJournalDepreciationQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: (pageOptions) async {
            emit(_Loading(_pageOptions));
            try {
              if (pageOptions != null) {
                _pageOptions = pageOptions;
              }

              _pageOptions =
                  await AssetJournalDepreciationRepository.instance.fetchAssetJournalDepreciation(
                accessToken: UserRepositoryApp.instance.token!,
                pageOptions: _pageOptions,
              );
              emit(
                _Loaded(_pageOptions),
              );
            } catch (error) {
              emit(
                _Error(errorMessage(error)),
              );
            }
          },
        );
      },
    );
  }
  PageOptions<AssetJournalDepreciation> _pageOptions = PageOptions.empty();
}
