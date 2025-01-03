import 'package:appointment/src/app/resource/ticket_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ticket_bloc.freezed.dart';

@freezed
class TicketState with _$TicketState {
  const factory TicketState.initial() = _Initial;
  const factory TicketState.loading() = _Loading;
  const factory TicketState.success(String ticketId) = _Success;
  const factory TicketState.error(String error) = _Error;
}

@freezed
class TicketEvent with _$TicketEvent {
  const factory TicketEvent.create(
    String title,
    String description,
    String category,
    String department,
  ) = _Create;
  const factory TicketEvent.delete(String ticketId) = _Delete;
}

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(const _Initial()) {
    on<TicketEvent>((event, emit) async {
      await event.when(
        create: (title, description, category, department) async {
          emit(const _Loading());
          try {
            final user = UserRepositoryApp.instance.userApp!;
            final ticketId = await TicketRepository.instance.create(
              title: title,
              description: description,
              list: getListByDepartment(department),
              requesterName: user.name,
              requesterNip: user.nip,
              category: category,
            );
            emit(_Success(ticketId));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (taskId) async {
          emit(const _Loading());
          try {
            await TicketRepository.instance.delete(
              taskId: taskId,
            );
            emit(_Success(taskId));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
