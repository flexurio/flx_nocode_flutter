import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_return_rupiah.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/product_stock.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_return_rupiah_query_bloc.freezed.dart';

@freezed
class MaterialReturnRupiahQueryState with _$MaterialReturnRupiahQueryState {
  const factory MaterialReturnRupiahQueryState.initial() = _Initial;
  const factory MaterialReturnRupiahQueryState.loading(
    PageOptions<MaterialReturnRupiah> pageOptions,
  ) = _Loading;
  const factory MaterialReturnRupiahQueryState.loaded(
    PageOptions<MaterialReturnRupiah> pageOptions,
  ) = _Loaded;
  const factory MaterialReturnRupiahQueryState.error(String error) = _Error;
}

@freezed
class MaterialReturnRupiahQueryEvent with _$MaterialReturnRupiahQueryEvent {
  const factory MaterialReturnRupiahQueryEvent.fetch({
    PageOptions<MaterialReturnRupiah>? pageOptions,
    DateTime? dateGte,
    DateTime? dateLte,
    MaterialGroup? materialGroupId,
  }) = _Fetch;
}

class MaterialReturnRupiahQueryBloc extends Bloc<MaterialReturnRupiahQueryEvent, MaterialReturnRupiahQueryState> {
  MaterialReturnRupiahQueryBloc() : super(const _Initial()) {
    on<MaterialReturnRupiahQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, dateGte, dateLte, materialGroupId) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await ProductStockRepository.instance.materialReturnRupiahFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              dateGte: dateGte,
              dateLte: dateLte,
              materialGroupId: materialGroupId,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MaterialReturnRupiah> _pageOptions = PageOptions.empty(sortBy: 'mrd.material_id');
}
