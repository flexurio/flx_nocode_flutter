import 'package:flexurio_chiron_accounting/src/app/model/cogs_detail.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'accounting_cogs_detail_query_bloc.freezed.dart';

@freezed
class AccountingCogsDetailQueryState with _$AccountingCogsDetailQueryState {
  const factory AccountingCogsDetailQueryState.initial() = _Initial;
  const factory AccountingCogsDetailQueryState.loading() = _Loading;
  const factory AccountingCogsDetailQueryState.loaded(
    List<CogsDetail> cogsDetails,
  ) = _Success;
  const factory AccountingCogsDetailQueryState.error(String error) = _Error;
}

@freezed
class AccountingCogsDetailQueryEvent with _$AccountingCogsDetailQueryEvent {
  const factory AccountingCogsDetailQueryEvent.fetch({
    required int categoryId,
    required int year,
    required int month,
    required String division,
  }) = _Fetch;
}

class AccountingCogsDetailQueryBloc extends Bloc<AccountingCogsDetailQueryEvent,
    AccountingCogsDetailQueryState> {
  AccountingCogsDetailQueryBloc() : super(const _Initial()) {
    on<AccountingCogsDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (categoryId, year, month, division) async {
          emit(const _Loading());
          try {
            final cogsDetails =
                await AccountingRepository.instance.cogsDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              categoryId: categoryId,
              year: year,
              month: month,
              division: division,
            );

            emit(_Success(cogsDetails));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
