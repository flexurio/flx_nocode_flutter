import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_unit_query_bloc.freezed.dart';

@freezed
class MaterialUnitQueryState with _$MaterialUnitQueryState {
  const factory MaterialUnitQueryState.initial() = _Initial;
  const factory MaterialUnitQueryState.loading(
    PageOptions<MaterialUnit> pageOptions,
  ) = _Loading;
  const factory MaterialUnitQueryState.loaded(
    PageOptions<MaterialUnit> pageOptions,
  ) = _Loaded;
  const factory MaterialUnitQueryState.error(String error) = _Error;
}

@freezed
class MaterialUnitQueryEvent with _$MaterialUnitQueryEvent {
  const factory MaterialUnitQueryEvent.fetch({
    PageOptions<MaterialUnit>? pageOptions,
  }) = _Fetch;
}

class MaterialUnitQueryBloc
    extends Bloc<MaterialUnitQueryEvent, MaterialUnitQueryState> {
  MaterialUnitQueryBloc() : super(const _Initial()) {
    on<MaterialUnitQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions = await MaterialRepository.instance.materialUnitFetch(
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
  PageOptions<MaterialUnit> _pageOptions = PageOptions.empty();
}
