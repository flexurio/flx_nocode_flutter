import 'package:flexurio_chiron_ticket/src/app/bloc/ticket/ticket_bloc.dart';
import 'package:flexurio_chiron_ticket/src/app/bloc/ticket_query/ticket_query_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton._({
    required this.ticketId,
  });

  static Widget prepare({
    required String ticketId,
  }) {
    return BlocProvider(
      create: (context) => TicketBloc(),
      child: DeleteButton._(ticketId: ticketId),
    );
  }

  final String ticketId;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      action: DataAction.delete,
      onPressed: () async {
        final ticketBloc = context.read<TicketBloc>();
        final ticketQueryBloc = context.read<TicketQueryBloc>();
        final success = await _showConfirmationDialog(context, ticketBloc);
        if (success ?? false) {
          ticketQueryBloc.add(const TicketQueryEvent.get());
        }
      },
      permission: null,
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    TicketBloc ticketBloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<TicketBloc, TicketState>(
          bloc: ticketBloc,
          listener: (context, state) {
            state.maybeWhen(
              success: (ticketId) {
                Navigator.pop(context, true);
              },
              orElse: () {},
            );
          },
          child: BlocBuilder<TicketBloc, TicketState>(
            bloc: ticketBloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.ticket,
                label: ticketId,
                onConfirm: () {
                  ticketBloc.add(TicketEvent.delete(ticketId));
                },
              );
            },
          ),
        );
      },
    );
  }
}
