import 'dart:async';

import 'package:flexurio_chiron_ticket/src/app/model/ticket.dart';
import 'package:flexurio_chiron_ticket/src/app/model/ticket_comment.dart';
import 'package:appointment/src/app/model/user.dart';
import 'package:appointment/src/app/resource/email_repository.dart';
import 'package:appointment/src/app/resource/ticket_comment_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_comment_bloc.freezed.dart';

@freezed
class TicketCommentState with _$TicketCommentState {
  const factory TicketCommentState.initial() = _Initial;
  const factory TicketCommentState.loading() = _Loading;
  const factory TicketCommentState.success(int commentId) = _Success;
  const factory TicketCommentState.error(String error) = _Error;
}

@freezed
class TicketCommentEvent with _$TicketCommentEvent {
  const factory TicketCommentEvent.comment(
    String content,
    Ticket ticket,
    List<String> participantsNip,
  ) = _Create;
  const factory TicketCommentEvent.uploadAttachment(
    PlatformFile attachment,
    Ticket ticket,
    List<String> participantsNip,
  ) = _UploadAttachment;
  const factory TicketCommentEvent.delete(String ticketCommentId) = _Delete;
}

class TicketCommentBloc extends Bloc<TicketCommentEvent, TicketCommentState> {
  TicketCommentBloc() : super(const _Initial()) {
    on<TicketCommentEvent>((event, emit) async {
      await event.when(
        comment: (
          content,
          ticket,
          participantsNip,
        ) async {
          emit(const _Loading());

          try {
            final user = UserRepositoryApp.instance.userApp!;
            final department = UserRepositoryApp.instance.department;
            final ticketCommentId =
                await TicketCommentRepository.instance.create(
              ticketId: ticket.id,
              content: content,
              department: department?.name ?? 'Unknown',
              name: user.name,
              nip: user.nip,
            );
            emit(_Success(ticketCommentId));
            unawaited(_sendNotifyEmail(ticket, user, content, participantsNip));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        uploadAttachment: (attachment, ticket, participantsNip) async {
          final user = UserRepositoryApp.instance.userApp!;
          final department = UserRepositoryApp.instance.departmentTicket;
          emit(const _Loading());
          try {
            final ticketCommentId =
                await TicketCommentRepository.instance.uploadAttachment(
              department: department ?? 'Unknown',
              taskId: ticket.id,
              attachment: attachment,
              name: user.name,
              nip: user.nip,
            );
            emit(_Success(ticketCommentId));
            const content = '[upload an attachment]';
            unawaited(_sendNotifyEmail(ticket, user, content, participantsNip));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (commentId) async {
          try {
            await TicketCommentRepository.instance.delete(
              commentId: commentId,
            );
            emit(const _Success(0));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }

  Future<void> _sendNotifyEmail(
    Ticket ticket,
    UserApp user,
    String content,
    List<String> participantsNip,
  ) async {
    var participants = participantsNip;
    if (user.nip == ticket.requesterNip) {
      participants = participants
          .where((element) => element != ticket.requesterNip)
          .toList();
    }

    await EmailRepository.instance.sendEmail(
      accessToken: UserRepositoryApp.instance.token!,
      subject: 'New Comment on Ticket ${ticket.name}',
      body: await TicketComment.bodyEmailNotification(
        ticket: ticket,
        user: user,
        commentContent: content,
      ),
      to: participants,
      cc: [],
    );
  }
}
