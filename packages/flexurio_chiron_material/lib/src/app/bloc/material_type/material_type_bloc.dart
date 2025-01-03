import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material/src/app/model/material_type.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'material_type_bloc.freezed.dart';

@freezed
class MaterialTypeState with _$MaterialTypeState {
  const factory MaterialTypeState.initial() = _Initial;
  const factory MaterialTypeState.loading() = _Loading;
  const factory MaterialTypeState.success() = _Success;
  const factory MaterialTypeState.error(String error) = _Error;
}

@freezed
class MaterialTypeEvent with _$MaterialTypeEvent {
  const factory MaterialTypeEvent.create({
    required String type,
    required MaterialGroup materialGroup,
  }) = _Create;

  const factory MaterialTypeEvent.delete(MaterialType type) = _Delete;
}

class MaterialTypeBloc extends Bloc<MaterialTypeEvent, MaterialTypeState> {
  MaterialTypeBloc() : super(const _Initial()) {
    on<MaterialTypeEvent>((event, emit) async {
      await event.when(
        create: (materialType, materialGroup) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.materialTypeCreate(
              accessToken: UserRepositoryApp.instance.token!,
              type: materialType,
              materialGroup: materialGroup,
            );
            emit(const _Success());
          } on ApiException catch (error) {
            emit(_Error(error.message));
          }
        },
        delete: (materialType) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.materialTypeDelete(
              accessToken: UserRepositoryApp.instance.token!,
              materialType: materialType,
            );
            emit(const _Success());
          } on ApiException catch (error) {
            emit(_Error(error.message));
          }
        },
      );
    });
  }
}
