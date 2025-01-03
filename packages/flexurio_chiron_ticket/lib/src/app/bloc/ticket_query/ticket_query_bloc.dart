import 'package:appointment/constant/user_department.dart';
import 'package:flexurio_chiron_ticket/src/app/model/ticket.dart';
import 'package:appointment/src/app/resource/ticket_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_query_bloc.freezed.dart';

@freezed
class TicketQueryState with _$TicketQueryState {
  const factory TicketQueryState.initial() = _Initial;
  const factory TicketQueryState.loading(List<Ticket> tickets) = _Loading;
  const factory TicketQueryState.loaded(List<Ticket> tickets) = _Success;
  const factory TicketQueryState.error(String error) = _Error;
}

@freezed
class TicketQueryEvent with _$TicketQueryEvent {
  const factory TicketQueryEvent.get({bool? isArchived}) = _Get;
}

class TicketQueryBloc extends Bloc<TicketQueryEvent, TicketQueryState> {
  TicketQueryBloc(this.department) : super(const _Initial()) {
    on<TicketQueryEvent>(
      (event, emit) async {
        await event.when(
          get: (isArchived) async {
            emit(const _Loading([]));
            try {
              final tickets = <Ticket>[];
              if (['VNEU', 'MANAGEMENT SYSTEM DEVELOPMENT']
                  .contains(department)) {
                for (final department in departments) {
                  tickets.addAll(
                    await TicketRepository.instance.get(
                      list: getListByDepartment(department),
                      isArchived: isArchived,
                    ),
                  );
                  emit(_Loading(List.from(tickets)));
                }

                emit(_Success(List.from(tickets)));
              } else {
                tickets.addAll(
                  await TicketRepository.instance.get(
                    list: getListByDepartment(department),
                    isArchived: isArchived,
                  ),
                );
                emit(_Success(tickets));
              }
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
      transformer: restartable(),
    );
  }
  final String department;
}
