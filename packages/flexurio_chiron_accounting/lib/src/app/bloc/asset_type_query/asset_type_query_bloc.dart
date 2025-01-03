import 'package:flexurio_chiron_accounting/src/app/model/asset_type.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'asset_type_query_bloc.freezed.dart';

@freezed
class AssetTypeQueryState with _$AssetTypeQueryState {
  factory AssetTypeQueryState.initial() = _Initial;
  factory AssetTypeQueryState.loading(
    PageOptions<AssetType> pageOptions,
  ) = _Loading;
  factory AssetTypeQueryState.loaded(
    PageOptions<AssetType> pageOptions,
  ) = _Loaded;
  factory AssetTypeQueryState.error(String error) = _Error;
}

@freezed
class AssetTypeQueryEvent with _$AssetTypeQueryEvent {
  factory AssetTypeQueryEvent.fetch({
    PageOptions<AssetType>? pageOptions,
  }) = _Fetch;
}

class AssetTypeQueryBloc
    extends Bloc<AssetTypeQueryEvent, AssetTypeQueryState> {
  AssetTypeQueryBloc() : super(_Initial()) {
    on<AssetTypeQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: (pageOptions) async {
            emit(_Loading(_pageOptions));
            try {
              if (pageOptions != null) {
                _pageOptions = pageOptions;
              }

              _pageOptions = await AccountingRepository.instance.assetTypeFetch(
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
  PageOptions<AssetType> _pageOptions = PageOptions.empty();
}
