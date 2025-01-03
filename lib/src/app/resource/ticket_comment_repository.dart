import 'dart:convert';

import 'package:flexurio_chiron_ticket/src/app/model/ticket_comment.dart';
import 'package:appointment/src/app/resource/click_up_repository.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class TicketCommentRepository extends ClickUpRepository {
  TicketCommentRepository({required this.dio});

  final Dio dio;
  static TicketCommentRepository instance = TicketCommentRepository(
    dio: Api.dio,
  );

  Future<int> uploadAttachment({
    required String name,
    required String nip,
    required String department,
    required PlatformFile attachment,
    required String taskId,
  }) async {
    try {
      final responseUploadAttachment = await dio.post<String>(
        '$clickUpApiUrl/task/$taskId/attachment',
        options: Options(
          headers: {RequestHeader.authorization: clickUpApiKey},
        ),
        data: FormData.fromMap({
          'attachment': MultipartFile.fromBytes(
            attachment.bytes!,
            filename: attachment.name,
          ),
        }),
      );

      final commentId = await create(
        ticketId: taskId,
        department: department,
        name: name,
        nip: nip,
        file: true,
        content: base64Encode(
          utf8.encode(responseUploadAttachment.data!),
        ),
      );

      return commentId;
    } catch (error) {
      throw ApiException('Error calling API: $error');
    }
  }

  Future<int> create({
    required String name,
    required String nip,
    required String content,
    required String department,
    required String ticketId,
    bool file = false,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        '$clickUpApiUrl/task/$ticketId/comment',
        options: Options(
          headers: {RequestHeader.authorization: clickUpApiKey},
        ),
        data: {
          'comment_text':
              '$name | $nip | $department | ${file ? 'file' : 'text'} \n'
                  '-------------------------------------\n'
                  '$content',
          'notify_all': true,
        },
      );

      return response.data!['id'] as int;
    } catch (error) {
      throw ApiException('Error calling API: $error');
    }
  }

  Future<void> delete({
    required String commentId,
    bool file = false,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$clickUpApiUrl/comment/$commentId',
        options: Options(
          headers: {RequestHeader.authorization: clickUpApiKey},
        ),
      );
    } catch (error) {
      throw ApiException('Error calling API: $error');
    }
  }

  Future<List<TicketComment>> get({
    required String ticketId,
  }) async {
    final ticketComments = <TicketComment>[];

    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$clickUpApiUrl/task/$ticketId/comment',
        options: Options(
          headers: {RequestHeader.authorization: clickUpApiKey},
        ),
      );

      for (final task in response.data!['comments'] as List) {
        ticketComments.add(
          TicketComment.fromJson(task as Map<String, dynamic>),
        );
      }

      return ticketComments;
    } catch (error) {
      throw ApiException('Error calling API: $error');
    }
  }
}
