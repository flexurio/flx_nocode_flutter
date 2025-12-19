import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flx_nocode_flutter/src/app/resource/entity_custom.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../backend_other.dart';

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
    required int? cachedDurationSeconds,
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
                accessToken: UserRepositoryApp.instance.token,
                id: id,
                method: method,
                path: urlWithValuesReplace(url, {}),
                headers: null,
              );
              emit(_Loaded(_pageOptions.copyWith(data: [data])));
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          fetch: (
            pageOptions,
            filter,
            method,
            url,
            cachedDurationSeconds,
          ) async {
            emit(_Loading(_pageOptions));
            try {
              if (pageOptions != null) {
                _pageOptions = pageOptions;
              }

              final filterMap = <String, dynamic>{};
              for (final f in filter ?? []) {
                filterMap[f.getKeyBackend()] = f.value;
              }

              _pageOptions = await EntityCustomRepository.instance.fetch(
                accessToken: UserRepositoryApp.instance.token,
                pageOptions: _pageOptions,
                method: method,
                path: urlWithValuesReplace(url, {}),
                filterMap: filterMap,
                headers: null,
                cachedDurationSeconds: cachedDurationSeconds,
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
