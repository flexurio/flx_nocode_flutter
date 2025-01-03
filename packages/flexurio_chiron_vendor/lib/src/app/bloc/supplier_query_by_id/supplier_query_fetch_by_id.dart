import 'package:flexurio_chiron_vendor/src/app/model/supplier.dart';
import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier_query_fetch_by_id.freezed.dart';

@freezed
class SupplierQueryFetchByIdState with _$SupplierQueryFetchByIdState {
  const factory SupplierQueryFetchByIdState.initial() = _Initial;
  const factory SupplierQueryFetchByIdState.loading() = _Loading;
  const factory SupplierQueryFetchByIdState.loaded(
    Supplier suppliers,
  ) = _Loaded;
  const factory SupplierQueryFetchByIdState.error(String? error) = _Error;
}

@freezed
class SupplierQueryFetchByIdEvent with _$SupplierQueryFetchByIdEvent {
  const factory SupplierQueryFetchByIdEvent.fetch(String? supplierId) = _Fetch;
}

class SupplierQueryFetchByIdBloc
    extends Bloc<SupplierQueryFetchByIdEvent, SupplierQueryFetchByIdState> {
  SupplierQueryFetchByIdBloc() : super(const _Initial()) {
    on<SupplierQueryFetchByIdEvent>((event, emit) async {
      await event.when(
        fetch: (supplierId) async {
          emit(const _Loading());
          try {
            final suppliers =
                await PurchasingRepository.instance.supplierFetchById(
              accessToken: UserRepositoryApp.instance.token!,
              supplierId: supplierId,
            );
            emit(_Loaded(suppliers));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
