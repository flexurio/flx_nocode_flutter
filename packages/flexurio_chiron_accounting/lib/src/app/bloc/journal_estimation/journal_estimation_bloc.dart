import 'package:flexurio_chiron_accounting/src/app/model/journal_estimation.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'journal_estimation_bloc.freezed.dart';

@freezed
class JournalEstimationState with _$JournalEstimationState {
  factory JournalEstimationState.initial() = _Initial;
  factory JournalEstimationState.loading() = _Loading;
  factory JournalEstimationState.success() = _Success;
  factory JournalEstimationState.error(String error) = _Error;
}

@freezed
class JournalEstimationEvent with _$JournalEstimationEvent {
  factory JournalEstimationEvent.create({
    required String id,
    required String name,
    required String type,
  }) = _Create;
  factory JournalEstimationEvent.delete({
    required JournalEstimation journalEstimation,
  }) = _Delete;
}

class JournalEstimationBloc
    extends Bloc<JournalEstimationEvent, JournalEstimationState> {
  JournalEstimationBloc() : super(_Initial()) {
    on<JournalEstimationEvent>(
      (event, emit) async {
        await event.when(
          create: (
            id,
            name,
            type,
          ) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.journalEstimationCreate(
                accessToken: UserRepositoryApp.instance.token!,
                id: id,
                name: name,
                type: type,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          delete: (journalEstimation) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.journalEstimationDelete(
                accessToken: UserRepositoryApp.instance.token!,
                journalEstimation: journalEstimation,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
}
