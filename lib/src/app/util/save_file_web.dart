import 'dart:convert';
import 'dart:html';

void saveFile(List<int> bytes, String filename) {
  final dataUrl =
      'data:application/octet-stream;base64,${base64.encode(bytes)}';
  final a = AnchorElement(href: dataUrl)..download = filename;
  a.click();
}
