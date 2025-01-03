import 'package:flexurio_chiron_material_stock/src/app/model/material_retest.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_retest_query_bloc.freezed.dart';

@freezed
abstract class MaterialRetestQueryState with _$MaterialRetestQueryState {
  const factory MaterialRetestQueryState.initial() = _Initial;
  const factory MaterialRetestQueryState.loading(
    PageOptions<MaterialRetest> pageOptions,
  ) = _Loading;
  const factory MaterialRetestQueryState.loaded(
    PageOptions<MaterialRetest> pageOptions,
  ) = _Loaded;
  const factory MaterialRetestQueryState.error(String error) = _Error;
}

@freezed
abstract class MaterialRetestQueryEvent with _$MaterialRetestQueryEvent {
  const factory MaterialRetestQueryEvent.fetch({
    PageOptions<MaterialRetest>? pageOptions,
    MaterialGroup? materialGroup,
    Material? material,
    String? na,
    String? status,
  }) = _Fetch;
}

class MaterialRetestQueryBloc
    extends Bloc<MaterialRetestQueryEvent, MaterialRetestQueryState> {
  MaterialRetestQueryBloc() : super(const _Initial()) {
    on<MaterialRetestQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          pageOptions,
          materialGroup,
          material,
          na,
          status,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions =
                await MaterialRepository.instance.materialRetestFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              materialGroup: materialGroup,
              material: material,
              na: na,
              status: status,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MaterialRetest> _pageOptions = PageOptions.empty();
}
