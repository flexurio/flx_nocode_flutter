import 'package:flexurio_chiron_ticket/src/app/model/ticket_comment.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:url_launcher/url_launcher.dart';

class CommentAttachment extends StatelessWidget {
  const CommentAttachment({required this.attachment, super.key});

  final CommentFile attachment;

  @override
  Widget build(BuildContext context) {
    late final Widget child;
    if (attachment.thumbnail != null) {
      child = AbsorbPointer(
        child: ImageNetwork(
          image: attachment.thumbnail!,
          height: 110,
          width: 110,
        ),
      );
    } else {
      child = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: FileIcon(extension: attachment.extension, name: attachment.name),
      );
    }
    return Row(
      children: [
        InkWell(
          onTap: () {
            launchUrl(
              Uri.parse(attachment.url),
              mode: LaunchMode.externalApplication,
            );
          },
          child: child,
        ),
      ],
    );
  }
}
