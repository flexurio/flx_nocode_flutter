import 'package:flexurio_chiron_material_stock/src/app/model/material_return.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'material_return_query_bloc.freezed.dart';

@freezed
class MaterialReturnQueryState with _$MaterialReturnQueryState {
  factory MaterialReturnQueryState.initial() = _Initial;
  factory MaterialReturnQueryState.loading(
    PageOptions<MaterialReturn> pageOptions,
  ) = _Loading;
  factory MaterialReturnQueryState.loaded(
    PageOptions<MaterialReturn> pageOptions,
  ) = _Loaded;
  factory MaterialReturnQueryState.error({required String error}) = _Error;
}

@freezed
class MaterialReturnQueryEvent with _$MaterialReturnQueryEvent {
  factory MaterialReturnQueryEvent.fetch({
    required bool isExternal,
    PageOptions<MaterialReturn>? pageOptions,
  }) = _Fetch;
}

class MaterialReturnQueryBloc
    extends Bloc<MaterialReturnQueryEvent, MaterialReturnQueryState> {
  MaterialReturnQueryBloc() : super(_Initial()) {
    on<MaterialReturnQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: (isExternal, pageOptions) async {
            emit(_Loading(_pageOptions));
            try {
              if (pageOptions != null) {
                _pageOptions = pageOptions;
              }

              _pageOptions =
                  await MaterialRepository.instance.materialReturnFetch(
                isExternal: isExternal,
                accessToken: UserRepositoryApp.instance.token!,
                pageOptions: _pageOptions,
              );
              emit(
                _Loaded(_pageOptions),
              );
            } catch (error) {
              emit(_Error(error: errorMessage(error)));
            }
          },
        );
      },
    );
  }
  PageOptions<MaterialReturn> _pageOptions = PageOptions.empty();
}
