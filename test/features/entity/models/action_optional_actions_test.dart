import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';

void main() {
  group('ActionD Optional Actions Tests', () {
    test('ActionD.fromJson defaults print and download to true', () {
      final json = <String, dynamic>{
        'id': 'view_pdf',
        'name': 'View PDF',
        'type': 'display_pdf',
        'is_multiple': false,
      };

      final action = ActionD.fromJson(json);

      expect(action.canPrint, isTrue);
      expect(action.canDownload, isTrue);
    });

    test('ActionD.fromJson parses print and download flags correctly', () {
      final json = <String, dynamic>{
        'id': 'view_pdf',
        'name': 'View PDF',
        'type': 'display_pdf',
        'is_multiple': false,
        'print': false,
        'download': false,
      };

      final action = ActionD.fromJson(json);

      expect(action.canPrint, isFalse);
      expect(action.canDownload, isFalse);
    });

    test('ActionD.toJson includes print and download flags', () {
      final action = ActionD(
        id: 'view_pdf',
        name: 'View PDF',
        type: ActionType.displayPdf,
        isMultiple: false,
        onSuccess: const ['toast'],
        onFailure: const ['toast'],
        canPrint: false,
        canDownload: false,
      );

      final json = action.toJson();

      expect(json['print'], isFalse);
      expect(json['download'], isFalse);
    });

    test('ActionD.copyWith updates print and download flags', () {
      final original = ActionD(
        id: 'view_pdf',
        name: 'View PDF',
        type: ActionType.displayPdf,
        isMultiple: false,
        onSuccess: const ['toast'],
        onFailure: const ['toast'],
      );

      final updated = original.copyWith(
        canPrint: false,
        canDownload: false,
      );

      expect(updated.canPrint, isFalse);
      expect(updated.canDownload, isFalse);
      expect(original.canPrint, isTrue);
      expect(original.canDownload, isTrue);
    });
  });
}
