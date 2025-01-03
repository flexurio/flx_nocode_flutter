import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'material_receive_query_bloc.freezed.dart';

@freezed
class MaterialReceiveQueryState with _$MaterialReceiveQueryState {
  const factory MaterialReceiveQueryState.initial() = _Initial;
  const factory MaterialReceiveQueryState.loading() = _Loading;
  const factory MaterialReceiveQueryState.loaded(
    List<MaterialReceive> materialReceive,
  ) = _Loaded;
  const factory MaterialReceiveQueryState.error(String error) = _Error;
}

@freezed
class MaterialReceiveQueryEvent with _$MaterialReceiveQueryEvent {
  const factory MaterialReceiveQueryEvent.fetch({
    PurchaseOrder? purchaseOrder,
  }) = _Fetch;
  const factory MaterialReceiveQueryEvent.fetchById(String? id) = _FetchById;
}

class MaterialReceiveQueryBloc
    extends Bloc<MaterialReceiveQueryEvent, MaterialReceiveQueryState> {
  final bool isExternal;
  MaterialReceiveQueryBloc({required this.isExternal})
      : super(const _Initial()) {
    on<MaterialReceiveQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: (purchaseOrder) async {
            emit(const _Loading());
            try {
              final materialReceive =
                  await MaterialRepository.instance.materialReceiveFetch(
                accessToken: UserRepositoryApp.instance.token!,
                purchaseOrder: purchaseOrder,
              );
              emit(_Loaded(materialReceive));
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          fetchById: (id) async {
            emit(const _Loading());
            try {
              final materials =
                  await MaterialRepository.instance.materialReceiveFetchById(
                accessToken: UserRepositoryApp.instance.token!,
                materialReceiveId: id,
              );
              emit(_Loaded([materials]));
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
}
