import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_machine_query_bloc.freezed.dart';

@freezed
class ProductionMachineQueryState with _$ProductionMachineQueryState {
  const factory ProductionMachineQueryState.initial() = _Initial;
  const factory ProductionMachineQueryState.loading(
    PageOptions<ProductionMachine> pageOptions,
  ) = _Loading;
  const factory ProductionMachineQueryState.loaded(
    PageOptions<ProductionMachine> pageOptions,
  ) = _Success;
  const factory ProductionMachineQueryState.error(String error) = _Error;
}

@freezed
class ProductionMachineQueryEvent with _$ProductionMachineQueryEvent {
  const factory ProductionMachineQueryEvent.initialize() = _Initialize;
  const factory ProductionMachineQueryEvent.get({
    PageOptions<ProductionMachine>? pageOptions,
  }) = _Get;
}

class ProductionMachineQueryBloc
    extends Bloc<ProductionMachineQueryEvent, ProductionMachineQueryState> {
  ProductionMachineQueryBloc() : super(const _Initial()) {
    on<ProductionMachineQueryEvent>((event, emit) async {
      await event.when(
        initialize: () async {
          if (state is _Initial) {
            add(const ProductionMachineQueryEvent.get());
          } else {
            _pageOptions = await ProductionRepository.instance.machineGet(
              pageOptions: _pageOptions,
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(_Success(_pageOptions));
          }
        },
        get: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions = await ProductionRepository.instance.machineGet(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
            );

            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductionMachine> _pageOptions = PageOptions.empty();
}
