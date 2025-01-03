import 'package:appointment/src/app/resource/material_stock_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_stock_fifo.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_core/src/app/model/string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_stock_fifo_query_bloc.freezed.dart';

@freezed
class MaterialStockFifoQueryState with _$MaterialStockFifoQueryState {
  const factory MaterialStockFifoQueryState.initial() = _Initial;
  const factory MaterialStockFifoQueryState.loading() = _Loading;
  const factory MaterialStockFifoQueryState.loaded(
    MaterialStockFifo materialStockFifo,
  ) = _Success;
  const factory MaterialStockFifoQueryState.error(String error) = _Error;
}

@freezed
class MaterialStockFifoQueryEvent with _$MaterialStockFifoQueryEvent {
  const factory MaterialStockFifoQueryEvent.fetch({
    Material? material,
  }) = _Fetch;
}

class MaterialStockFifoQueryBloc extends Bloc<MaterialStockFifoQueryEvent, MaterialStockFifoQueryState> {
  MaterialStockFifoQueryBloc() : super(const _Initial()) {
    on<MaterialStockFifoQueryEvent>((event, emit) async {
      await event.when(
        fetch: (material) async {
          emit(const _Loading());
          try {
            final materialStockFifo = await MaterialStockRepository.instance.materialStockFifoFetch(
              accessToken: UserRepositoryApp.instance.token!,
              material: material,
            );
            emit(_Success(materialStockFifo));
          } catch (error) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
      );
    });
  }
}