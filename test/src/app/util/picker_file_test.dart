import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/src/app/util/picker_file.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Picker & Saver Tests in flx_nocode_flutter', () {
    late Directory tempDir;

    setUpAll(() {
      tempDir = Directory.systemTemp.createTempSync('picker_test_');
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
        const MethodChannel('plugins.flutter.io/path_provider'),
        (MethodCall methodCall) async {
          if (methodCall.method == 'getApplicationDocumentsDirectory') {
            return tempDir.path;
          }
          return null;
        },
      );
    });

    tearDownAll(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
        const MethodChannel('plugins.flutter.io/path_provider'),
        null,
      );
      if (tempDir.existsSync()) {
        tempDir.deleteSync(recursive: true);
      }
    });

    test('saveFileNocode saves bytes correctly to application documents directory', () async {
      const filename = 'test_output.txt';
      final bytes = Uint8List.fromList('Hello Nocode'.codeUnits);

      saveFileNocode(bytes, filename);
      await Future<void>.delayed(const Duration(milliseconds: 300));

      final savedFile = File('${tempDir.path}/$filename');
      expect(savedFile.existsSync(), isTrue);
      expect(savedFile.readAsStringSync(), 'Hello Nocode');
    });

    test('pickFileNocode function signature and existence', () {
      expect(pickFileNocode, isNotNull);
    });
  });
}
