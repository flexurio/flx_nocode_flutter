import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_execution_extension.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final action = ActionD(
    id: 'doc_action',
    name: 'Document Action',
    type: ActionType.displayPdf,
    isMultiple: false,
    onSuccess: const ['none'],
    onFailure: const ['none'],
  );

  setUp(() {
    Configuration.instance = Configuration.empty().copyWith(
      backendHost: 'https://api.example.com',
    );
  });

  group('normalizeDocumentUrl', () {
    test('resolves relative paths against base origin without base path', () {
      expect(
        action.normalizeDocumentUrl(
          '/static/uploads/doc.pdf?download=1',
          'https://api.example.com/v1/documents/42',
        ),
        'https://api.example.com/static/uploads/doc.pdf?download=1',
      );
      expect(
        action.normalizeDocumentUrl(
          'static/uploads/doc.pdf',
          'https://api.example.com:8443/v1/documents',
        ),
        'https://api.example.com:8443/static/uploads/doc.pdf',
      );
    });

    test('rewrites localhost and loopback hosts to baseUrl origin', () {
      for (final host in ['localhost', '127.0.0.1', '0.0.0.0', '[::1]']) {
        expect(
          action.normalizeDocumentUrl(
            'http://$host:8080/files/report.pdf',
            'https://api.example.com',
          ),
          'https://api.example.com/files/report.pdf',
          reason: 'Expected $host to be rewritten to baseUrl',
        );
      }
    });

    test('rewrites /static/ mismatch for internal, Docker, and private IP hosts',
        () {
      for (final internalUrl in [
        'http://backend:8080/static/doc.pdf',
        'http://edms-api/static/doc.pdf',
        'http://api.internal:8080/static/doc.pdf',
        'http://service.local/static/doc.pdf',
        'http://192.168.1.25:8080/static/doc.pdf',
        'http://10.0.1.5/static/doc.pdf',
        'http://172.16.0.10:8080/static/doc.pdf',
        'http://172.31.255.1/static/doc.pdf',
      ]) {
        expect(
          action.normalizeDocumentUrl(internalUrl, 'https://api.example.com'),
          'https://api.example.com/static/doc.pdf',
          reason: 'Expected $internalUrl to be rewritten',
        );
      }
    });

    test('preserves /static/ URLs served from external public or CDN hosts',
        () {
      for (final externalUrl in [
        'https://cdn.example.com/static/doc.pdf',
        'https://s3.ap-southeast-1.amazonaws.com/static/doc.pdf',
        'https://172.32.0.1/static/doc.pdf',
        'https://203.0.113.10/static/doc.pdf',
      ]) {
        expect(
          action.normalizeDocumentUrl(externalUrl, 'https://api.example.com'),
          externalUrl,
          reason: 'Expected external URL $externalUrl to remain untouched',
        );
      }
    });

    test('does not rewrite concrete host to unconfigured 0.0.0.0 baseUrl', () {
      expect(
        action.normalizeDocumentUrl(
          'http://localhost:8080/static/doc.pdf',
          'http://0.0.0.0:8080',
        ),
        'http://localhost:8080/static/doc.pdf',
      );
    });
  });

  group('resolveMetadataBaseUrl', () {
    test('uses requestUrl when it has a non-internal authority', () {
      expect(
        action.resolveMetadataBaseUrl(
          'https://docs.example.com/api/docs/1',
          'https://api.example.com',
        ),
        'https://docs.example.com/api/docs/1',
      );
    });

    test('falls back to backendHost when requestUrl is relative or internal',
        () {
      expect(
        action.resolveMetadataBaseUrl(
          '/api/docs/1',
          'https://api.example.com',
        ),
        'https://api.example.com',
      );
      expect(
        action.resolveMetadataBaseUrl(
          'http://localhost:8080/api/docs/1',
          'https://api.example.com',
        ),
        'https://api.example.com',
      );
      expect(
        action.resolveMetadataBaseUrl(
          'http://127.0.0.1:8080/api/docs/1',
          'https://api.example.com',
        ),
        'https://api.example.com',
      );
      expect(
        action.resolveMetadataBaseUrl(null, 'https://api.example.com'),
        'https://api.example.com',
      );
    });
  });

  group('resolveDocumentRequest', () {
    test('direct PDF http.url pointing to localhost falls back to backendHost',
        () async {
      final directPdfAction = ActionD(
        id: 'direct_localhost_pdf',
        name: 'Display PDF',
        type: ActionType.displayPdf,
        isMultiple: false,
        onSuccess: const ['none'],
        onFailure: const ['none'],
        http: HttpData(
          method: 'GET',
          url: '{{data.document}}',
          headers: const {},
          body: const {},
        ),
      );

      final result = await directPdfAction.resolveDocumentRequest(
        data: {
          'data': {'document': 'http://localhost:8080/static/doc.pdf'},
        },
        metadataFailureFallback: 'Failed to load PDF data',
      );

      expect(result.errorMessage, isNull);
      expect(result.url, 'https://api.example.com/static/doc.pdf');
    });

    test('direct PDF http.url with relative /static/ path uses backendHost',
        () async {
      final directRelativeAction = ActionD(
        id: 'direct_relative_pdf',
        name: 'Download PDF',
        type: ActionType.download,
        isMultiple: false,
        onSuccess: const ['none'],
        onFailure: const ['none'],
        http: HttpData(
          method: 'GET',
          url: '{{data.document}}',
          headers: const {},
          body: const {},
        ),
      );

      final result = await directRelativeAction.resolveDocumentRequest(
        data: {
          'data': {'document': '/static/doc.pdf'},
        },
        metadataFailureFallback: 'Failed to load download data',
      );

      expect(result.errorMessage, isNull);
      expect(result.url, 'https://api.example.com/static/doc.pdf');
    });

    test('direct PDF http.url on external CDN /static/ is preserved', () async {
      final cdnAction = ActionD(
        id: 'direct_cdn_pdf',
        name: 'Display PDF',
        type: ActionType.displayPdf,
        isMultiple: false,
        onSuccess: const ['none'],
        onFailure: const ['none'],
        http: HttpData(
          method: 'GET',
          url: '{{data.document}}',
          headers: const {},
          body: const {},
        ),
      );

      final result = await cdnAction.resolveDocumentRequest(
        data: {
          'data': {'document': 'https://cdn.example.com/static/doc.pdf'},
        },
        metadataFailureFallback: 'Failed to load PDF data',
      );

      expect(result.errorMessage, isNull);
      expect(result.url, 'https://cdn.example.com/static/doc.pdf');
    });

    test('direct value URL without http resolves against backendHost',
        () async {
      final valueAction = ActionD(
        id: 'direct_value_pdf',
        name: 'Download PDF',
        type: ActionType.download,
        isMultiple: false,
        onSuccess: const ['none'],
        onFailure: const ['none'],
        value: '/static/manual.pdf',
      );

      final result = await valueAction.resolveDocumentRequest(
        data: const {},
        metadataFailureFallback: 'Failed to load download data',
      );

      expect(result.errorMessage, isNull);
      expect(result.url, 'https://api.example.com/static/manual.pdf');
    });

    test('metadata endpoint with relative URL uses backendHost', () async {
      final metadataAction = ActionD(
        id: 'meta_pdf',
        name: 'Display PDF',
        type: ActionType.displayPdf,
        isMultiple: false,
        onSuccess: const ['none'],
        onFailure: const ['none'],
        http: HttpData(
          method: 'GET',
          url: '/documents/42',
          headers: const {},
          body: const {},
        ),
      );

      final result = await metadataAction.resolveDocumentRequest(
        data: const {},
        metadataFailureFallback: 'Failed to load PDF data',
        executeHttp: (_, __) async => HttpRequestResult.success(
          statusCode: 200,
          data: {'document': '/static/generated.pdf'},
        ),
      );

      expect(result.errorMessage, isNull);
      expect(result.url, 'https://api.example.com/static/generated.pdf');
    });

    test('metadata endpoint with external host normalizes returned localhost URL',
        () async {
      final metadataAction = ActionD(
        id: 'meta_external_pdf',
        name: 'Display PDF',
        type: ActionType.displayPdf,
        isMultiple: false,
        onSuccess: const ['none'],
        onFailure: const ['none'],
        http: HttpData(
          method: 'GET',
          url: 'https://docs.partner.com/api/documents/42',
          headers: const {},
          body: const {},
        ),
      );

      final result = await metadataAction.resolveDocumentRequest(
        data: const {},
        metadataFailureFallback: 'Failed to load PDF data',
        executeHttp: (_, __) async => HttpRequestResult.success(
          statusCode: 200,
          data: {'document': 'http://localhost:8080/static/generated.pdf'},
        ),
      );

      expect(result.errorMessage, isNull);
      expect(result.url, 'https://docs.partner.com/static/generated.pdf');
    });
  });
}
