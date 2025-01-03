import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/cash_flow/util/generate_code_and_sub_code.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_core/src/app/model/string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cash_flow_code_query_bloc.freezed.dart';

@freezed
class CashFlowCodeQueryState with _$CashFlowCodeQueryState {
  const factory CashFlowCodeQueryState.initial() = _Initial;
  const factory CashFlowCodeQueryState.loading() = _Loading;
  const factory CashFlowCodeQueryState.loaded(
    Map<String, List<String>> code,
  ) = _Success;
  const factory CashFlowCodeQueryState.error(String error) = _Error;
}

@freezed
class CashFlowCodeQueryEvent with _$CashFlowCodeQueryEvent {
  const factory CashFlowCodeQueryEvent.fetch() = _Get;
}

class CashFlowCodeQueryBloc
    extends Bloc<CashFlowCodeQueryEvent, CashFlowCodeQueryState> {
  CashFlowCodeQueryBloc() : super(const _Initial()) {
    on<CashFlowCodeQueryEvent>((event, emit) async {
      await event.when(
        fetch: () async {
          emit(const _Loading());
          try {
            final cashFlowCodes =
                await FinanceRepository.instance.cashFlowCodeFetch(
              accessToken: UserRepositoryApp.instance.token!,
            );
            final generateCodeAndSubCodes =
                generateCodeAndSubCode(cashFlowCodes);
            emit(_Success(generateCodeAndSubCodes));
          } catch (error) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
      );
    });
  }
}
