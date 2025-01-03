import 'package:flexurio_chiron_ticket/src/app/bloc/ticket_comment/ticket_comment_bloc.dart';
import 'package:flexurio_chiron_ticket/src/app/bloc/ticket_comment_query/ticket_comment_query_bloc.dart';
import 'package:flexurio_chiron_ticket/src/app/model/ticket.dart';
import 'package:flexurio_chiron_ticket/src/app/view/page/ticket_comment/widget/comment_box.dart';
import 'package:flexurio_chiron_ticket/src/app/view/page/ticket_comment/widget/comment_list_view.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:screen_identifier/screen_identifier.dart';

class TicketCommentPage extends StatelessWidget {
  const TicketCommentPage._({required this.ticket});

  final Ticket ticket;

  static Widget prepare({required Ticket ticket}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TicketCommentBloc()),
        BlocProvider(
          create: (context) => TicketCommentQueryBloc(ticket.id)
            ..add(
              const TicketCommentQueryEvent.get(),
            ),
        ),
      ],
      child: TicketCommentPage._(ticket: ticket),
    );
  }

  static Route<bool?> route({required Ticket ticket}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: TicketCommentPage.prepare(ticket: ticket),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ScreenIdentifierBuilder(
          builder: (context, screenIdentifier) {
            return screenIdentifier.conditions(
              sm: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BackButton(),
                  Expanded(
                    child: ListView(
                      children: [
                        _TicketDescription(ticket: ticket),
                        const Gap(24),
                        const Text(
                          'Comments',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(6),
                        const CommentListView(),
                      ],
                    ),
                  ),
                  const Gap(12),
                  CommentBox(ticket: ticket),
                ],
              ),
              md: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BackButton(),
                        _TicketDescription(ticket: ticket),
                      ],
                    ),
                  ),
                  const SizedBox(width: 48),
                  Expanded(
                    child: _CommentPanel(ticket: ticket),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _TicketDescription extends StatelessWidget {
  const _TicketDescription({
    required this.ticket,
  });

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(12),
        TicketInfo(ticket: ticket),
      ],
    );
  }
}

class _CommentPanel extends StatelessWidget {
  const _CommentPanel({
    required this.ticket,
  });

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: CommentListView()),
        const Gap(12),
        CommentBox(ticket: ticket),
      ],
    );
  }
}

class TicketInfo extends StatelessWidget {
  const TicketInfo({
    required this.ticket,
    super.key,
  });

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return FCard(
      padding: const EdgeInsets.all(paddingHorizontalPage),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ticket.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Gap(12),
          Text(ticket.description),
        ],
      ),
    );
  }
}
