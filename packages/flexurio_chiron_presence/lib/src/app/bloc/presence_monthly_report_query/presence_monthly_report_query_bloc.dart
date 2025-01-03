import 'package:flexurio_chiron_presence/src/app/model/presence.dart';
import 'package:appointment/src/app/resource/presence_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:appointment/src/app/util/presence_group_by_user.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'presence_monthly_report_query_bloc.freezed.dart';

@freezed
class PresenceMonthlyReportQueryState with _$PresenceMonthlyReportQueryState {
  const factory PresenceMonthlyReportQueryState.initial() = _Initial;
  const factory PresenceMonthlyReportQueryState.loading() = _Loading;
  const factory PresenceMonthlyReportQueryState.loaded(
    Map<String, Map<int, Presence>> presences,
    DateTime startDateTime,
  ) = _Success;
  const factory PresenceMonthlyReportQueryState.error(String error) = _Error;
}

@freezed
class PresenceMonthlyReportQueryEvent with _$PresenceMonthlyReportQueryEvent {
  const factory PresenceMonthlyReportQueryEvent.get(int year, int month) = _Get;
}

class PresenceMonthlyReportQueryBloc extends Bloc<
    PresenceMonthlyReportQueryEvent, PresenceMonthlyReportQueryState> {
  PresenceMonthlyReportQueryBloc() : super(const _Initial()) {
    on<PresenceMonthlyReportQueryEvent>(
      (event, emit) async {
        await event.when(
          get: (year, month) async {
            emit(const _Loading());
            try {
              final presences =
                  await PresenceRepository.instance.monthlyAllEmployeeFetch(
                accessToken: UserRepositoryApp.instance.token!,
                year: year,
                month: month,
              );
              final presenceUsers = presenceGroupByUser(presences);
              final startDateTime = DateTime(year, month);
              emit(_Success(presenceUsers, startDateTime));
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
      transformer: restartable(),
    );
  }
}
