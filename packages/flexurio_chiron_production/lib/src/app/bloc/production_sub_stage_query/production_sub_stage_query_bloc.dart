import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_production/src/app/model/production_sub_stage.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_sub_stage_query_bloc.freezed.dart';

@freezed
class ProductionSubStageQueryState with _$ProductionSubStageQueryState {
  const factory ProductionSubStageQueryState.initial() = _Initial;
  const factory ProductionSubStageQueryState.loading() = _Loading;
  const factory ProductionSubStageQueryState.loaded(
    List<ProductionSubStage> subStage,
  ) = _Success;
  const factory ProductionSubStageQueryState.error(String error) = _Error;
}

@freezed
class ProductionSubStageQueryEvent with _$ProductionSubStageQueryEvent {
  const factory ProductionSubStageQueryEvent.fetch({
    ProductionStage? stage,
    bool? isActive,
  }) = _Fetch;
  const factory ProductionSubStageQueryEvent.fetchById({
    ProductionSubStage? subStage,
  }) = _FetchById;
}

class ProductionSubStageQueryBloc
    extends Bloc<ProductionSubStageQueryEvent, ProductionSubStageQueryState> {
  ProductionSubStageQueryBloc() : super(const _Initial()) {
    on<ProductionSubStageQueryEvent>((event, emit) async {
      await event.when(
        fetch: (stage, isActive) async {
          emit(const _Loading());
          try {
            if (stage != null) {
              _stage = stage;
            }

            final productionLines =
                await ProductionRepository.instance.subStageFetch(
              accessToken: UserRepositoryApp.instance.token!,
              stage: _stage,
              isActive: isActive,
            );
            emit(_Success(productionLines));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetchById: (subStage) async {
          emit(const _Loading());
          try {
            final data = await ProductionRepository.instance.subStageFetchById(
              accessToken: UserRepositoryApp.instance.token!,
              subStage: subStage!,
            );
            emit(_Success([data]));
          } catch (err) {
            emit(_Error(errorMessage(err)));
          }
        },
      );
    });
  }
  late ProductionStage _stage;
}
