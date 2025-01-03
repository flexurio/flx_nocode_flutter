import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_group_bloc.freezed.dart';

@freezed
class MaterialGroupState with _$MaterialGroupState {
  const factory MaterialGroupState.initial() = _Initial;
  const factory MaterialGroupState.loading() = _Loading;
  const factory MaterialGroupState.success() = _Success;
  const factory MaterialGroupState.error(String error) = _Error;
}

@freezed
class MaterialGroupEvent with _$MaterialGroupEvent {
  const factory MaterialGroupEvent.create({
    required String id,
    required MaterialGroupCategory category,
    required bool hasVendor,
  }) = _Create;
  const factory MaterialGroupEvent.delete(String id) = _Delete;
}

class MaterialGroupBloc extends Bloc<MaterialGroupEvent, MaterialGroupState> {
  MaterialGroupBloc() : super(const _Initial()) {
    on<MaterialGroupEvent>((event, emit) async {
      await event.when(
        create: (id, category, hasVendor) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.materialGroupCreate(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              category: category,
              hasVendor: hasVendor,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.materialGroupDelete(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
