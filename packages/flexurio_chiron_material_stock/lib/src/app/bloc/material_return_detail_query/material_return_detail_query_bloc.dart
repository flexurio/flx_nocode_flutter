import 'package:flexurio_chiron_material_stock/src/app/model/material_return.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return_detail.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'material_return_detail_query_bloc.freezed.dart';

@freezed
class MaterialReturnDetailQueryState with _$MaterialReturnDetailQueryState {
  factory MaterialReturnDetailQueryState.initial() = _Initial;
  factory MaterialReturnDetailQueryState.loading() = _Loading;
  factory MaterialReturnDetailQueryState.loaded({
    required List<MaterialReturnDetail> materialReturnDetails,
  }) = _Loaded;
  factory MaterialReturnDetailQueryState.error(String error) = _Error;
}

@freezed
class MaterialReturnDetailQueryEvent with _$MaterialReturnDetailQueryEvent {
  factory MaterialReturnDetailQueryEvent.fetch({
    required MaterialReturn materialReturn,
    required bool isExternal,
  }) = _Fetch;
}

class MaterialReturnDetailQueryBloc extends Bloc<MaterialReturnDetailQueryEvent,
    MaterialReturnDetailQueryState> {
  MaterialReturnDetailQueryBloc() : super(_Initial()) {
    on<MaterialReturnDetailQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: (materialReturn, isExternal) async {
            emit(_Loading());
            try {
              final materialReturnDetails =
                  await MaterialRepository.instance.materialReturnDetailFetch(
                accessToken: UserRepositoryApp.instance.token!,
                materialReturn: materialReturn,
                isExternal: isExternal,
              );
              emit(_Loaded(materialReturnDetails: materialReturnDetails));
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
}
