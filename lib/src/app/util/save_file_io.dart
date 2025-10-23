import 'dart:io';

void saveFile(List<int> bytes, String filename) {
  File(filename).writeAsBytesSync(bytes, flush: true);
}
