import 'package:flexurio_chiron_material/src/app/model/unit_convert.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_convert_query_bloc.freezed.dart';

@freezed
class UnitConvertQueryState with _$UnitConvertQueryState {
  const factory UnitConvertQueryState.initial() = _Initial;
  const factory UnitConvertQueryState.loading(
    PageOptions<UnitConvert> pageOptions,
  ) = _Loading;
  const factory UnitConvertQueryState.loaded(UnitConvert? unitConvert) =
      _Success;
  const factory UnitConvertQueryState.load(
    PageOptions<UnitConvert> pageOptions,
  ) = _Loaded;
  const factory UnitConvertQueryState.error(String error) = _Error;
}

@freezed
class UnitConvertQueryEvent with _$UnitConvertQueryEvent {
  const factory UnitConvertQueryEvent.fetch({
    PageOptions<UnitConvert>? pageOptions,
    required MaterialUnit unitFrom,
    required MaterialUnit unitTo,
  }) = _Fetch;
}

class UnitConvertQueryBloc
    extends Bloc<UnitConvertQueryEvent, UnitConvertQueryState> {
  UnitConvertQueryBloc() : super(const _Initial()) {
    on<UnitConvertQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, unitFrom, unitTo) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await MaterialRepository.instance.unitConvertFetch(
              accessToken: UserRepositoryApp.instance.token!,
              unitFrom: unitFrom,
              unitTo: unitTo,
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
  PageOptions<UnitConvert> _pageOptions = PageOptions.empty();
}
