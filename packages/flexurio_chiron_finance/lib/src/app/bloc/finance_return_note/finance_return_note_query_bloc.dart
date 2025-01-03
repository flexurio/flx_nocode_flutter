import 'package:appointment/constant/company.dart';
import 'package:appointment/constant/finance_customer.dart';
import 'package:flexurio_chiron_finance/src/app/model/finance_return_note.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'finance_return_note_query_bloc.freezed.dart';

@freezed
class FinanceReturnNoteQueryState with _$FinanceReturnNoteQueryState {
  const factory FinanceReturnNoteQueryState.initial() = _Initial;
  const factory FinanceReturnNoteQueryState.loading() = _Loading;
  const factory FinanceReturnNoteQueryState.loaded(
    List<FinanceReturnNote> returnNotes,
    Company company,
    FinanceCustomer customer,
    DateTime periodStart,
    DateTime periodEnd,
    String srpNo,
  ) = _Success;
  const factory FinanceReturnNoteQueryState.error(String error) = _Error;
}

@freezed
class FinanceReturnNoteQueryEvent with _$FinanceReturnNoteQueryEvent {
  const factory FinanceReturnNoteQueryEvent.fetch({
    required Company company,
    required FinanceCustomer customer,
    required DateTime periodStart,
    required DateTime periodEnd,
    required String srpNo,
  }) = _Fetch;
}

class FinanceReturnNoteQueryBloc
    extends Bloc<FinanceReturnNoteQueryEvent, FinanceReturnNoteQueryState> {
  FinanceReturnNoteQueryBloc() : super(const _Initial()) {
    on<FinanceReturnNoteQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          company,
          customer,
          periodStart,
          periodEnd,
          srpNo,
        ) async {
          emit(const _Loading());
          try {
            final start = DateFormat('yyyyMMdd').format(periodStart);
            final end = DateFormat('yyyyMMdd').format(periodEnd);

            final returnNotes =
                await FinanceRepository.instance.returnNoteFetch(
              accessToken: UserRepositoryApp.instance.token!,
              companyId: company.id,
              customerCode: customer.id,
              periodEnd: end,
              periodStart: start,
              srpNo: srpNo,
            );

            emit(
              _Success(
                returnNotes,
                company,
                customer,
                periodStart,
                periodEnd,
                srpNo,
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
