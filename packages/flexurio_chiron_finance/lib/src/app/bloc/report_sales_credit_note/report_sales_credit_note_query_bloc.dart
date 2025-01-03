import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/report_sales_credit_note.dart';
import 'package:flexurio_chiron_finance/src/app/resource/finance_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_sales_credit_note_query_bloc.freezed.dart';


@freezed
class ReportSalesCreditNoteQueryState
    with _$ReportSalesCreditNoteQueryState {
  const factory ReportSalesCreditNoteQueryState.initial() =
      _Initial;
  const factory ReportSalesCreditNoteQueryState.loading(
    PageOptions<ReportSalesCreditNote> pageOptions,
  ) = _Loading;
  const factory ReportSalesCreditNoteQueryState.loaded(
    PageOptions<ReportSalesCreditNote> pageOptions,
  ) = _Loaded;
  const factory ReportSalesCreditNoteQueryState.error(
    String error,
  ) = _Error;
}

@freezed
class ReportSalesCreditNoteQueryEvent
    with _$ReportSalesCreditNoteQueryEvent {
  const factory ReportSalesCreditNoteQueryEvent.fetch({
    required DateTime? dateStart,
    required DateTime? dateEnd,
    PageOptions<ReportSalesCreditNote>? pageOptions,
  }) = _Fetch;
}

class ReportSalesCreditNoteQueryBloc extends Bloc<
    ReportSalesCreditNoteQueryEvent,
    ReportSalesCreditNoteQueryState> {
  ReportSalesCreditNoteQueryBloc() : super(const _Initial()) {
    on<ReportSalesCreditNoteQueryEvent>((event, emit) async {
      await event.when(
        fetch: (DateTime? dateStart, DateTime? dateEnd,
            PageOptions<ReportSalesCreditNote>? pageOptions,) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await FinanceRepository
                .instance
                .reportSalesCreditNoteFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              dateStart: dateStart,
              dateEnd: dateEnd,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
 PageOptions<ReportSalesCreditNote> _pageOptions = PageOptions.empty();
}
