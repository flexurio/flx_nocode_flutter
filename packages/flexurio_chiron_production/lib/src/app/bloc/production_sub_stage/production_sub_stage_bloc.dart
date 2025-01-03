import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_production/src/app/model/production_sub_stage.dart';
import 'package:flexurio_chiron_production/src/app/resource/production_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_sub_stage_bloc.freezed.dart';

@freezed
class ProductionSubStageState with _$ProductionSubStageState {
  const factory ProductionSubStageState.initial() = _Initial;
  const factory ProductionSubStageState.loading() = _Loading;
  const factory ProductionSubStageState.success() = _Success;
  const factory ProductionSubStageState.error(String error) = _Error;
}

@freezed
class ProductionSubStageEvent with _$ProductionSubStageEvent {
  const factory ProductionSubStageEvent.create(String name, int stageId) =
      _Create;
  const factory ProductionSubStageEvent.update(int id, String name) = _Update;
  const factory ProductionSubStageEvent.delete(int id) = _Delete;
  const factory ProductionSubStageEvent.activate(
    ProductionSubStage substage,
  ) = _Activate;
  const factory ProductionSubStageEvent.deactivate(
    ProductionSubStage substage,
  ) = _Deactivate;
}

class ProductionSubStageBloc
    extends Bloc<ProductionSubStageEvent, ProductionSubStageState> {
  ProductionSubStageBloc() : super(const _Initial()) {
    on<ProductionSubStageEvent>((event, emit) async {
      await event.when(
        create: (name, stageId) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.subStageCreate(
              accessToken: UserRepositoryApp.instance.token!,
              name: name,
              stageId: stageId,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (id, name) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.subStageUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              name: name,
              id: id,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.subStageDelete(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        activate: (substage) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.subStageActivate(
              accessToken: UserRepositoryApp.instance.token!,
              subStage: substage,
            );
            emit(const _Success());
          } catch (err) {
            emit(_Error(errorMessage(err)));
          }
        },
        deactivate: (substage) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.subStageDeactivate(
              accessToken: UserRepositoryApp.instance.token!,
              subStage: substage,
            );
            emit(const _Success());
          } catch (err) {
            emit(_Error(errorMessage(err)));
          }
        },
      );
    });
  }
}
