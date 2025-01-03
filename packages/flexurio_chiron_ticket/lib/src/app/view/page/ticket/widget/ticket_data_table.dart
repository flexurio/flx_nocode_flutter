import 'package:appointment/constant/ticket_status.dart';
import 'package:flexurio_chiron_ticket/src/app/bloc/ticket_query/ticket_query_bloc.dart';
import 'package:flexurio_chiron_ticket/src/app/model/ticket.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_ticket/src/app/view/page/ticket/widget/delete_button.dart';
import 'package:flexurio_chiron_ticket/src/app/view/page/ticket_comment/ticket_comment_page.dart';
import 'package:flexurio_chiron_ticket/src/app/view/page/ticket_create/ticket_create_page.dart';
import 'package:appointment/src/app/view/widget/data_table_set.dart';
import 'package:appointment/src/app/view/widget/sliding_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class TicketDataTable extends StatefulWidget {
  const TicketDataTable._({
    required this.department,
  });

  final String department;

  static Widget prepare({required String department}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              TicketQueryBloc(department)..add(const TicketQueryEvent.get()),
        ),
      ],
      child: TicketDataTable._(department: department),
    );
  }

  @override
  State<TicketDataTable> createState() => _TicketDataTableState();
}

class _TicketDataTableState extends State<TicketDataTable> {
  DataAction _value = DataAction.active;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketQueryBloc, TicketQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableSetJanganDipakaiLagi<Ticket>(
            isError: state.maybeWhen(error: (_) => true, orElse: () => false),
            onRefresh: () {
              context.read<TicketQueryBloc>().add(const TicketQueryEvent.get());
              _value = DataAction.active;
            },
            key: ValueKey(state.hashCode),
            isProgress: state.maybeWhen(
              loading: (_) => true,
              orElse: () => false,
            ),
            data: state.maybeWhen(
              loaded: (tickets) => tickets,
              loading: (tickets) => tickets,
              orElse: () => [],
            ),
            title: '${widget.department} Tickets',
            search: (ticket) => [
              ticket.name,
              ticket.tags.first.name,
              ticket.status.status,
              ticket.assignee?.username,
            ],
            actionRight: <Widget>[
              SlidingSwitch<DataAction>(
                value: _value,
                onToggle: (category) {
                  setState(() {
                    _value = category;
                  });

                  if (_value == DataAction.archive) {
                    context.read<TicketQueryBloc>().add(
                          const TicketQueryEvent.get(isArchived: true),
                        );
                  } else {
                    context.read<TicketQueryBloc>().add(
                          const TicketQueryEvent.get(),
                        );
                  }
                },
                options: const [
                  DataAction.active,
                  DataAction.archive,
                ],
                getLabel: (category) => category.title,
              ),
              _CreateButton(department: widget.department),
            ],
            columns: [
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Title'),
                  sortString: (ticket) => ticket.name,
                ),
                body: (ticket) => DataCell(
                  Tooltip(
                    message: '${ticket.name}\n\n${ticket.description}',
                    child: SizedBox(
                      width: 250,
                      child: Text(
                        ticket.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Tag'),
                  sortString: (ticket) => ticket.tags.first.name,
                ),
                body: (ticket) => DataCell(
                  Wrap(
                    children: [
                      for (final tag in ticket.tags)
                        // TODO(suhal): utilize ChipType
                        Chip(
                          label: Text(
                            tag.name,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: colorFromHex(tag.tagBg),
                        ),
                    ],
                  ),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Status'),
                  sortString: (ticket) => ticket.status.status,
                ),
                body: (ticket) => DataCell(
                  // TODO(suhal): utilize ChipType
                  Chip(
                    label: Text(ticket.status.status),
                    backgroundColor: colorFromHex(ticket.status.color),
                  ),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Assignee'),
                  sortString: (ticket) => ticket.assignee?.username ?? '',
                ),
                body: (ticket) => DataCell(
                  (ticket.assignee != null)
                      ? _Assignee(assignee: ticket.assignee!)
                      : const SizedBox(),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Due'),
                  sortString: (ticket) => ticket.dueDate ?? '',
                ),
                body: (ticket) => DataCell(
                  Text(
                    ticket.due != null ? ticket.due!.yMMMd : '',
                  ),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Requester'),
                  sortString: (ticket) => ticket.requesterName,
                ),
                body: (ticket) => DataCell(Text(ticket.requesterName)),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: Text('created_at'.tr()),
                  sortNum: (ticket) => ticket.createdAt.millisecond,
                ),
                body: (ticket) => DataCell(
                  Text(
                    DateFormat.yMMMd().add_Hm().format(ticket.createdAt),
                  ),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Updated At'),
                  sortNum: (ticket) => ticket.updatedAt.millisecond,
                ),
                body: (ticket) => DataCell(
                  Text(
                    DateFormat.yMMMd().add_Hm().format(ticket.updatedAt),
                  ),
                ),
              ),
              DTColumnX(
                head: const DTHeadX(
                  label: Text('Actions'),
                ),
                body: (ticket) => DataCell(
                  Row(
                    children: [
                      _CommentButton(ticket: ticket),
                      Visibility(
                        visible: ticket.status.status == ticketStatusOpen &&
                            ticket.requesterNip ==
                                UserRepositoryApp.instance.userApp!.nip,
                        child: DeleteButton.prepare(ticketId: ticket.id),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Assignee extends StatelessWidget {
  const _Assignee({
    required this.assignee,
  });

  final Assignee assignee;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: colorFromHex(assignee.color),
          foregroundColor: Colors.white,
          child: Text(
            assignee.initials,
            style: const TextStyle(fontSize: 12),
          ),
        ),
        const Gap(6),
        Text(assignee.username),
      ],
    );
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton({
    required this.department,
  });

  final String department;

  @override
  Widget build(BuildContext context) {
    return Button(
      permission: null,
      action: DataAction.create,
      onPressed: () async {
        final ticketQueryBloc = context.read<TicketQueryBloc>();
        final success = await Navigator.push(
          context,
          TicketCreatePage.route(
            department: department,
          ),
        );
        if (success ?? false) {
          ticketQueryBloc.add(
            const TicketQueryEvent.get(),
          );
        }
      },
    );
  }
}

class _CommentButton extends StatelessWidget {
  const _CommentButton({
    required this.ticket,
  });

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: null,
      action: DataAction.comment,
      onPressed: () {
        Navigator.push(context, TicketCommentPage.route(ticket: ticket));
      },
    );
  }
}
