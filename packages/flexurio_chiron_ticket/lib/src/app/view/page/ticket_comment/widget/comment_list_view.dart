import 'package:flexurio_chiron_ticket/src/app/bloc/ticket_comment_query/ticket_comment_query_bloc.dart';
import 'package:flexurio_chiron_ticket/src/app/view/page/ticket_comment/widget/comment_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentListView extends StatefulWidget {
  const CommentListView({
    super.key,
  });

  @override
  State<CommentListView> createState() => _CommentListViewState();
}

class _CommentListViewState extends State<CommentListView> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketCommentQueryBloc, TicketCommentQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (comments) {
            Future.delayed(const Duration(milliseconds: 100), () {
              _controller.animateTo(
                _controller.position.maxScrollExtent,
                curve: Curves.ease,
                duration: const Duration(milliseconds: 500),
              );
            });
            return ListView.builder(
              shrinkWrap: true,
              controller: _controller,
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CommentBubble(
                    comment: comments[index],
                  ),
                );
              },
            );
          },
          orElse: SizedBox.new,
        );
      },
    );
  }
}
