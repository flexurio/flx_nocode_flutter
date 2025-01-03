import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/request_form_detail.dart';
import 'package:appointment/src/app/resource/material_request_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'request_form_detail_query_bloc.freezed.dart';

@freezed
class RequestFormDetailQueryState with _$RequestFormDetailQueryState {
  const factory RequestFormDetailQueryState.initial() = _Initial;
  const factory RequestFormDetailQueryState.loading(
    PageOptions<RequestFormDetail> pageOptions,
  ) = _Loading;
  const factory RequestFormDetailQueryState.loaded(
    PageOptions<RequestFormDetail> pageOptions,
  ) = _Success;
  const factory RequestFormDetailQueryState.error(String error) = _Error;
}

@freezed
class RequestFormDetailQueryEvent with _$RequestFormDetailQueryEvent {
  const factory RequestFormDetailQueryEvent.fetch({
    required MaterialRequest materialRequest,
    RequestFormDetailStatus? status,
    PageOptions<RequestFormDetail>? pageOptions,
  }) = _Fetch;
  const factory RequestFormDetailQueryEvent.fetchAll({
    PurchaseRequestStatus? status,
    Department? department,
    MaterialGroup? materialGroup,
    bool? isRequestForm,
    PageOptions<RequestFormDetail>? pageOptions,
    List<Department>? departments,
  }) = _FetchAll;
}

class RequestFormDetailQueryBloc
    extends Bloc<RequestFormDetailQueryEvent, RequestFormDetailQueryState> {
  RequestFormDetailQueryBloc() : super(const _Initial()) {
    on<RequestFormDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (materialRequest, status, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions =
                await PurchaseRequestRepository.instance.requestFormDetailFetch(
              materialRequest: materialRequest,
              accessToken: UserRepositoryApp.instance.token!,
              status: status,
              pageOptions: _pageOptions,
            );

            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetchAll: (
          status,
          department,
          materialGroup,
          isRequestForm,
          pageOptions,
          departments,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions = await PurchaseRequestRepository.instance
                .requestFormAllDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              status: status,
              department: department,
              departments: departments,
              materialGroup: materialGroup,
              isRequestForm: isRequestForm,
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
  PageOptions<RequestFormDetail> _pageOptions = PageOptions.empty();
}
