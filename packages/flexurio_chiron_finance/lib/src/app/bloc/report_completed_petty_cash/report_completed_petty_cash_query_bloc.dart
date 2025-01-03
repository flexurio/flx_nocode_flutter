import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/report_completed_petty_cash.dart';
import 'package:flexurio_chiron_finance/src/app/resource/finance_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_completed_petty_cash_query_bloc.freezed.dart';


@freezed
class ReportCompletedPettyCashQueryState
    with _$ReportCompletedPettyCashQueryState {
  const factory ReportCompletedPettyCashQueryState.initial() =
      _Initial;
  const factory ReportCompletedPettyCashQueryState.loading(
    PageOptions<ReportCompletedPettyCash> pageOptions,
  ) = _Loading;
  const factory ReportCompletedPettyCashQueryState.loaded(
    PageOptions<ReportCompletedPettyCash> pageOptions,
  ) = _Loaded;
  const factory ReportCompletedPettyCashQueryState.error(
    String error,
  ) = _Error;
}

@freezed
class ReportCompletedPettyCashQueryEvent
    with _$ReportCompletedPettyCashQueryEvent {
  const factory ReportCompletedPettyCashQueryEvent.fetch({
    required DateTime? dateStart,
    required DateTime? dateEnd,
    PageOptions<ReportCompletedPettyCash>? pageOptions,
  }) = _Fetch;
}

class ReportCompletedPettyCashQueryBloc extends Bloc<
    ReportCompletedPettyCashQueryEvent,
    ReportCompletedPettyCashQueryState> {
  ReportCompletedPettyCashQueryBloc() : super(const _Initial()) {
    on<ReportCompletedPettyCashQueryEvent>((event, emit) async {
      await event.when(
        fetch: (DateTime? dateStart, DateTime? dateEnd,
            PageOptions<ReportCompletedPettyCash>? pageOptions,) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await FinanceRepository
                .instance
                .reportCompletedPettyCashFetch(
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
 PageOptions<ReportCompletedPettyCash> _pageOptions = PageOptions.empty();
}
