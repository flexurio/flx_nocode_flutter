import 'package:flexurio_chiron_ticket/src/app/model/ticket_comment.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_ticket/src/app/view/page/ticket_comment/widget/comment_attachment.dart';
import 'package:flexurio_chiron_ticket/src/app/view/page/ticket_comment/widget/delete_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CommentBubble extends StatelessWidget {
  const CommentBubble({
    required this.comment,
    super.key,
  });

  final TicketComment comment;

  @override
  Widget build(BuildContext context) {
    return FCard(
      padding: const EdgeInsets.all(paddingHorizontalPage),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        '${comment.userName} ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Flexible(
                      child: Text('| ${comment.userDepartment}'),
                    ),
                  ],
                ),
              ),
              const Gap(12),
              Text(
                comment.dateTime.yMMMdHm,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          const Gap(12),
          if (comment.type == CommentType.text)
            Text(comment.content)
          else
            CommentAttachment(attachment: comment.attachment!),
          Visibility(
            visible: comment.userNip == UserRepositoryApp.instance.userApp!.nip,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DeleteButton.prepare(commentId: comment.id),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
