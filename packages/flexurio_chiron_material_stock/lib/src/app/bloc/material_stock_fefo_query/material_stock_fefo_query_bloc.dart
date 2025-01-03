import 'package:appointment/src/app/resource/material_stock_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_stock_fefo.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_core/src/app/model/string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_stock_fefo_query_bloc.freezed.dart';

@freezed
class MaterialStockFefoQueryState with _$MaterialStockFefoQueryState {
  const factory MaterialStockFefoQueryState.initial() = _Initial;
  const factory MaterialStockFefoQueryState.loading() = _Loading;
  const factory MaterialStockFefoQueryState.loaded(
    MaterialStockFefo materialStockFefo,
  ) = _Success;
  const factory MaterialStockFefoQueryState.error(String error) = _Error;
}

@freezed
class MaterialStockFefoQueryEvent with _$MaterialStockFefoQueryEvent {
  const factory MaterialStockFefoQueryEvent.fetch({
    Material? material,
  }) = _Fetch;
}

class MaterialStockFefoQueryBloc extends Bloc<MaterialStockFefoQueryEvent, MaterialStockFefoQueryState> {
  MaterialStockFefoQueryBloc() : super(const _Initial()) {
    on<MaterialStockFefoQueryEvent>((event, emit) async {
      await event.when(
        fetch: (material) async {
          emit(const _Loading());
          try {
            final materialStockFefo = await MaterialStockRepository.instance.materialStockFefoFetch(
              accessToken: UserRepositoryApp.instance.token!,
              material: material,
            );
            emit(_Success(materialStockFefo));
          } catch (error) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
      );
    });
  }
}