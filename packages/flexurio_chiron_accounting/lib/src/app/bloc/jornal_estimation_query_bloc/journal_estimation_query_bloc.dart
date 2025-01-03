import 'package:flexurio_chiron_accounting/src/app/model/journal_estimation.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'journal_estimation_query_bloc.freezed.dart';

@freezed
class JournalEstimationQueryState with _$JournalEstimationQueryState {
  factory JournalEstimationQueryState.initial() = _Initial;
  factory JournalEstimationQueryState.loading() = _Loading;
  factory JournalEstimationQueryState.loaded(
    List<JournalEstimation> journalEstimations,
  ) = _Loaded;
  factory JournalEstimationQueryState.error(String error) = _Error;
}

@freezed
class JournalEstimationQueryEvent with _$JournalEstimationQueryEvent {
  factory JournalEstimationQueryEvent.fetch() = _Fetch;
}

class JournalEstimationQueryBloc
    extends Bloc<JournalEstimationQueryEvent, JournalEstimationQueryState> {
  JournalEstimationQueryBloc() : super(_Initial()) {
    on<JournalEstimationQueryEvent>((event, emit) async {
      await event.when(
        fetch: () async {
          emit(_Loading());
          try {
            final journalEstimations =
                await AccountingRepository.instance.journalEstimationFetch(
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(
              _Loaded(journalEstimations),
            );
          } catch (error) {
            emit(
              _Error(
                errorMessage(error),
              ),
            );
          }
        },
      );
    });
  }
}
