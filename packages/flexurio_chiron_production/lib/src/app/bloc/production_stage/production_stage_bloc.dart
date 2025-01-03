import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_stage_bloc.freezed.dart';

@freezed
class ProductionStageState with _$ProductionStageState {
  const factory ProductionStageState.initial() = _Initial;
  const factory ProductionStageState.loading() = _Loading;
  const factory ProductionStageState.success() = _Success;
  const factory ProductionStageState.error(String error) = _Error;
}

@freezed
class ProductionStageEvent with _$ProductionStageEvent {
  const factory ProductionStageEvent.create(String name) = _Create;
  const factory ProductionStageEvent.update(int id, String name) = _Update;
  const factory ProductionStageEvent.delete(int id) = _Delete;
}

class ProductionStageBloc
    extends Bloc<ProductionStageEvent, ProductionStageState> {
  ProductionStageBloc() : super(const _Initial()) {
    on<ProductionStageEvent>((event, emit) async {
      await event.when(
        create: (name) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.productionStageCreate(
              accessToken: UserRepositoryApp.instance.token!,
              name: name,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (id, name) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.productionStageUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              name: name,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.productionStageDelete(
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
