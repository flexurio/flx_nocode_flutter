import 'package:flexurio_chiron_accounting/src/app/model/asset_location.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'asset_location_query_bloc.freezed.dart';

@freezed
class AssetLocationQueryState with _$AssetLocationQueryState {
  factory AssetLocationQueryState.initial() = _Initial;
  factory AssetLocationQueryState.loading(
    PageOptions<AssetLocation> pageOptions,
  ) = _Loading;
  factory AssetLocationQueryState.loaded(
    PageOptions<AssetLocation> pageOptions,
  ) = _Loaded;
  factory AssetLocationQueryState.error(String error) = _Error;
}

@freezed
class AssetLocationQueryEvent with _$AssetLocationQueryEvent {
  factory AssetLocationQueryEvent.fetch({
    PageOptions<AssetLocation>? pageOptions,
  }) = _Fetch;
}

class AssetLocationQueryBloc
    extends Bloc<AssetLocationQueryEvent, AssetLocationQueryState> {
  AssetLocationQueryBloc() : super(_Initial()) {
    on<AssetLocationQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: (pageOptions) async {
            emit(_Loading(_pageOptions));
            try {
              if (pageOptions != null) {
                _pageOptions = pageOptions;
              }

              _pageOptions =
                  await AccountingRepository.instance.assetLocationFetch(
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
  PageOptions<AssetLocation> _pageOptions = PageOptions.empty();
}
