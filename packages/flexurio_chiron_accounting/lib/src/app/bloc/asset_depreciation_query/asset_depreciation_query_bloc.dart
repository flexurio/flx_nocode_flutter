import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_depreciation.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/asset.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_depreciation_query_bloc.freezed.dart';

@freezed
class AssetDepreciationQueryState with _$AssetDepreciationQueryState {
  const factory AssetDepreciationQueryState.initial() = _Initial;
  const factory AssetDepreciationQueryState.loading(
    PageOptions<AssetDepreciation> pageOptions,
  ) = _Loading;
  const factory AssetDepreciationQueryState.loaded(
    PageOptions<AssetDepreciation> pageOptions,
  ) = _Loaded;
  const factory AssetDepreciationQueryState.error(String error) = _Error;
}

@freezed
class AssetDepreciationQueryEvent with _$AssetDepreciationQueryEvent {
  const factory AssetDepreciationQueryEvent.fetch({
    PageOptions<AssetDepreciation>? pageOptions,
    Supplier? supplier,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

class AssetDepreciationQueryBloc
    extends Bloc<AssetDepreciationQueryEvent, AssetDepreciationQueryState> {
  AssetDepreciationQueryBloc() : super(const _Initial()) {
    on<AssetDepreciationQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, supplier, startDate, endDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await AssetRepository.instance.depreciationFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<AssetDepreciation> _pageOptions = PageOptions.empty(
    sortBy: 'remark',
  );
}
