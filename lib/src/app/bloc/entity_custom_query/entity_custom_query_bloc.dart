import 'package:flexurio_no_code/flexurio_no_code.dart';
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
    required String method,
    required String url,
  }) = _Fetch;
  const factory EntityCustomQueryEvent.fetchById({
    required String id,
    required String method,
    required String url,
  }) = _FetchById;
}

class EntityCustomQueryBloc
    extends Bloc<EntityCustomQueryEvent, EntityCustomQueryState> {
  EntityCustomQueryBloc() : super(const _Initial()) {
    on<EntityCustomQueryEvent>(
      (event, emit) async {
        await event.when(
          fetchById: (id, method, url) async {
            emit(_Loading(_pageOptions));
            try {
              final data = await EntityCustomRepository.instance.fetchById(
                accessToken: '',
                id: id,
                method: method,
                path: urlWithValues(url),
              );
              emit(_Loaded(_pageOptions.copyWith(data: [data])));
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          fetch: (pageOptions, filter, method, url) async {
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
                method: method,
                path: urlWithValues(url),
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

  String urlWithValues(String url) {
    final pageData = NoCode.pageData;
    for (var key in pageData.keys) {
      url = url.replaceAll('{page.$key}', pageData[key].toString());
    }
    return url;
  }

  PageOptions<Map<String, dynamic>> _pageOptions = PageOptions.empty();
}
