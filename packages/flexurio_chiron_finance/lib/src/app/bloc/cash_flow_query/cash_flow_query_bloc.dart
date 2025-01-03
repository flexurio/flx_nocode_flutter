import 'package:appointment/constant/company.dart';
import 'package:flexurio_chiron_finance/src/app/model/cash_flow.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cash_flow_query_bloc.freezed.dart';

@freezed
class CashFlowQueryState with _$CashFlowQueryState {
  const factory CashFlowQueryState.initial() = _Initial;
  const factory CashFlowQueryState.loading() = _Loading;
  const factory CashFlowQueryState.loaded(
    List<CashFlow> cashFlows,
    Company company,
  ) = _Success;
  const factory CashFlowQueryState.error(String error) = _Error;
}

@freezed
class CashFlowQueryEvent with _$CashFlowQueryEvent {
  const factory CashFlowQueryEvent.fetch({
    Company? company,
    String? transactionNo,
    DateTime? periodStart,
    DateTime? periodEnd,
  }) = _Fetch;
}

class CashFlowQueryBloc extends Bloc<CashFlowQueryEvent, CashFlowQueryState> {
  CashFlowQueryBloc() : super(const _Initial()) {
    on<CashFlowQueryEvent>((event, emit) async {
      await event.when(
        fetch: (company, transactionNo, periodStart, periodEnd) async {
          emit(const _Loading());
          try {
            if (company != null) {
              _company = company;
            }
            if (transactionNo != null) {
              _transactionNo = transactionNo;
            }
            if (periodStart != null) {
              _periodStart = periodStart;
            }
            if (periodEnd != null) {
              _periodEnd = periodEnd;
            }

            final cashFlows = await FinanceRepository.instance.cashFlowFetch(
              accessToken: UserRepositoryApp.instance.token!,
              company: _company,
              transactionNo: _transactionNo,
              periodStart: _periodStart,
              periodEnd: _periodEnd,
            );
            emit(_Success(cashFlows, _company));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  late Company _company;
  String? _transactionNo;
  DateTime? _periodStart;
  DateTime? _periodEnd;
}
