import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_receive_by_na_query_bloc.freezed.dart';

@freezed
class MaterialReceiveByNaQueryState with _$MaterialReceiveByNaQueryState {
  factory MaterialReceiveByNaQueryState.initial() = _Initial;
  factory MaterialReceiveByNaQueryState.loading(
    PageOptions<MaterialReceiveByNa> pageOptions,
  ) = _Loading;
  factory MaterialReceiveByNaQueryState.loaded(
    PageOptions<MaterialReceiveByNa> pageOptions,
  ) = _Loaded;
  factory MaterialReceiveByNaQueryState.error(String error) = _Error;
}

@freezed
class MaterialReceiveByNaQueryEvent with _$MaterialReceiveByNaQueryEvent {
  factory MaterialReceiveByNaQueryEvent.fetch({
    PageOptions<MaterialReceiveByNa>? pageOptions,
    String? materialStatusQc,
    String? materialGroupId,
    PurchaseOrder? purchaseOrder,
  }) = _Fetch;
}

class MaterialReceiveByNaQueryBloc
    extends Bloc<MaterialReceiveByNaQueryEvent, MaterialReceiveByNaQueryState> {
  MaterialReceiveByNaQueryBloc() : super(_Initial()) {
    on<MaterialReceiveByNaQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          pageOptions,
          materialStatusQc,
          materialGroupId,
          purchaseOrder,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await MaterialReceiveRepository.instance
                .materialReceiveByNaFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              materialGroupId: materialGroupId,
              materialStatusQc: materialStatusQc,
              purchaseOrder: purchaseOrder,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
            print(error);
          }
        },
      );
    });
  }
  PageOptions<MaterialReceiveByNa> _pageOptions = PageOptions.empty();
}
