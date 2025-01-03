import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Translation Directory Tests', () {
    // Directory path where JSON files are stored
    const translationDir = './asset/translation';

    // Get all JSON files in the directory
    List<File> getJsonFiles(String directoryPath) {
      final directory = Directory(directoryPath);
      if (!directory.existsSync()) {
        throw Exception('Directory $directoryPath does not exist');
      }

      // Filter JSON files
      return directory
          .listSync()
          .whereType<File>()
          .where((file) => file.path.endsWith('.json'))
          .toList();
    }

    test('Check if directory contains JSON files', () {
      final files = getJsonFiles(translationDir);

      // Ensure at least two JSON files exist for comparison
      expect(files.isNotEmpty, true,
          reason: 'No JSON files found in $translationDir');
      expect(files.length > 1, true,
          reason: 'Need at least two JSON files for comparison');
    });

    test('Check if all JSON files have the same number of lines', () {
      final files = getJsonFiles(translationDir);

      // Store line counts for comparison
      final lineCounts = <int>[];
      for (final file in files) {
        final lines = file.readAsLinesSync(); // Read file as list of lines
        lineCounts.add(lines.length);
      }

      // Compare the line counts of all files
      for (var i = 1; i < lineCounts.length; i++) {
        expect(lineCounts[i], lineCounts[0],
            reason:
                'Line count mismatch between ${files[i - 1].path} and ${files[i].path}');
      }
    });

    test('Check if all JSON files have the same keys', () {
      final files = getJsonFiles(translationDir);

      // Decode and store keys for comparison
      final keysList = <Set<String>>[];
      for (final file in files) {
        final content =
            json.decode(file.readAsStringSync()) as Map<String, dynamic>;
        keysList.add(content.keys.toSet());
      }

      // Compare the keys of all files
      for (var i = 1; i < keysList.length; i++) {
        expect(keysList[i], keysList[0],
            reason:
                'Keys mismatch between ${files[i - 1].path} and ${files[i].path}');
      }
    });

    test('Check if all JSON files have non-empty values', () {
      final files = getJsonFiles(translationDir);

      for (final file in files) {
        final content =
            json.decode(file.readAsStringSync()) as Map<String, dynamic>;

        for (final key in content.keys) {
          expect(content[key].toString().isNotEmpty, true,
              reason: 'Key "$key" in ${file.path} has an empty value');
        }
      }
    });
  });
}
