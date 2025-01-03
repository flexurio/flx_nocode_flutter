import 'package:flexurio_chiron_accounting/src/app/model/ebitda_recap.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ebitda_recap_bloc.freezed.dart';

@freezed
class EbitdaRecapQueryState with _$EbitdaRecapQueryState {
  const factory EbitdaRecapQueryState.initial() = _Initial;
  const factory EbitdaRecapQueryState.loading() = _Loading;
  const factory EbitdaRecapQueryState.loaded(
    List<EbitdaRecap> ebitdaRecaps,
  ) = _Success;
  const factory EbitdaRecapQueryState.error(String error) = _Error;
}

@freezed
class EbitdaRecapQueryEvent with _$EbitdaRecapQueryEvent {
  const factory EbitdaRecapQueryEvent.fetch(
    String period,
    String marketingAreaCode,
  ) = _Fetch;
}

class EbitdaRecapQueryBloc
    extends Bloc<EbitdaRecapQueryEvent, EbitdaRecapQueryState> {
  EbitdaRecapQueryBloc() : super(const _Initial()) {
    on<EbitdaRecapQueryEvent>((event, emit) async {
      await event.when(
        fetch: (period, marketingAreaCode) async {
          emit(const _Loading());
          try {
            final ebitdaRecaps =
                await AccountingRepository.instance.ebitdaRecapFetch(
              accessToken: UserRepositoryApp.instance.token!,
              period: period,
              marketingAreaCode: marketingAreaCode,
            );

            emit(_Success(ebitdaRecaps));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
