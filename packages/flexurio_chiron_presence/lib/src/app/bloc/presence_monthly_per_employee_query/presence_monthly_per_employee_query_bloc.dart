import 'package:flexurio_chiron_presence/src/app/model/presence_employee.dart';
import 'package:appointment/src/app/resource/presence_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'presence_monthly_per_employee_query_bloc.freezed.dart';

@freezed
class PresenceMonthlyPerEmployeeQueryState
    with _$PresenceMonthlyPerEmployeeQueryState {
  const factory PresenceMonthlyPerEmployeeQueryState.initial() = _Initial;
  const factory PresenceMonthlyPerEmployeeQueryState.loading() = _Loading;
  const factory PresenceMonthlyPerEmployeeQueryState.loaded(
    Map<int, PresenceEmployee?> presence,
    DateTime dateTime,
    Employee employee,
  ) = _Loaded;
  const factory PresenceMonthlyPerEmployeeQueryState.error(String error) =
      _Error;
}

@freezed
class PresenceMonthlyPerEmployeeQueryEvent
    with _$PresenceMonthlyPerEmployeeQueryEvent {
  const factory PresenceMonthlyPerEmployeeQueryEvent.fetch({
    required Employee employee,
    required DateTime dateTime,
  }) = _Fetch;
}

class PresenceMonthlyPerEmployeeQueryBloc extends Bloc<
    PresenceMonthlyPerEmployeeQueryEvent,
    PresenceMonthlyPerEmployeeQueryState> {
  PresenceMonthlyPerEmployeeQueryBloc() : super(const _Initial()) {
    on<PresenceMonthlyPerEmployeeQueryEvent>((event, emit) async {
      await event.when(
        fetch: (employee, dateTime) async {
          emit(const _Loading());
          try {
            final presences =
                await PresenceRepository.instance.monthlyPerEmployeeFetch(
              accessToken: UserRepositoryApp.instance.token!,
              dateTime: dateTime,
              nip: employee.nip,
            );
            emit(
              _Loaded(
                _presencesByDateInMonth(presences, dateTime),
                dateTime,
                employee,
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

Map<int, PresenceEmployee?> _presencesByDateInMonth(
  List<PresenceEmployee> presences,
  DateTime initialDate,
) {
  final endDate = DateTime(initialDate.year, initialDate.month + 1)
      .subtract(const Duration(days: 1))
      .day;

  final data = <int, PresenceEmployee?>{};

  for (var i = 1; i <= endDate; i++) {
    data[i] = null;
  }

  for (final presence in presences) {
    data[presence.inDateTime.day] = presence;
  }

  return data;
}
