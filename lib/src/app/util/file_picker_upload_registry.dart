import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerUploadRegistry {
  FilePickerUploadRegistry._();

  static final Map<String, PlatformFile> _files = {};

  static String register(PlatformFile file) {
    final path = file.path;
    final key = path != null && path.isNotEmpty
        ? path
        : 'nocode_file_picker://${DateTime.now().microsecondsSinceEpoch}/${file.name}';
    _files[key] = file;
    return key;
  }

  static String displayName(String value) {
    final file = _files[value];
    if (file != null) return file.name;
    return value.split('/').last;
  }

  static Future<Object?> toMultipartIfRegistered(Object? value) async {
    if (value is String) {
      final file = _files[value];
      if (file == null) return value;

      final bytes = file.bytes;
      if (bytes != null) {
        return MultipartFile.fromBytes(
          bytes,
          filename: file.name,
        );
      }

      final path = file.path;
      if (path != null && path.isNotEmpty) {
        return MultipartFile.fromFile(
          path,
          filename: file.name,
        );
      }
    }

    if (value is List) {
      return Future.wait(value.map(toMultipartIfRegistered));
    }

    if (value is Map) {
      if (value.containsKey('id')) {
        return value['id'];
      }
      return prepareFormDataMap(Map<String, dynamic>.from(value));
    }

    return value;
  }

  static Future<Map<String, dynamic>> prepareFormDataMap(
    Map<String, dynamic> body,
  ) async {
    final result = <String, dynamic>{};
    for (final entry in body.entries) {
      result[entry.key] = await toMultipartIfRegistered(entry.value);
    }
    return result;
  }
}
