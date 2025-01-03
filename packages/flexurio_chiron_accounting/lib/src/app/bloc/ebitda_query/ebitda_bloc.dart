import 'package:flexurio_chiron_accounting/src/app/model/ebitda.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ebitda_bloc.freezed.dart';

@freezed
class EbitdaQueryState with _$EbitdaQueryState {
  const factory EbitdaQueryState.initial() = _Initial;
  const factory EbitdaQueryState.loading() = _Loading;
  const factory EbitdaQueryState.loaded(
    Map<String, List<Ebitda>> ebitdaPerMarketingArea,
    String period,
  ) = _Success;
  const factory EbitdaQueryState.error(String error) = _Error;
}

@freezed
class EbitdaQueryEvent with _$EbitdaQueryEvent {
  const factory EbitdaQueryEvent.fetch(
    String period,
    String marketingAreaCode,
  ) = _Get;
}

class EbitdaQueryBloc extends Bloc<EbitdaQueryEvent, EbitdaQueryState> {
  EbitdaQueryBloc() : super(const _Initial()) {
    on<EbitdaQueryEvent>((event, emit) async {
      await event.when(
        fetch: (period, marketingAreaCode) async {
          emit(const _Loading());
          try {
            final ebitda = await AccountingRepository.instance.ebitdaFetch(
              accessToken: UserRepositoryApp.instance.token!,
              marketingAreaCode: marketingAreaCode,
              period: period,
            );

            final ebitdaPerMarketingArea =
                groupBy(ebitda, (ebitda) => ebitda.marketingAreaCode);

            emit(_Success(ebitdaPerMarketingArea, period));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
