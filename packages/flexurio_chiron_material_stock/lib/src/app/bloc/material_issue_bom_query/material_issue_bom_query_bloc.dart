import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_issue_bom_query_bloc.freezed.dart';

@freezed
class MaterialIssueBomQueryState with _$MaterialIssueBomQueryState {
  const factory MaterialIssueBomQueryState.initial() = _Initial;
  const factory MaterialIssueBomQueryState.loading() = _Loading;
  const factory MaterialIssueBomQueryState.loaded(
    List<MaterialIssueBom> materialIssueBom,
  ) = _Loaded;
  const factory MaterialIssueBomQueryState.error(String error) = _Error;
}

@freezed
class MaterialIssueBomQueryEvent with _$MaterialIssueBomQueryEvent {
  const factory MaterialIssueBomQueryEvent.fetch({
    required Product product,
    required ProductionOrder productionOrder,
    required MaterialGroup materialGroup,
    required ProductionProductScale scale,
  }) = _Fetch;
}

class MaterialIssueBomQueryBloc
    extends Bloc<MaterialIssueBomQueryEvent, MaterialIssueBomQueryState> {
  final bool isExternal;
  MaterialIssueBomQueryBloc({
    required this.isExternal,
  }) : super(const _Initial()) {
    on<MaterialIssueBomQueryEvent>((event, emit) async {
      await event.when(
        fetch: (product, productionOrder, materialGroup, scale) async {
          emit(const _Loading());
          try {
            final materialIssueBom =
                await MaterialIssueRepository.instance.materialIssueBomFetch(
              accessToken: UserRepositoryApp.instance.token!,
              product: product,
              productionOrder: productionOrder,
              materialGroup: materialGroup,
              scale: scale,
              isExternal: isExternal,
            );
            emit(_Loaded(materialIssueBom));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
