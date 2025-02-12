import 'package:flexurio_no_code/src/app/model/entity.dart' as configuration;
import 'package:flexurio_no_code/src/app/model/filter.dart';
import 'package:flexurio_no_code/src/app/resource/entity_custom.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'entity_custom_query_bloc.freezed.dart';

@freezed
class EntityCustomQueryState with _$EntityCustomQueryState {
  const factory EntityCustomQueryState.initial() = _Initial;
  const factory EntityCustomQueryState.loading(
    PageOptions<Map<String, dynamic>> pageOptions,
  ) = _Loading;
  const factory EntityCustomQueryState.loaded(
    PageOptions<Map<String, dynamic>> pageOptions,
  ) = _Loaded;
  const factory EntityCustomQueryState.error(String error) = _Error;
}

@freezed
class EntityCustomQueryEvent with _$EntityCustomQueryEvent {
  const factory EntityCustomQueryEvent.fetch({
    PageOptions<Map<String, dynamic>>? pageOptions,
    List<Filter>? filters,
  }) = _Fetch;
  const factory EntityCustomQueryEvent.fetchById(String id) = _FetchById;
}

class EntityCustomQueryBloc
    extends Bloc<EntityCustomQueryEvent, EntityCustomQueryState> {
  final configuration.EntityCustom entity;
  EntityCustomQueryBloc(this.entity) : super(const _Initial()) {
    on<EntityCustomQueryEvent>(
      (event, emit) async {
        await event.when(
          fetchById: (id) async {
            emit(_Loading(_pageOptions));
            try {
              final data = await EntityCustomRepository.instance.fetchById(
                accessToken: '',
                id: id,
                method: entity.backend.read!.method,
                path: entity.backend.read!.url,
              );
              emit(_Loaded(_pageOptions.copyWith(data: [data])));
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          fetch: (pageOptions, filter) async {
            emit(_Loading(_pageOptions));
            try {
              if (pageOptions != null) {
                _pageOptions = pageOptions;
              }

              final filterMap = <String, dynamic>{};
              for (final filter in filter ?? []) {
                filterMap[filter.getKeyBackend()] = filter.value;
              }

              _pageOptions = await EntityCustomRepository.instance.fetch(
                accessToken: 'text',
                pageOptions: _pageOptions,
                method: entity.backend.readAll!.method,
                path: entity.backend.readAll!.url,
                filterMap: filterMap,
              );
              emit(_Loaded(_pageOptions));
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
  PageOptions<Map<String, dynamic>> _pageOptions = PageOptions.empty();
}
