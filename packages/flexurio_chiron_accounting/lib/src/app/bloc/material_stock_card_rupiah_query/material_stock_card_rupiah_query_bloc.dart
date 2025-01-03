import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_stock_card_rupiah.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/material_stock_rupiah.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_stock_card_rupiah_query_bloc.freezed.dart';

@freezed
class MaterialStockCardRupiahQueryState with _$MaterialStockCardRupiahQueryState {
  const factory MaterialStockCardRupiahQueryState.initial() = _Initial;
  const factory MaterialStockCardRupiahQueryState.loading(
    PageOptions<MaterialStockCardRupiah> pageOptions,
  ) = _Loading;
  const factory MaterialStockCardRupiahQueryState.loaded(
    PageOptions<MaterialStockCardRupiah> pageOptions,
  ) = _Loaded;
  const factory MaterialStockCardRupiahQueryState.error(String error) = _Error;
}

@freezed
class MaterialStockCardRupiahQueryEvent with _$MaterialStockCardRupiahQueryEvent {
  const factory MaterialStockCardRupiahQueryEvent.fetch({
    PageOptions<MaterialStockCardRupiah>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
    Material? material,
  }) = _Fetch;
}

class MaterialStockCardRupiahQueryBloc extends Bloc<MaterialStockCardRupiahQueryEvent, MaterialStockCardRupiahQueryState> {
  MaterialStockCardRupiahQueryBloc() : super(const _Initial()) {
    on<MaterialStockCardRupiahQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate, materialGroup, material) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await MaterialStockRupiahRepository.instance.fetchCard(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              startDate: startDate,
              endDate: endDate,
              materialGroup: materialGroup,
              material: material,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MaterialStockCardRupiah> _pageOptions = PageOptions.empty(sortBy: 'transaction_id');
}
