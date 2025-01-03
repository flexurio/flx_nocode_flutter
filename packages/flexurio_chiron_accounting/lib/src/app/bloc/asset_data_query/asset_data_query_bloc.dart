import 'package:flexurio_chiron_accounting/src/app/model/asset_data.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'asset_data_query_bloc.freezed.dart';

@freezed
class AssetDataQueryState with _$AssetDataQueryState {
  factory AssetDataQueryState.initial() = _Initial;
  factory AssetDataQueryState.loading(
    PageOptions<AssetData> pageOptions,
  ) = _Loading;
  factory AssetDataQueryState.loaded(
    PageOptions<AssetData> pageOptions,
  ) = _Loaded;
  factory AssetDataQueryState.error(String error) = _Error;
}

@freezed
class AssetDataQueryEvent with _$AssetDataQueryEvent {
  factory AssetDataQueryEvent.fetch({
    PageOptions<AssetData>? pageOptions,
  }) = _Fetch;
}

class AssetDataQueryBloc
    extends Bloc<AssetDataQueryEvent, AssetDataQueryState> {
  AssetDataQueryBloc() : super(_Initial()) {
    on<AssetDataQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: (pageOptions) async {
            emit(_Loading(_pageOptions));
            try {
              if (pageOptions != null) {
                _pageOptions = pageOptions;
              }

              _pageOptions = await AccountingRepository.instance.assetDataFetch(
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
  PageOptions<AssetData> _pageOptions = PageOptions.empty();
}
