import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class EmailRepository extends Repository {
  EmailRepository({required super.dio, required super.onUnauthorized});

  static final pathEmail = '${Api.urlApi}/email/by-nip';

  static EmailRepository instance = EmailRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<void> sendEmail({
    required String accessToken,
    required String subject,
    required String body,
    required List<String> to,
    required List<String> cc,
  }) async {
    if (to.isEmpty) {
      return;
    }

    try {
      await dio.post<Map<String, dynamic>>(
        pathEmail,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'subject': subject,
          'to': to,
          'cc': cc,
          'body': body,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
