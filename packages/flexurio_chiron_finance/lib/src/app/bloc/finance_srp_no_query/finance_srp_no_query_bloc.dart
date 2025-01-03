import 'package:appointment/constant/company.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'finance_srp_no_query_bloc.freezed.dart';

@freezed
class FinanceSrpNoQueryState with _$FinanceSrpNoQueryState {
  const factory FinanceSrpNoQueryState.initial() = _Initial;
  const factory FinanceSrpNoQueryState.loading() = _Loading;
  const factory FinanceSrpNoQueryState.loaded(
    List<String> srp,
  ) = _Success;
  const factory FinanceSrpNoQueryState.error(String error) = _Error;
}

@freezed
class FinanceSrpNoQueryEvent with _$FinanceSrpNoQueryEvent {
  const factory FinanceSrpNoQueryEvent.fetch(Company company) = _Fetch;
}

class FinanceSrpNoQueryBloc
    extends Bloc<FinanceSrpNoQueryEvent, FinanceSrpNoQueryState> {
  FinanceSrpNoQueryBloc() : super(const _Initial()) {
    on<FinanceSrpNoQueryEvent>((event, emit) async {
      await event.when(
        fetch: (company) async {
          emit(const _Loading());
          try {
            final srp = await FinanceRepository.instance.srpNoFetch(
              accessToken: UserRepositoryApp.instance.token!,
              companyId: company.id,
            );
            emit(_Success(srp));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
