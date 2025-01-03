import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'production_stage_query_bloc.freezed.dart';

@freezed
class ProductionStageQueryState with _$ProductionStageQueryState {
  const factory ProductionStageQueryState.initial() = _Initial;
  const factory ProductionStageQueryState.loading(
    PageOptions<ProductionStage> pageOptions,
  ) = _Loading;
  const factory ProductionStageQueryState.loaded(
    PageOptions<ProductionStage> pageOptions,
  ) = _Success;
  const factory ProductionStageQueryState.error(String error) = _Error;
}

@freezed
class ProductionStageQueryEvent with _$ProductionStageQueryEvent {
  const factory ProductionStageQueryEvent.fetch({
    PageOptions<ProductionStage>? pageOptions,
  }) = _Fetch;
}

class ProductionStageQueryBloc
    extends Bloc<ProductionStageQueryEvent, ProductionStageQueryState> {
  ProductionStageQueryBloc() : super(const _Initial()) {
    on<ProductionStageQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions =
                await ProductionRepository.instance.productionStageFetch(
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
  PageOptions<ProductionStage> _pageOptions = PageOptions.empty();
}
