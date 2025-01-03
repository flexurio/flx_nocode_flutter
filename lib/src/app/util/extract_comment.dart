import 'package:flexurio_chiron_ticket/src/app/model/ticket_comment.dart';

Comment extractComment(String text) {
  final lines = text.split('\n');
  final data = lines[0].split('|');
  final type = data[3].trim() == 'file' ? CommentType.file : CommentType.text;
  final content = <String>[];
  for (var i = 2; i < lines.length; i++) {
    content.add(lines[i]);
  }
  return Comment(
    name: data[0].trim(),
    nip: data[1].trim(),
    department: data[2].trim(),
    type: type,
    content: content.join('\n'),
  );
}
