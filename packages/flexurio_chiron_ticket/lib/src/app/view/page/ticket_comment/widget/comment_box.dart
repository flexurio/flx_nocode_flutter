import 'package:flexurio_chiron_ticket/src/app/bloc/ticket_comment/ticket_comment_bloc.dart';
import 'package:flexurio_chiron_ticket/src/app/bloc/ticket_comment_query/ticket_comment_query_bloc.dart';
import 'package:flexurio_chiron_ticket/src/app/model/ticket.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CommentBox extends StatefulWidget {
  const CommentBox({
    required this.ticket,
    super.key,
  });
  final Ticket ticket;

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  final _controller = TextEditingController();
  PlatformFile? _attachment;

  @override
  Widget build(BuildContext context) {
    return BlocListener<TicketCommentBloc, TicketCommentState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (ticketCommentId) {
            _controller.text = '';
            context.read<TicketCommentQueryBloc>().add(
                  const TicketCommentQueryEvent.get(),
                );
            setState(() => _attachment = null);
          },
          orElse: () {},
        );
      },
      child: FCard(
        borderRadius: BorderRadius.circular(12),
        height: 200,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                child: _attachment != null
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: Attachment(
                          attachment: _attachment!,
                          onRemove: () {
                            setState(() => _attachment = null);
                          },
                        ),
                      )
                    : TextField(
                        controller: _controller,
                        maxLines: 4,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your comment here',
                          hintStyle: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 12,
              ),
              child: Row(
                children: [
                  IconButton(
                    splashRadius: 24,
                    onPressed: () async {
                      final result = await pickFile();
                      if (result != null) {
                        setState(() {
                          _attachment = result.files.first;
                        });
                      }
                    },
                    icon: const Icon(Icons.attach_file_outlined),
                  ),
                  const Spacer(),
                  BlocBuilder<TicketCommentBloc, TicketCommentState>(
                    builder: (context, ticketCommentState) {
                      return BlocBuilder<TicketCommentQueryBloc,
                          TicketCommentQueryState>(
                        builder: (context, ticketCommentQueryState) {
                          return ticketCommentQueryState.maybeWhen(
                            loaded: (comments) {
                              return _buildCommentButton(
                                ticketCommentState,
                                context,
                                ticketCommentQueryState,
                              );
                            },
                            orElse: SizedBox.new,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Button _buildCommentButton(
    TicketCommentState ticketCommentState,
    BuildContext context,
    TicketCommentQueryState ticketCommentQueryState,
  ) {
    return Button(
      permission: null,
      isInProgress: ticketCommentState.maybeWhen(
        orElse: () => false,
        loading: () => true,
      ),
      action: _attachment != null ? DataAction.upload : DataAction.comment,
      onPressed: () {
        final participantsNip = ticketCommentQueryState.maybeWhen(
          orElse: () => <String>[],
          loaded: (comments) => comments.map((e) => e.userNip).toList(),
        )..add(widget.ticket.requesterNip);
        context.read<TicketCommentBloc>().add(
              _attachment != null
                  ? TicketCommentEvent.uploadAttachment(
                      _attachment!,
                      widget.ticket,
                      participantsNip,
                    )
                  : TicketCommentEvent.comment(
                      _controller.text,
                      widget.ticket,
                      participantsNip,
                    ),
            );
      },
    );
  }
}

class Attachment extends StatelessWidget {
  const Attachment({
    required this.attachment,
    required this.onRemove,
    super.key,
  });

  final PlatformFile attachment;
  final void Function() onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${attachment.name} '
            '(${(attachment.size / (1024 * 1024)).toStringAsFixed(2)} MB)',
          ),
          const Gap(8),
          InkWell(
            onTap: onRemove,
            child: const Tooltip(
              message: 'Remove file',
              child: Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
