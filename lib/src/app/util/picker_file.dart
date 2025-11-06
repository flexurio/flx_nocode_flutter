import 'package:file_picker/file_picker.dart';

import 'save_file_io.dart' if (dart.library.html) 'save_file_web.dart' as saver;

Future<FilePickerResult?> pickFile({
  List<String>? file,
  FileType type = FileType.any,
}) async {
  final effectiveType =
      (file != null && file.isNotEmpty) ? FileType.custom : type;

  final result = await FilePicker.platform.pickFiles(
    allowedExtensions: file,
    type: effectiveType,
    withData: true,
  );
  return result;
}

void saveFile(List<int> bytes, String filename) {
  saver.saveFile(bytes, filename);
}
