import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/cost_report.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/cost.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cost_report_query_bloc.freezed.dart';

@freezed
class CostReportQueryState with _$CostReportQueryState {
  const factory CostReportQueryState.initial() = _Initial;
  const factory CostReportQueryState.loading(
    PageOptions<CostReport> pageOptions,
  ) = _Loading;
  const factory CostReportQueryState.loaded(
    PageOptions<CostReport> pageOptions,
  ) = _Loaded;
  const factory CostReportQueryState.error(String error) = _Error;
}

@freezed
class CostReportQueryEvent with _$CostReportQueryEvent {
  const factory CostReportQueryEvent.fetch({
    required DateTime startDate,
    required DateTime endDate,
    PageOptions<CostReport>? pageOptions,
    String? department,
  }) = _Fetch;
}

class CostReportQueryBloc
    extends Bloc<CostReportQueryEvent, CostReportQueryState> {
  CostReportQueryBloc() : super(const _Initial()) {
    on<CostReportQueryEvent>((event, emit) async {
      await event.when(
        fetch: (startDate, endDate, pageOptions, departmentId) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await CostRepository.instance.reportFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              dateStart: startDate,
              dateEnd: endDate,
              departmentId: departmentId,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<CostReport> _pageOptions = PageOptions.empty(
    sortBy: 'chart_of_account_id',
  );
}
