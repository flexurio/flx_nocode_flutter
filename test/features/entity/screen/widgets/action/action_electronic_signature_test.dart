import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/action_signature.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/electronic_signature_dialog.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/submit_workflow/submit_workflow.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';

void main() {
  setUpAll(() {
    Configuration.instance = Configuration.empty();
  });
  group('ActionSignature Model Tests', () {
    test('fromJson parses signature with default values', () {
      final sig = ActionSignature.fromJson(null);
      expect(sig.meanings, ['Disetujui']);
      expect(sig.requireMeaning, isTrue);
      expect(sig.requirePassword, isTrue);
      expect(sig.verifyUrl, isNull);
    });

    test('fromJson parses bool true', () {
      final sig = ActionSignature.fromJson(true);
      expect(sig.meanings, ['Disetujui']);
      expect(sig.requirePassword, isTrue);
    });

    test('fromJson parses custom meanings and parameters', () {
      final json = {
        'meanings': ['Disetujui', 'Ditinjau', 'Ditolak'],
        'default_meaning': 'Ditinjau',
        'verify_url': '/api/v1/auth/verify',
        'title': 'Persetujuan CPOB',
        'require_meaning': true,
        'require_password': true,
      };
      final sig = ActionSignature.fromJson(json);
      expect(sig.meanings, ['Disetujui', 'Ditinjau', 'Ditolak']);
      expect(sig.defaultMeaning, 'Ditinjau');
      expect(sig.verifyUrl, '/api/v1/auth/verify');
      expect(sig.title, 'Persetujuan CPOB');
      expect(sig.requireMeaning, isTrue);
      expect(sig.requirePassword, isTrue);

      final serialized = sig.toJson();
      expect(serialized['default_meaning'], 'Ditinjau');
      expect(serialized['verify_url'], '/api/v1/auth/verify');
      expect(serialized['title'], 'Persetujuan CPOB');
    });

    test('ActionD parses signature configuration', () {
      final actionJson = {
        'id': 'approve_step',
        'name': 'Setujui',
        'type': 'http',
        'signature': {
          'meanings': ['Disetujui'],
          'default_meaning': 'Disetujui',
        },
      };
      final action = ActionD.fromJson(actionJson);
      expect(action.signature, isNotNull);
      expect(action.signature!.meanings, ['Disetujui']);
      expect(action.signature!.defaultMeaning, 'Disetujui');

      final toMap = action.toJson();
      expect(toMap['signature'], isNotNull);
      expect(toMap['signature']['meanings'], ['Disetujui']);
    });

    test('SubmitWorkflow parses signature configuration', () {
      final workflowJson = {
        'type': 'workflow',
        'submit_label': 'Kirim & Tanda Tangani',
        'signature': {
          'meanings': ['Diverifikasi QA'],
          'verify_url': '/auth/verify-qa',
        },
        'actions': [],
      };
      final submitWorkflow = SubmitWorkflow.fromMap(workflowJson);
      expect(submitWorkflow.signature, isNotNull);
      expect(submitWorkflow.signature!.meanings, ['Diverifikasi QA']);
      expect(submitWorkflow.signature!.verifyUrl, '/auth/verify-qa');

      final map = submitWorkflow.toMap();
      expect(map['signature'], isNotNull);
      expect(map['signature']['verify_url'], '/auth/verify-qa');
    });
  });

  group('ElectronicSignatureDialog Widget Tests', () {
    testWidgets('renders dialog fields and allows meaning selection',
        (tester) async {
      const sig = ActionSignature(
        meanings: ['Disetujui', 'Ditinjau', 'Ditolak'],
        defaultMeaning: 'Disetujui',
        title: 'Verifikasi Tanda Tangan',
      );

      SignatureResult? capturedResult;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (ctx) => ElevatedButton(
                onPressed: () async {
                  capturedResult = await ElectronicSignatureDialog.prompt(
                    context: ctx,
                    signature: sig,
                    actionName: 'Evaluasi & Setujui',
                    customVerifier: (meaning, password) async {
                      if (password == 'secret123') {
                        return SignatureResult(
                          token: 'jwt_sig_token_abc',
                          meaning: meaning,
                          signerName: 'Test Signer',
                          signerNip: '12345',
                          signedAt: DateTime.now(),
                        );
                      }
                      throw Exception('Kata sandi salah');
                    },
                  );
                },
                child: const Text('Open Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Dialog'));
      await tester.pumpAndSettle();

      expect(find.text('Verifikasi Tanda Tangan'), findsOneWidget);
      expect(find.text('Aksi: Evaluasi & Setujui'), findsOneWidget);
      expect(find.text('Disetujui'), findsOneWidget);
      expect(find.byType(DropdownButtonFormField<String>), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);

      // Attempt submit without password -> validation error
      await tester.tap(find.text('Tanda Tangani & Lanjutkan'));
      await tester.pumpAndSettle();
      expect(
        find.text('Kata sandi wajib diisi untuk tanda tangan elektronik'),
        findsOneWidget,
      );
      expect(capturedResult, isNull);

      // Enter wrong password
      await tester.enterText(find.byType(TextFormField), 'wrong_password');
      await tester.tap(find.text('Tanda Tangani & Lanjutkan'));
      await tester.pumpAndSettle();
      expect(find.text('Kata sandi salah'), findsOneWidget);
      expect(capturedResult, isNull);

      // Enter correct password and submit
      await tester.enterText(find.byType(TextFormField), 'secret123');
      await tester.tap(find.text('Tanda Tangani & Lanjutkan'));
      await tester.pumpAndSettle();

      // Dialog should be dismissed and result returned
      expect(find.byType(ElectronicSignatureDialog), findsNothing);
      expect(capturedResult, isNotNull);
      expect(capturedResult!.token, 'jwt_sig_token_abc');
      expect(capturedResult!.meaning, 'Disetujui');
    });

    testWidgets('cancels dialog when Batal is pressed', (tester) async {
      const sig = ActionSignature(
        meanings: ['Disetujui'],
      );

      SignatureResult? capturedResult;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (ctx) => ElevatedButton(
                onPressed: () async {
                  capturedResult = await ElectronicSignatureDialog.prompt(
                    context: ctx,
                    signature: sig,
                  );
                },
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Batal'));
      await tester.pumpAndSettle();

      expect(find.byType(ElectronicSignatureDialog), findsNothing);
      expect(capturedResult, isNull);
    });
  });

  group('HttpAction & Workflow Signature Token Auto-Injection Tests', () {
    test('HttpAction automatically injects X-Signature-Token from context',
        () async {
      HttpData? capturedHttp;

      final executor = _TestHttpExecutor((req) async {
        capturedHttp = req;
        return const HttpResult(status: 200, data: {'success': true});
      });

      final ctx = WorkflowContext(
        form: {},
        data: {},
        signature: {
          'token': 'mock_signature_jwt_123',
          'meaning': 'Disetujui',
        },
        auth: const AuthContext(permissions: []),
        httpExecutor: executor,
      );

      final action = HttpAction(
        name: 'approve_test',
        http: HttpData(
          method: 'POST',
          url: 'https://api.example.com/approve',
          headers: {'Content-Type': 'application/json'},
          body: {'status': 'APPROVED'},
        ),
      );

      await action.execute(ctx, NoopUiBridge());

      expect(capturedHttp, isNotNull);
      expect(
        capturedHttp!.headers['X-Signature-Token'],
        'mock_signature_jwt_123',
      );
    });

    test('HttpDataExtension toRequestConfig auto-propagates signature token', () {
      final httpData = HttpData(
        method: 'POST',
        url: 'https://api.example.com/sign',
        headers: {'Content-Type': 'application/json'},
        body: {},
      );

      final requestConfig = httpData.toRequestConfig({
        'signature': {
          'token': 'sig_token_xyz',
          'meaning': 'Disetujui',
        },
      });

      expect(requestConfig.headers['X-Signature-Token'], 'sig_token_xyz');
    });

    test('WorkflowContext scope exposes signature.token and signature.meaning',
        () async {
      final executor = _TestHttpExecutor((req) async {
        return const HttpResult(status: 200, data: {'ok': true});
      });

      final ctx = WorkflowContext(
        form: {},
        data: {},
        signature: {
          'token': 'token_999',
          'meaning': 'Ditinjau oleh QA',
        },
        auth: const AuthContext(permissions: []),
        httpExecutor: executor,
      );

      HttpData? capturedHttp;
      final action = HttpAction(
        name: 'qa_review_test',
        http: HttpData(
          method: 'POST',
          url: 'https://api.example.com/qa-review',
          headers: {'Content-Type': 'application/json'},
          body: {
            'sig_token': '{{ signature.token }}',
            'sig_meaning': '{{ signature.meaning }}',
          },
        ),
      );

      executor.onRequest = (req) async {
        capturedHttp = req;
        return const HttpResult(status: 200, data: {'ok': true});
      };

      await action.execute(ctx, NoopUiBridge());

      expect(capturedHttp, isNotNull);
      expect(capturedHttp!.body['sig_token'], 'token_999');
      expect(capturedHttp!.body['sig_meaning'], 'Ditinjau oleh QA');
    });
  });
}

class _TestHttpExecutor implements HttpExecutor {
  Future<HttpResult> Function(HttpData req) onRequest;

  _TestHttpExecutor(this.onRequest);

  @override
  Future<HttpResult> execute(HttpData request) => onRequest(request);
}
