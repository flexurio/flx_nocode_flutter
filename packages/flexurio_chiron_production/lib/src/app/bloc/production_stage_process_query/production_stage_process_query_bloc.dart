import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'production_stage_process_query_bloc.freezed.dart';

@freezed
class ProductionStageProcessQueryState with _$ProductionStageProcessQueryState {
  const factory ProductionStageProcessQueryState.initial() = _Initial;
  const factory ProductionStageProcessQueryState.loading(
    PageOptions<ProductionStageProcess> productionStageProcess,
  ) = _Loading;
  const factory ProductionStageProcessQueryState.loaded(
    PageOptions<ProductionStageProcess> productionStageProcess,
    List<ProductionStageProcessGroup> groups,
  ) = _Loaded;
  const factory ProductionStageProcessQueryState.error(String error) = _Error;
}

@freezed
class ProductionStageProcessQueryEvent with _$ProductionStageProcessQueryEvent {
  const factory ProductionStageProcessQueryEvent.fetch({
    String? type,
    Product? product,
    ProductionLine? line,
    PageOptions<ProductionStageProcess>? pageOptions,
  }) = _Fetch;
}

class ProductionStageProcessQueryBloc extends Bloc<
    ProductionStageProcessQueryEvent, ProductionStageProcessQueryState> {
  ProductionStageProcessQueryBloc() : super(const _Initial()) {
    on<ProductionStageProcessQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          productType,
          product,
          line,
          pageOptions,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions =
                await ProductionRepository.instance.stageProcessFetch(
              accessToken: UserRepositoryApp.instance.token!,
              product: product,
              line: line,
              type: productType,
              pageOptions: _pageOptions,
            );
            final groups = groupProductionStageProcesses(_pageOptions.data);

            emit(_Loaded(_pageOptions, groups));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductionStageProcess> _pageOptions = PageOptions.empty();
  List<ProductionStageProcessGroup> groupProductionStageProcesses(
    List<ProductionStageProcess> data,
  ) {
    final groups = <ProductionStageProcessGroup>[];

    for (final stageProcess in data) {
      final index = groups.indexWhere(
        (item) =>
            item.line.id == stageProcess.productionLine.id &&
            item.product.id == stageProcess.product.id,
      );

      final item = ProductionStageProcessDetail(
        id: stageProcess.id,
        leadTime: stageProcess.leadTime,
        machine: stageProcess.productionMachine,
        stage: stageProcess.productionSubStage.stage,
        subStage: stageProcess.productionSubStage,
        order: stageProcess.ordinal,
      );

      if (index > -1) {
        groups[index].items.add(item);
      } else {
        groups.add(
          ProductionStageProcessGroup(
            items: [item],
            product: stageProcess.product,
            line: stageProcess.productionLine,
            type: stageProcess.type,
          ),
        );
      }
    }

    return groups;
  }
}
