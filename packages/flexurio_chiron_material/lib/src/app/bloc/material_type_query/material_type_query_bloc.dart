import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material/src/app/model/material_type.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'material_type_query_bloc.freezed.dart';

@freezed
class MaterialTypeQueryState with _$MaterialTypeQueryState {
  const factory MaterialTypeQueryState.initial() = _Initial;
  const factory MaterialTypeQueryState.loading(
    PageOptions<MaterialType> pageOptions,
  ) = _Loading;
  const factory MaterialTypeQueryState.loaded(
    PageOptions<MaterialType> pageOptions,
  ) = _Loaded;
  const factory MaterialTypeQueryState.error(String error) = _Error;
}

@freezed
class MaterialTypeQueryEvent with _$MaterialTypeQueryEvent {
  const factory MaterialTypeQueryEvent.fetch({
    PageOptions<MaterialType>? pageOptions,
    MaterialGroup? materialGroup,
  }) = _Fetch;
}

class MaterialTypeQueryBloc
    extends Bloc<MaterialTypeQueryEvent, MaterialTypeQueryState> {
  MaterialTypeQueryBloc() : super(const _Initial()) {
    on<MaterialTypeQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, materialGroup) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions = await MaterialRepository.instance.materialTypeFetch(
              accessToken: UserRepositoryApp.instance.token!,
              materialGroup: materialGroup,
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
  PageOptions<MaterialType> _pageOptions = PageOptions.empty(
    sortBy: 'id',
    ascending: true,
  );
}
