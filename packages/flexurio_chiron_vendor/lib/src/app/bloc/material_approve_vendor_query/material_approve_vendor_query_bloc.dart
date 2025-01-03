import 'package:flexurio_chiron_vendor/src/app/model/material_approved_vendor.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_approve_vendor_query_bloc.freezed.dart';

@freezed
class MaterialApproveVendorQueryState with _$MaterialApproveVendorQueryState {
  const factory MaterialApproveVendorQueryState.initial() = _Initial;
  const factory MaterialApproveVendorQueryState.loading(
    PageOptions<MaterialApprovedVendor> pageOptions,
  ) = _Loading;
  const factory MaterialApproveVendorQueryState.loaded(
    PageOptions<MaterialApprovedVendor> pageOptions,
  ) = _Success;
  const factory MaterialApproveVendorQueryState.error(String error) = _Error;
}

@freezed
class MaterialApproveVendorQueryEvent with _$MaterialApproveVendorQueryEvent {
  const factory MaterialApproveVendorQueryEvent.initialize() = _Initialize;
  const factory MaterialApproveVendorQueryEvent.fetch({
    PageOptions<MaterialApprovedVendor>? pageOptions,
    Material? material,
  }) = _Fetch;
}

class MaterialApproveVendorQueryBloc extends Bloc<
    MaterialApproveVendorQueryEvent, MaterialApproveVendorQueryState> {
  MaterialApproveVendorQueryBloc() : super(const _Initial()) {
    on<MaterialApproveVendorQueryEvent>((event, emit) async {
      await event.when(
        initialize: () async {
          if (state is _Initial) {
            add(const MaterialApproveVendorQueryEvent.fetch());
          } else {
            _pageOptions =
                await MaterialRepository.instance.materialApprovedVendorFetch(
              pageOptions: _pageOptions,
              accessToken: UserRepositoryApp.instance.token!,
              // material: material,
            );
            emit(_Success(_pageOptions));
          }
        },
        fetch: (pageOptions, material) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await MaterialRepository.instance.materialApprovedVendorFetch(
              accessToken: UserRepositoryApp.instance.token!,
              materialId: material?.id,
              pageOptions: _pageOptions,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
      );
    });
  }
  PageOptions<MaterialApprovedVendor> _pageOptions = PageOptions.empty();
}
