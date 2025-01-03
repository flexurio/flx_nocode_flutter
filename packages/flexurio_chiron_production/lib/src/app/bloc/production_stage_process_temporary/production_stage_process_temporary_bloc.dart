import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'production_stage_process_temporary_bloc.freezed.dart';

@freezed
class ProductStageProcessTemporaryEvent
    with _$ProductStageProcessTemporaryEvent {
  const factory ProductStageProcessTemporaryEvent.add(
    ProductionStageProcessDetail stageProcess,
  ) = _Add;
  const factory ProductStageProcessTemporaryEvent.addAll(
    List<ProductionStageProcessDetail> stageProcesses,
  ) = _AddAll;
  const factory ProductStageProcessTemporaryEvent.replace(
    int index,
    ProductionStageProcessDetail stageProcesses,
  ) = _Replace;
  const factory ProductStageProcessTemporaryEvent.remove(
    ProductionStageProcessDetail stageProcess,
  ) = _Remove;
}

class ProductionStageProcessTemporaryBloc extends Bloc<
    ProductStageProcessTemporaryEvent, List<ProductionStageProcessDetail>> {
  ProductionStageProcessTemporaryBloc() : super([]) {
    on<ProductStageProcessTemporaryEvent>((event, emit) async {
      await event.when(
        add: (stageProcess) async {
          final indexSubStage = state.indexWhere(
            (element) => element.subStage.id == stageProcess.subStage.id,
          );
          if (indexSubStage == -1) {
            emit(List.from(state)..add(stageProcess));
          }
        },
        addAll: (stageProcesses) {
          emit(List.from(stageProcesses));
        },
        replace: (index, stageProcesses) {
          final newState = List<ProductionStageProcessDetail>.from(state);
          newState[index] = stageProcesses;
          emit(newState);
        },
        remove: (stageProcess) {
          emit(List.from(state)..remove(stageProcess));
        },
      );
    });
  }
}
