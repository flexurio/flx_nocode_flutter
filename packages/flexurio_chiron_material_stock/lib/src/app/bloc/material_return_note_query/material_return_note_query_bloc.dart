import 'package:flexurio_chiron_material_stock/src/app/model/material_return_note.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_return_note_query_bloc.freezed.dart';

@freezed
class MaterialReturnNoteQueryState with _$MaterialReturnNoteQueryState {
  const factory MaterialReturnNoteQueryState.initial() = _Initial;
  const factory MaterialReturnNoteQueryState.loading(
    PageOptions<MaterialReturnNote> pageOptions,
  ) = _Loading;
  const factory MaterialReturnNoteQueryState.loaded(
    PageOptions<MaterialReturnNote> pageOptions,
  ) = _Loaded;
  const factory MaterialReturnNoteQueryState.error(String error) = _Error;
}

@freezed
class MaterialReturnNoteQueryEvent with _$MaterialReturnNoteQueryEvent {
  const factory MaterialReturnNoteQueryEvent.fetch({
    PageOptions<MaterialReturnNote>? pageOptions,
  }) = _Fetch;
}

class MaterialReturnNoteQueryBloc
    extends Bloc<MaterialReturnNoteQueryEvent, MaterialReturnNoteQueryState> {
  MaterialReturnNoteQueryBloc() : super(const _Initial()) {
    on<MaterialReturnNoteQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions =
                await MaterialRepository.instance.materialReturnNoteFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MaterialReturnNote> _pageOptions = PageOptions.empty();
}
