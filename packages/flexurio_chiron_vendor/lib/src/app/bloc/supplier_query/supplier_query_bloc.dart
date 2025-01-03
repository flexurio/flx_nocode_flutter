import 'package:flexurio_chiron_vendor/src/app/model/supplier.dart';
import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/material_request_repository.dart';

part 'supplier_query_bloc.freezed.dart';

@freezed
class SupplierQueryState with _$SupplierQueryState {
  const factory SupplierQueryState.initial() = _Initial;
  const factory SupplierQueryState.loading(
    PageOptions<Supplier> pageOptions,
  ) = _Loading;
  const factory SupplierQueryState.loaded(
    PageOptions<Supplier> pageOptions,
  ) = _Success;
  const factory SupplierQueryState.error(String error) = _Error;
}

@freezed
class SupplierQueryEvent with _$SupplierQueryEvent {
  const factory SupplierQueryEvent.initialize() = _Initialize;
  const factory SupplierQueryEvent.fetch({
    PageOptions<Supplier>? pageOptions,
  }) = _Fetch;
  const factory SupplierQueryEvent.fetchFromMaterialPurchaseRequest({
    required String vendorId,
    required String purchaseRequestId,
  }) = _FetchFromMaterialApprovedVendor;
}

class SupplierQueryBloc extends Bloc<SupplierQueryEvent, SupplierQueryState> {
  SupplierQueryBloc({bool? pagination}) : super(const _Initial()) {
    on<SupplierQueryEvent>((event, emit) async {
      await event.when(
        initialize: () async {
          if (pagination == false) {
            _pageOptions = PageOptions.emptyNoLimit();
          }
          if (state is _Initial) {
            add(const SupplierQueryEvent.fetch());
          } else {
            _pageOptions = await PurchasingRepository.instance.supplierFetch(
              pageOptions: _pageOptions,
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(_Success(_pageOptions));
          }
        },
        fetchFromMaterialPurchaseRequest: (vendorId, purchaseRequestId) async {
          emit(_Loading(_pageOptions));
          try {
            final purchaseRequestDetails = await PurchaseRequestRepository
                .instance
                .purchaseRequestDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseRequestId: purchaseRequestId,
            );
            final suppliers = <Supplier>[];
            if (purchaseRequestDetails.isNotEmpty) {
              final material = purchaseRequestDetails.first.material;
              if (material != null) {
                final materialVendors = await MaterialRepository.instance
                    .materialApprovedVendorFetch(
                  accessToken: UserRepositoryApp.instance.token!,
                  vendorId: vendorId,
                  materialId: material.id,
                  pageOptions: PageOptions.emptyNoLimit(),
                );
                for (final materialVendor in materialVendors.data) {
                  final indexSupplier = suppliers.indexWhere(
                    (supplier) => supplier.id == materialVendor.supplier.id,
                  );
                  if (indexSupplier == -1) {
                    suppliers.add(materialVendor.supplier);
                  }
                }
              }
            }

            emit(
              _Success(
                PageOptions<Supplier>.empty().copyWith(data: suppliers),
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetch: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pagination == false) {
              _pageOptions = PageOptions.emptyNoLimit();
            }
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await PurchasingRepository.instance.supplierFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<Supplier> _pageOptions = PageOptions.empty();
}
