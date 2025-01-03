import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_stock_rupiah.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/material_stock_rupiah.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_stock_rupiah_query_bloc.freezed.dart';

@freezed
class MaterialStockRupiahQueryState with _$MaterialStockRupiahQueryState {
  const factory MaterialStockRupiahQueryState.initial() = _Initial;
  const factory MaterialStockRupiahQueryState.loading(
    PageOptions<MaterialStockRupiah> pageOptions,
  ) = _Loading;
  const factory MaterialStockRupiahQueryState.loaded(
    PageOptions<MaterialStockRupiah> pageOptions,
  ) = _Loaded;
  const factory MaterialStockRupiahQueryState.error(String error) = _Error;
}

@freezed
class MaterialStockRupiahQueryEvent with _$MaterialStockRupiahQueryEvent {
  const factory MaterialStockRupiahQueryEvent.fetch({
    PageOptions<MaterialStockRupiah>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
  }) = _Fetch;
}

class MaterialStockRupiahQueryBloc extends Bloc<MaterialStockRupiahQueryEvent, MaterialStockRupiahQueryState> {
  MaterialStockRupiahQueryBloc() : super(const _Initial()) {
    on<MaterialStockRupiahQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate, materialGroup) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await MaterialStockRupiahRepository.instance.fetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              startDate: startDate,
              endDate: endDate,
              materialGroup: materialGroup,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MaterialStockRupiah> _pageOptions = PageOptions.empty(sortBy: 'date');
}
