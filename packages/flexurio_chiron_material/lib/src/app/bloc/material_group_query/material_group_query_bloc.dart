import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_group_query_bloc.freezed.dart';

@freezed
class MaterialGroupQueryState with _$MaterialGroupQueryState {
  const factory MaterialGroupQueryState.initial() = _Initial;
  const factory MaterialGroupQueryState.loading(
    PageOptions<MaterialGroup> pageOptions,
  ) = _Loading;
  const factory MaterialGroupQueryState.loaded(
    PageOptions<MaterialGroup> pageOptions,
  ) = _Loaded;
  const factory MaterialGroupQueryState.error(String error) = _Error;
}

@freezed
class MaterialGroupQueryEvent with _$MaterialGroupQueryEvent {
  const factory MaterialGroupQueryEvent.fetch({
    PageOptions<MaterialGroup>? pageOptions,
    MaterialGroupCategory? materialGroupCategory,
  }) = _Fetch;
}

class MaterialGroupQueryBloc
    extends Bloc<MaterialGroupQueryEvent, MaterialGroupQueryState> {
  MaterialGroupQueryBloc() : super(const _Initial()) {
    on<MaterialGroupQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, category) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions = await MaterialRepository.instance.materialGroupFetch(
                accessToken: UserRepositoryApp.instance.token!,
                materialGroupCategory: category,
                pageOptions: _pageOptions);
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MaterialGroup> _pageOptions = PageOptions.empty();
}
