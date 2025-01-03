import 'package:flexurio_chiron_ticket/src/app/bloc/ticket_comment/ticket_comment_bloc.dart';
import 'package:flexurio_chiron_ticket/src/app/bloc/ticket_comment_query/ticket_comment_query_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton._({
    required this.commentId,
  });

  static Widget prepare({
    required String commentId,
  }) {
    return BlocProvider(
      create: (context) => TicketCommentBloc(),
      child: DeleteButton._(commentId: commentId),
    );
  }

  final String commentId;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: null,
      action: DataAction.delete,
      onPressed: () async {
        final ticketCommentBloc = context.read<TicketCommentBloc>();
        final ticketCommentQueryBloc = context.read<TicketCommentQueryBloc>();
        final success =
            await _showConfirmationDialog(context, ticketCommentBloc);
        if (success ?? false) {
          ticketCommentQueryBloc.add(const TicketCommentQueryEvent.get());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    TicketCommentBloc ticketCommentBloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<TicketCommentBloc, TicketCommentState>(
          bloc: ticketCommentBloc,
          listener: (context, state) {
            state.maybeWhen(
              success: (ticketId) {
                Navigator.pop(context, true);
              },
              orElse: () {},
            );
          },
          child: BlocBuilder<TicketCommentBloc, TicketCommentState>(
            bloc: ticketCommentBloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.ticketComment,
                label: commentId,
                onConfirm: () {
                  ticketCommentBloc.add(TicketCommentEvent.delete(commentId));
                },
              );
            },
          ),
        );
      },
    );
  }
}
