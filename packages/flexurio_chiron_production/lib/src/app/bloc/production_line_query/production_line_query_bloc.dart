import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_line_query_bloc.freezed.dart';

@freezed
class ProductionLineQueryState with _$ProductionLineQueryState {
  const factory ProductionLineQueryState.initial() = _Initial;
  const factory ProductionLineQueryState.loading(
    PageOptions<ProductionLine> pageOptions,
  ) = _Loading;
  const factory ProductionLineQueryState.loaded(
    PageOptions<ProductionLine> pageOptions,
  ) = _Success;
  const factory ProductionLineQueryState.error(String error) = _Error;
}

@freezed
class ProductionLineQueryEvent with _$ProductionLineQueryEvent {
  const factory ProductionLineQueryEvent.initialize() = _Initialize;
  const factory ProductionLineQueryEvent.get({
    PageOptions<ProductionLine>? pageOptions,
  }) = _Get;
}

class ProductionLineQueryBloc
    extends Bloc<ProductionLineQueryEvent, ProductionLineQueryState> {
  ProductionLineQueryBloc() : super(const _Initial()) {
    on<ProductionLineQueryEvent>((event, emit) async {
      await event.when(
        initialize: () async {
          if (state is _Initial) {
            add(const ProductionLineQueryEvent.get());
          } else {
            _pageOptions = await ProductionRepository.instance.lineFetch(
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
            _pageOptions = await ProductionRepository.instance.lineFetch(
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
  PageOptions<ProductionLine> _pageOptions = PageOptions.empty();
}
