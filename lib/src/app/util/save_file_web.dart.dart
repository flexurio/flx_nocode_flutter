import 'dart:convert';
import 'dart:html';

void saveFile(List<int> bytes, String filename) {
  final dataUrl =
      'data:application/octet-stream;base64,${base64.encode(bytes)}';
  final anchor = AnchorElement(href: dataUrl)
    ..download = filename
    ..style.display = 'none';
  document.body?.append(anchor);
  anchor.click();
  anchor.remove();
}
