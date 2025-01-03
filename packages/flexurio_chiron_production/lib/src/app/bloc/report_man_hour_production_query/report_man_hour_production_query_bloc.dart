import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/src/app/model/report_man_hour_production.dart';
import 'package:flexurio_chiron_production/src/app/resource/schedule_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_man_hour_production_query_bloc.freezed.dart';

@freezed
class ReportManHourProductionQueryState with _$ReportManHourProductionQueryState{
  const factory ReportManHourProductionQueryState.initial() = _Initial;
  const factory ReportManHourProductionQueryState.loading(
    PageOptions<ReportManHourProduction> pageOptions,
  ) = _Loading;
  const factory ReportManHourProductionQueryState.loaded(
    PageOptions<ReportManHourProduction> pageOptions,
  ) = _Success;
  const factory ReportManHourProductionQueryState.error(String error) = _Error;
}

@freezed
class ReportManHourProductionQueryEvent with _$ReportManHourProductionQueryEvent {
  const factory ReportManHourProductionQueryEvent.fetch({
    required DateTime? period,
    required Product? product,
    required String? batchNo,
    PageOptions<ReportManHourProduction>? pageOptions,
  }) = _Fetch;
}

class ReportManHourProductionQueryBloc extends Bloc<ReportManHourProductionQueryEvent, ReportManHourProductionQueryState> {
  ReportManHourProductionQueryBloc({
    required this.isExternal,
  }) : super(const _Initial()){
    on<ReportManHourProductionQueryEvent>((event, emit) async {
      await event.when(
        fetch: (period, product, batchNo, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await ScheduleRepository.instance.reportManHourProductionFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              period: period,
              product: product,
              batchNo:batchNo,
              isExternal: isExternal,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  final bool isExternal;
  PageOptions<ReportManHourProduction> _pageOptions = PageOptions.empty(
);
}
