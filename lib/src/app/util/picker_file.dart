import 'package:file_picker/file_picker.dart';

import 'save_file_io.dart' if (dart.library.html) 'save_file_web.dart' as saver;

Future<FilePickerResult?> pickFile({
  List<String>? extensions,
  FileType type = FileType.any,
  bool allowMultiple = false,
}) async {
  final effectiveType =
      (extensions != null && extensions.isNotEmpty) ? FileType.custom : type;

  final result = await FilePicker.platform.pickFiles(
    allowedExtensions: extensions,
    type: effectiveType,
    allowMultiple: allowMultiple,
    withData: true,
  );
  return result;
}

void saveFile(List<int> bytes, String filename) {
  saver.saveFile(bytes, filename);
}
