import 'package:flexurio_chiron_vendor/src/app/model/material_supplier_leadtime.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_supplier_query_bloc.freezed.dart';

@freezed
abstract class MaterialSupplierQueryState with _$MaterialSupplierQueryState {
  const factory MaterialSupplierQueryState.initial() = _Initial;
  const factory MaterialSupplierQueryState.loading() = _Loading;
  const factory MaterialSupplierQueryState.loaded(
    List<Vendor> supplier,
    List<MaterialSupplierLeadTime> materialSupplier,
  ) = _Success;
  const factory MaterialSupplierQueryState.error(String error) = _Error;
}

@freezed
abstract class MaterialSupplierQueryEvent with _$MaterialSupplierQueryEvent {
  const factory MaterialSupplierQueryEvent.getByMaterialId({
    Material? material,
  }) = _GetByMaterialId;
}

class MaterialSupplierQueryBloc
    extends Bloc<MaterialSupplierQueryEvent, MaterialSupplierQueryState> {
  MaterialSupplierQueryBloc() : super(const _Initial()) {
    on<MaterialSupplierQueryEvent>((event, emit) async {
      await event.when(
        getByMaterialId: (material) async {
          emit(const _Loading());
          try {
            final suppliers = await PurchasingRepository.instance.vendorFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: PageOptions.emptyNoLimit(),
            );

            final materialSuppliers = await MaterialRepository.instance
                .materialSupplierFetchByMaterialId(
              accessToken: UserRepositoryApp.instance.token!,
              material: material,
            );

            final idToRemove = materialSuppliers.map((item) => item.vendor.id);
            final filteredSuppliers = suppliers.data
              ..removeWhere((item) => idToRemove.contains(item.id));

            emit(
              _Success(
                filteredSuppliers,
                materialSuppliers,
              ),
            );
          } catch (error) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
      );
    });
  }
}
