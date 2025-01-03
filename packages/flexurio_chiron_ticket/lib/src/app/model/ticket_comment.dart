import 'package:flexurio_chiron_ticket/src/app/model/ticket.dart';
import 'package:appointment/src/app/model/user.dart';
import 'package:appointment/src/app/util/extract_comment.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:json_annotation/json_annotation.dart';

part 'ticket_comment.g.dart';

enum CommentType { text, file }

class Comment {
  Comment({
    required this.name,
    required this.nip,
    required this.type,
    required this.content,
    required this.department,
  });

  final String name;
  final String nip;
  final String department;
  final CommentType type;
  final String content;
}

class TicketComment {
  TicketComment({
    required this.content,
    required this.type,
    required this.id,
    required this.userName,
    required this.userNip,
    required this.userDepartment,
    required this.dateTime,
    this.attachment,
  });
  factory TicketComment.fromJson(Map<String, dynamic> json) {
    late Comment comment;
    try {
      comment = extractComment(json['comment_text'] as String);
    } catch (e) {
      final user = json['user'] as Map;
      comment = Comment(
        name: user['username'] as String,
        nip: (user['id'] as int).toString(),
        type: CommentType.text,
        content: (json['comment_text'] as String).trim(),
        department: '',
      );
    }
    CommentFile? commentFile;
    if (comment.type == CommentType.file) {
      commentFile = CommentFile.fromJson(base64ToMap(comment.content));
    }

    return TicketComment(
      dateTime: DateTime.fromMillisecondsSinceEpoch(
        int.parse(json['date'] as String),
      ),
      id: json['id'] as String,
      content: comment.content,
      userName: comment.name,
      userNip: comment.nip,
      type: comment.type,
      attachment: commentFile,
      userDepartment: comment.department,
    );
  }

  final String content;
  final CommentType type;
  final CommentFile? attachment;
  final String id;
  final String userName;
  final String userNip;
  final String userDepartment;
  final DateTime dateTime;

  static Future<String> bodyEmailNotification({
    required Ticket ticket,
    required UserApp user,
    required String commentContent,
  }) async {
    final body =
        await rootBundle.loadString('asset/html/email_new_comment.html');
    return body.variableSet({
      'username': user.name,
      'ticket_name': ticket.name,
      'content': commentContent,
    });
  }
}

@JsonSerializable()
class CommentFile {
  CommentFile({
    required this.id,
    required this.name,
    required this.extension,
    required this.thumbnail,
    required this.url,
  });

  factory CommentFile.fromJson(Map<String, dynamic> json) =>
      _$CommentFileFromJson(json);

  final String id;
  final String name;
  final String extension;
  final String url;

  @JsonKey(name: 'thumbnail_medium')
  final String? thumbnail;
}
