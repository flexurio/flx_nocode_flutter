import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';

void main() {
  group('ActionD Download Type Unit Tests', () {
    test('ActionType enum contains download', () {
      expect(ActionType.values, contains(ActionType.download));
      expect(ActionType.download.id, 'download');
      expect(ActionType.download.label, 'Download File');
    });

    test('ActionD.fromJson parses download action correctly', () {
      final json = <String, dynamic>{
        'id': 'download_test',
        'name': 'Download Document',
        'type': 'download',
        'is_multiple': false,
        'http': {
          'method': 'GET',
          'url': 'https://example.com/file.pdf',
          'headers': {'Authorization': 'Bearer token'},
          'body': {},
        },
        'icon': 'Download',
        'permission': 'test_permission',
      };

      final action = ActionD.fromJson(json);

      expect(action.id, 'download_test');
      expect(action.name, 'Download Document');
      expect(action.type, ActionType.download);
      expect(action.http, isNotNull);
      expect(action.http!.url, 'https://example.com/file.pdf');
      expect(action.icon, 'Download');
      expect(action.permission, 'test_permission');
      expect(action.action, DataAction.confirm);
    });

    test('ActionD.toJson serializes download action correctly', () {
      final action = ActionD(
        id: 'download_test',
        name: 'Download Document',
        type: ActionType.download,
        isMultiple: false,
        onSuccess: const ['toast'],
        onFailure: const ['toast'],
        http: HttpData(
          method: 'GET',
          url: 'https://example.com/file.pdf',
          headers: {},
          body: {},
        ),
      );

      final json = action.toJson();

      expect(json['id'], 'download_test');
      expect(json['type'], 'download');
      expect(json['http']['url'], 'https://example.com/file.pdf');
    });

    test('ActionD.copyWith maintains download type', () {
      final original = ActionD(
        id: 'orig',
        name: 'Original',
        type: ActionType.download,
        isMultiple: false,
        onSuccess: const ['toast'],
        onFailure: const ['toast'],
      );

      final updated = original.copyWith(name: 'Updated');

      expect(updated.type, ActionType.download);
      expect(updated.name, 'Updated');
      expect(updated.id, 'orig');
    });

    test('ActionType.fromId handles download string', () {
      expect(ActionType.fromId('download'), ActionType.download);
    });
    
    test('ActionD.action returns confirm for download type', () {
      final action = ActionD(
        id: 'test',
        name: 'test',
        type: ActionType.download,
        isMultiple: false,
        onSuccess: const [],
        onFailure: const [],
      );
      expect(action.action, DataAction.confirm);
    });
  });
}
