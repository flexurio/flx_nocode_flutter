import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_service_order_query_bloc.freezed.dart';

@freezed
class ProductionServiceOrderQueryState with _$ProductionServiceOrderQueryState {
  const factory ProductionServiceOrderQueryState.initial() = _Initial;
  const factory ProductionServiceOrderQueryState.loading() = _Loading;
  const factory ProductionServiceOrderQueryState.loaded(
    List<ProductionServiceOrder> materials,
  ) = _Success;
  const factory ProductionServiceOrderQueryState.error(String error) = _Error;
}

@freezed
class ProductionServiceOrderQueryEvent with _$ProductionServiceOrderQueryEvent {
  const factory ProductionServiceOrderQueryEvent.fetch() = _Fetch;
}

class ProductionServiceOrderQueryBloc extends Bloc<
    ProductionServiceOrderQueryEvent, ProductionServiceOrderQueryState> {
  ProductionServiceOrderQueryBloc() : super(const _Initial()) {
    on<ProductionServiceOrderQueryEvent>((event, emit) async {
      await event.when(
        fetch: () async {
          emit(const _Loading());
          try {
            final materials =
                await ProductionRepository.instance.serviceOrderFetch(
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(_Success(materials));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
