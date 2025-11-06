import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

Future<void> saveFile(List<int> bytes, String filename) async {
  try {
    final dir = await getApplicationDocumentsDirectory();
    final filePath = p.join(dir.path, filename);
    final file = File(filePath);
    await file.writeAsBytes(bytes, flush: true);

    print('✅ File saved to: $filePath');

    // buka otomatis kalau desktop
    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      await Process.run('open', [filePath]);
    } else {
      print('📂 File ready to open manually (mobile sandbox)');
    }
  } catch (e) {
    print('❌ Error saving file: $e');
  }
}
