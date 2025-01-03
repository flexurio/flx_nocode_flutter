import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/src/app/model/production_data_report.dart';
import 'package:flexurio_chiron_production/src/app/resource/production_data_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_data_report_query_bloc.freezed.dart';

@freezed
class ProductionDataReportQueryState with _$ProductionDataReportQueryState{
  const factory ProductionDataReportQueryState.initial() = _Initial;
  const factory ProductionDataReportQueryState.loading(
    PageOptions<ProductionDataReport> pageOptions,
  ) = _Loading;
  const factory ProductionDataReportQueryState.loaded(
    PageOptions<ProductionDataReport> pageOptions,
  ) = _Success;
  const factory ProductionDataReportQueryState.error(String error) = _Error;
}

@freezed
class ProductionDataReportQueryEvent with _$ProductionDataReportQueryEvent {
  const factory ProductionDataReportQueryEvent.fetch({
    required DateTime periodStart,
    required DateTime periodEnd,
    required Product product,
    PageOptions<ProductionDataReport>? pageOptions,
  }) = _Fetch;
}

class ProductionDataReportQueryBloc extends Bloc<ProductionDataReportQueryEvent, ProductionDataReportQueryState> {
  ProductionDataReportQueryBloc() : super(const _Initial()) {
    on<ProductionDataReportQueryEvent>((event, emit) async {
      await event.when(
        fetch: (periodStart, periodEnd, product, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await ProductionDataReportRepository.instance.productionDataReportFetch(
              accessToken: UserRepositoryApp.instance.token!,
              periodStart: periodStart,
              periodEnd: periodEnd,
              product: product,
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
  PageOptions<ProductionDataReport> _pageOptions = PageOptions.empty(
    sortBy: 'actual_start_time',
  );
}
