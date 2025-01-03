import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'production_stage_process_bloc.freezed.dart';

@freezed
class ProductionStageProcessState with _$ProductionStageProcessState {
  const factory ProductionStageProcessState.initial() = _Initial;
  const factory ProductionStageProcessState.loading() = _Loading;
  const factory ProductionStageProcessState.success(int id) = _Success;
  const factory ProductionStageProcessState.error(String error) = _Error;
}

@freezed
class ProductionStageProcessEvent with _$ProductionStageProcessEvent {
  const factory ProductionStageProcessEvent.createMulti({
    required ProductionStageProcessGroup stageProcessGroup,
  }) = _CreateMulti;

  const factory ProductionStageProcessEvent.create({
    required ProductionStageProcessGroup stageProcessGroup,
  }) = _Create;

  const factory ProductionStageProcessEvent.edit({
    required ProductionStageProcessGroup stageProcessGroup,
    required ProductionStageProcessDetail stageProcessDetail,
  }) = _Edit;

  const factory ProductionStageProcessEvent.delete(
    ProductionStageProcessDetail stageProcess,
  ) = _Delete;
}

class ProductionStageProcessBloc
    extends Bloc<ProductionStageProcessEvent, ProductionStageProcessState> {
  ProductionStageProcessBloc() : super(const _Initial()) {
    on<ProductionStageProcessEvent>((event, emit) async {
      await event.when(
        createMulti: (stageProcessGroup) async {
          emit(const _Loading());
          try {
            var ordinal = 1;
            for (final stageProcess in stageProcessGroup.items) {
              await ProductionRepository.instance.stageProcessCreate(
                accessToken: UserRepositoryApp.instance.token!,
                ordinal: ordinal,
                leadTime: stageProcess.leadTime,
                productionType: stageProcessGroup.type,
                subStage: stageProcess.subStage,
                line: stageProcessGroup.line,
                product: stageProcessGroup.product,
                machine: stageProcess.machine,
              );
              ordinal++;
            }
            emit(const _Success(0));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        create: (stageProcessGroup) async {
          emit(const _Loading());
          try {
            final stageProcess = stageProcessGroup.items.first;
            final id = await ProductionRepository.instance.stageProcessCreate(
              accessToken: UserRepositoryApp.instance.token!,
              ordinal: stageProcess.order,
              leadTime: stageProcess.leadTime,
              productionType: stageProcessGroup.type,
              subStage: stageProcess.subStage,
              line: stageProcessGroup.line,
              product: stageProcessGroup.product,
              machine: stageProcess.machine,
            );
            emit(_Success(id));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        edit: (stageProcessGroup, stageProcessDetail) async {
          emit(const _Loading());
          try {
            stageProcessGroup.items.first;
            await ProductionRepository.instance.stageProcessEdit(
              accessToken: UserRepositoryApp.instance.token!,
              id: stageProcessDetail.id,
              ordinal: stageProcessDetail.order,
              stageProcessGroup: stageProcessGroup,
              stageProcess: stageProcessGroup.items.first,
            );
            emit(_Success(stageProcessDetail.id));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (stageProcess) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.stageProcessDelete(
              accessToken: UserRepositoryApp.instance.token!,
              id: stageProcess.id,
            );
            emit(const _Success(0));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
