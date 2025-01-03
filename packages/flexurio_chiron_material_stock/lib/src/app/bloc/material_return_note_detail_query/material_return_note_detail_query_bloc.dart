import 'package:flexurio_chiron_material_stock/src/app/model/material_return_note.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return_note_detail.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_return_note_detail_query_bloc.freezed.dart';

@freezed
class MaterialReturnNoteDetailQueryState
    with _$MaterialReturnNoteDetailQueryState {
  const factory MaterialReturnNoteDetailQueryState.initial() = _Initial;
  const factory MaterialReturnNoteDetailQueryState.loading() = _Loading;
  const factory MaterialReturnNoteDetailQueryState.loaded(
    List<MaterialReturnNoteDetail> materialReturnNoteDetails,
  ) = _Loaded;
  const factory MaterialReturnNoteDetailQueryState.error(String error) = _Error;
}

@freezed
class MaterialReturnNoteDetailQueryEvent
    with _$MaterialReturnNoteDetailQueryEvent {
  const factory MaterialReturnNoteDetailQueryEvent.fetch(
    MaterialReturnNote materialReturnNote,
  ) = _Fetch;
}

class MaterialReturnNoteDetailQueryBloc extends Bloc<
    MaterialReturnNoteDetailQueryEvent, MaterialReturnNoteDetailQueryState> {
  MaterialReturnNoteDetailQueryBloc() : super(const _Initial()) {
    on<MaterialReturnNoteDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (materialReturnNote) async {
          emit(const _Loading());
          try {
            final details =
                await MaterialRepository.instance.materialReturnNoteDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              materialReturnNote: materialReturnNote,
            );
            emit(_Loaded([details]));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
