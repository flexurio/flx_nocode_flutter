import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_tax/src/app/model/sales_tax_report.dart';
import 'package:flexurio_chiron_tax/src/app/resource/tax_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_tax_report_query_bloc.freezed.dart';

@freezed
class SalesTaxReportQueryState
    with _$SalesTaxReportQueryState {
  const factory SalesTaxReportQueryState.initial() =
      _Initial;
  const factory SalesTaxReportQueryState.loading(
    PageOptions<SalesTaxReport> pageOptions,
  ) = _Loading;
  const factory SalesTaxReportQueryState.loaded(
    PageOptions<SalesTaxReport> pageOptions,
  ) = _Loaded;
  const factory SalesTaxReportQueryState.error(
    String error,
  ) = _Error;
}

@freezed
class SalesTaxReportQueryEvent
    with _$SalesTaxReportQueryEvent {
  const factory SalesTaxReportQueryEvent.fetch({
    required DateTime dateStart,
    required DateTime dateEnd,
    PageOptions<SalesTaxReport>? pageOptions,
  }) = _Fetch;
}

class SalesTaxReportQueryBloc extends Bloc<
    SalesTaxReportQueryEvent,
    SalesTaxReportQueryState> {
  SalesTaxReportQueryBloc() : super(const _Initial()) {
    on<SalesTaxReportQueryEvent>((event, emit) async {
      await event.when(
        fetch: (dataStart, dataEnd, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await TaxRepository
                .instance
                .fetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              dateStart: dataStart,
              dateEnd: dataEnd,
              transactionSalesType :'(UMUM / EMPOSIL)',
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
 PageOptions<SalesTaxReport> _pageOptions = PageOptions.empty();
}


// PageOptions<SalesTaxReport> _pageOptions = PageOptions.empty();