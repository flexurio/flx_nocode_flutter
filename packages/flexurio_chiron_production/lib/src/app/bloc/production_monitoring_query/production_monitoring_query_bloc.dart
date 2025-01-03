import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_production/src/app/model/production_monitoring.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_monitoring_query_bloc.freezed.dart';

@freezed
class ProductionMonitoringQueryEvent with _$ProductionMonitoringQueryEvent {
  const factory ProductionMonitoringQueryEvent.fetch({
    required DateTime startDate,
    required DateTime endDate,
  }) = _Fetch;
}

@freezed
class ProductionMonitoringQueryState with _$ProductionMonitoringQueryState {
  const factory ProductionMonitoringQueryState.error(String error) = _Error;
  const factory ProductionMonitoringQueryState.initial() = _Initial;
  const factory ProductionMonitoringQueryState.loaded(
    List<ProductionMonitoring> productionMonitoring,
  ) = _Loaded;
  const factory ProductionMonitoringQueryState.loading() = _Loading;
}

class ProductionMonitoringQueryBloc
    extends Bloc<ProductionMonitoringQueryEvent, ProductionMonitoringQueryState> {
  ProductionMonitoringQueryBloc() : super(const _Initial()) {
    on<ProductionMonitoringQueryEvent>((event, emit) async {
      await event.when(
        fetch: (startDate, endDate) async {
          emit(_Loading());
          try {
            final productionMonitoring = await ProductionRepository.instance.productionMonitoringFetch(
              accessToken: UserRepositoryApp.instance.token!,
              startDate: startDate,
              endDate: endDate,
            );

            emit(_Loaded(productionMonitoring));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
