import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_vendor/src/app/model/vendors.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_query_bloc.freezed.dart';

@freezed
class VendorQueryState with _$VendorQueryState {
  const factory VendorQueryState.initial() = _Initial;
  const factory VendorQueryState.loading(
    PageOptions<Vendor> pageOptions,
  ) = _Loading;
  const factory VendorQueryState.loaded(
    PageOptions<Vendor> pageOptions,
  ) = _Success;
  const factory VendorQueryState.error(String error) = _Error;
}

@freezed
class VendorQueryEvent with _$VendorQueryEvent {
  const factory VendorQueryEvent.initialize() = _Initialize;
  const factory VendorQueryEvent.fetch({
    PageOptions<Vendor>? pageOptions,
    Material? material,
  }) = _Fetch;
}

class VendorQueryBloc extends Bloc<VendorQueryEvent, VendorQueryState> {
  VendorQueryBloc({bool? pagination}) : super(const _Initial()) {
    on<VendorQueryEvent>((event, emit) async {
      await event.when(
        initialize: () async {
          if (pagination == false) {
            _pageOptions = PageOptions.emptyNoLimit();
          }
          if (state is _Initial) {
            add(const VendorQueryEvent.fetch());
          } else {
            _pageOptions = await PurchasingRepository.instance.vendorFetch(
              pageOptions: _pageOptions,
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(_Success(_pageOptions));
          }
        },
        fetch: (pageOptions, material) async {
          if (pagination ?? false == false) {
            _pageOptions = PageOptions.emptyNoLimit();
          }
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions = await PurchasingRepository.instance.vendorFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
            );

            if (material != null) {
              await MaterialRepository.instance.materialApprovedVendorFetch(
                accessToken: UserRepositoryApp.instance.token!,
                materialId: material.id,
                pageOptions: PageOptions.empty(),
              );
            }
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<Vendor> _pageOptions = PageOptions.empty();
}
