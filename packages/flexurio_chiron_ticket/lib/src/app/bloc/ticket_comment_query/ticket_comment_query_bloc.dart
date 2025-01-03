import 'package:flexurio_chiron_ticket/src/app/model/ticket_comment.dart';
import 'package:appointment/src/app/resource/ticket_comment_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_comment_query_bloc.freezed.dart';

@freezed
class TicketCommentQueryState with _$TicketCommentQueryState {
  const factory TicketCommentQueryState.initial() = _Initial;
  const factory TicketCommentQueryState.loading() = _Loading;
  const factory TicketCommentQueryState.loaded(List<TicketComment> comments) =
      _Load;
  const factory TicketCommentQueryState.error(String error) = _Error;
}

@freezed
class TicketCommentQueryEvent with _$TicketCommentQueryEvent {
  const factory TicketCommentQueryEvent.get() = _Get;
}

class TicketCommentQueryBloc
    extends Bloc<TicketCommentQueryEvent, TicketCommentQueryState> {
  TicketCommentQueryBloc(this.ticketId) : super(const _Initial()) {
    on<TicketCommentQueryEvent>((event, emit) async {
      await event.when(
        get: () async {
          emit(const _Loading());
          try {
            final comments = await TicketCommentRepository.instance.get(
              ticketId: ticketId,
            );
            emit(_Load(comments.reversed.toList()));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  final String ticketId;
}
