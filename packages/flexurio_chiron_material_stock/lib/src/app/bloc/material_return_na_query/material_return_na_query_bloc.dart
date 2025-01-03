import 'package:flexurio_chiron_material_stock/src/app/model/material_return_na.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'material_return_na_query_bloc.freezed.dart';

@freezed
class MaterialReturnNaQueryState with _$MaterialReturnNaQueryState {
  const factory MaterialReturnNaQueryState.initial() = _Initial;
  const factory MaterialReturnNaQueryState.loading() = _Loading;
  const factory MaterialReturnNaQueryState.loaded(
    List<MaterialReturnNa> materialReturnNas,
  ) = _Loaded;
  const factory MaterialReturnNaQueryState.error(String error) = _Error;
}

@freezed
class MaterialReturnNaQueryEvent with _$MaterialReturnNaQueryEvent {
  const factory MaterialReturnNaQueryEvent.fetch({
    String? materialId,
  }) = _Fetch;
}

class MaterialReturnNaQueryBloc
    extends Bloc<MaterialReturnNaQueryEvent, MaterialReturnNaQueryState> {
  final bool isExternal;
  MaterialReturnNaQueryBloc({
    required this.isExternal
  }) : super(const _Initial()) {
    on<MaterialReturnNaQueryEvent>((event, emit) async {
      await event.when(
        fetch: (materialId) async {
          emit(const _Loading());
          try {
            final materialReturnNas =
                await MaterialRepository.instance.materialReturnFetchNa(
              accessToken: UserRepositoryApp.instance.token!,
              materialId: materialId,
              isExternal: isExternal,
            );
            emit(_Loaded(materialReturnNas));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
