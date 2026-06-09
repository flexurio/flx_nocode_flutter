import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';

void main() {
  group('ActionType Download Tests', () {
    test('ActionType.fromId correctly identifies download', () {
      expect(ActionType.fromId('download'), ActionType.download);
    });

    test('ActionD.fromJson correctly handles download type', () {
      final json = <String, dynamic>{
        'id': 'download_1',
        'name': 'Download File',
        'type': 'download',
        'is_multiple': false,
      };

      final action = ActionD.fromJson(json);
      expect(action.type, ActionType.download);
      expect(action.action, DataAction.confirm);
    });
  });
}
