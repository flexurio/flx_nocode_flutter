import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/models/action_signature.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/electronic_signature_dialog.dart';
import 'package:flx_nocode_flutter/src/app/model/user.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';

void _ensureDemoUser() {
  UserRepositoryAppNocode.instance.userApp ??= UserAppNocode(
    id: 101,
    name: 'Apt. Budi Santoso, S.Farm',
    role: 'QA-MGR-001',
  );
}

@UseCase(
  name: 'Default Approval',
  type: ElectronicSignatureDialog,
  path: '[Popups]/Dialogs',
)
Widget buildElectronicSignatureDialogUseCase(BuildContext context) {
  _ensureDemoUser();
  final actionTitle = context.knobs.string(
    label: 'Action Name',
    initialValue: 'Evaluasi & Setujui CPOB',
  );

  final meaningsCsv = context.knobs.string(
    label: 'Meanings (comma separated)',
    initialValue: 'Disetujui, Ditinjau, Ditolak',
  );

  final meanings = meaningsCsv
      .split(',')
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();

  final requirePassword = context.knobs.boolean(
    label: 'Require Password',
    initialValue: true,
  );

  final requireMeaning = context.knobs.boolean(
    label: 'Require Meaning',
    initialValue: true,
  );

  return Center(
    child: ElevatedButton.icon(
      icon: const Icon(Icons.draw_outlined),
      label: const Text('Buka Dialog Tanda Tangan'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
      onPressed: () async {
        final result = await ElectronicSignatureDialog.prompt(
          context: context,
          actionName: actionTitle,
          signature: ActionSignature(
            title: 'Verifikasi Tanda Tangan Elektronik',
            meanings: meanings.isNotEmpty ? meanings : ['Disetujui'],
            defaultMeaning: meanings.isNotEmpty ? meanings.first : 'Disetujui',
            requirePassword: requirePassword,
            requireMeaning: requireMeaning,
          ),
          customVerifier: (meaning, password) async {
            await Future.delayed(const Duration(milliseconds: 700));
            if (password == 'admin123') {
              return SignatureResult(
                token: 'mock_jwt_signature_${DateTime.now().millisecondsSinceEpoch}',
                meaning: meaning,
                signerName: 'Apt. Budi Santoso, S.Farm',
                signerNip: 'QA-MGR-001',
                signedAt: DateTime.now(),
              );
            }
            throw Exception('Kata sandi salah. Gunakan kata sandi demo: "admin123"');
          },
        );

        if (context.mounted && result != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green.shade700,
              content: Text(
                '✅ Tanda tangan berhasil diverifikasi!\n'
                'Makna: ${result.meaning} | Penanda tangan: ${result.signerName} (${result.signerNip})\n'
                'Token: ${result.token}',
              ),
            ),
          );
        }
      },
    ),
  );
}

@UseCase(
  name: 'Inline Dialog Preview',
  type: ElectronicSignatureDialog,
  path: '[Popups]/Dialogs',
)
Widget buildElectronicSignatureDialogInlineUseCase(BuildContext context) {
  _ensureDemoUser();
  final meaningList = ['Disetujui', 'Ditinjau QA', 'Disetujui dengan Catatan', 'Ditolak'];

  return Navigator(
    onGenerateRoute: (_) => MaterialPageRoute<void>(
      builder: (navCtx) => Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ElectronicSignatureDialog(
              actionName: 'Persetujuan Rilis Bets (Batch Release)',
              signature: ActionSignature(
                title: 'Tanda Tangan Elektronik CPOB',
                meanings: meaningList,
                defaultMeaning: 'Disetujui',
              ),
              customVerifier: (meaning, password) async {
                await Future.delayed(const Duration(milliseconds: 600));
                if (password == 'cpob2026') {
                  return SignatureResult(
                    token: 'sig_token_cpob_valid_123',
                    meaning: meaning,
                    signerName: 'Dr. Hendra Wijaya',
                    signerNip: 'PIC-PROD-004',
                    signedAt: DateTime.now(),
                  );
                }
                throw Exception('Kata sandi salah. Gunakan password demo: "cpob2026"');
              },
            ),
          ),
        ),
      ),
    ),
  );
}

@UseCase(
  name: 'From JSON Config',
  type: ElectronicSignatureDialog,
  path: '[Popups]/Dialogs',
)
Widget buildElectronicSignatureFromJsonUseCase(BuildContext context) {
  _ensureDemoUser();

  const defaultJson = '''{
  "id": "setujui_cpob",
  "type": "open_page",
  "name": "Evaluasi & Setujui",
  "layout_form_id": "setujui",
  "signature": {
    "title": "Tanda Tangan Elektronik",
    "meanings": ["Disetujui", "Ditinjau", "Ditolak"],
    "default_meaning": "Disetujui",
    "require_meaning": true,
    "require_password": true
  }
}''';

  final jsonStr = context.knobs.string(
    label: 'Action JSON',
    initialValue: defaultJson,
    maxLines: 14,
  );

  ActionD? parsedAction;
  String? parseError;
  try {
    final decoded = jsonDecode(jsonStr) as Map<String, dynamic>;
    parsedAction = ActionD.fromJson(decoded);
  } catch (e) {
    parseError = e.toString();
  }

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (parseError != null)
            Text(
              'JSON Error: $parseError',
              style: const TextStyle(color: Colors.red),
            )
          else if (parsedAction?.signature == null)
            const Text('Properti "signature" tidak ditemukan pada JSON.')
          else
            ElevatedButton.icon(
              icon: const Icon(Icons.draw_outlined),
              label: Text(parsedAction!.name),
              onPressed: () async {
                final result = await ElectronicSignatureDialog.prompt(
                  context: context,
                  actionName: parsedAction!.name,
                  signature: parsedAction.signature!,
                  customVerifier: (meaning, password) async {
                    await Future.delayed(const Duration(milliseconds: 500));
                    if (password == 'admin123') {
                      return SignatureResult(
                        token: 'sig_json_${DateTime.now().millisecondsSinceEpoch}',
                        meaning: meaning,
                        signerName: 'Apt. Budi Santoso, S.Farm',
                        signerNip: 'QA-MGR-001',
                        signedAt: DateTime.now(),
                      );
                    }
                    throw Exception('Kata sandi salah. Gunakan: "admin123"');
                  },
                );
                if (context.mounted && result != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green.shade700,
                      content: Text('✅ Verified: ${result.meaning} | Token: ${result.token}'),
                    ),
                  );
                }
              },
            ),
        ],
      ),
    ),
  );
}
