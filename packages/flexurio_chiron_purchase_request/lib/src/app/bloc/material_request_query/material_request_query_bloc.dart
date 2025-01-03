import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:appointment/src/app/resource/material_request_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'material_request_query_bloc.freezed.dart';

@freezed
class PurchaseRequestQueryState with _$PurchaseRequestQueryState {
  const factory PurchaseRequestQueryState.initial() = _Initial;
  const factory PurchaseRequestQueryState.loading(
    PageOptions<MaterialRequest> pageOptions,
  ) = _Loading;
  const factory PurchaseRequestQueryState.loaded(
    PageOptions<MaterialRequest> pageOptions,
  ) = _Success;
  const factory PurchaseRequestQueryState.error(String error) = _Error;
}

@freezed
class PurchaseRequestQueryEvent with _$PurchaseRequestQueryEvent {
  const factory PurchaseRequestQueryEvent.fetch({
    PageOptions<MaterialRequest>? pageOptions,
    PurchaseRequestStatus? status,
    List<Department>? departments,
    bool? isRequestForm,
    bool? isOrder,
    List<MaterialGroup>? materialGroupIdIn,
  }) = _Fetch;
}

class PurchaseRequestQueryBloc
    extends Bloc<PurchaseRequestQueryEvent, PurchaseRequestQueryState> {
  PurchaseRequestQueryBloc() : super(const _Initial()) {
    on<PurchaseRequestQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          pageOptions,
          status,
          departments,
          isRequestForm,
          isOrder,
          materialGroupIdIn,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions =
                await PurchaseRequestRepository.instance.purchaseRequestFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              status: status,
              departments: departments,
              isRequestForm: isRequestForm ?? false,
              isOrder: isOrder,
              materialGroupIdIn: materialGroupIdIn,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
      );
    });
  }
  PageOptions<MaterialRequest> _pageOptions = PageOptions.empty();
}
