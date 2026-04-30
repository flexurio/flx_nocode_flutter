import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

abstract class PdfLayoutStrategy {
  Future<void> build({
    required pw.Document pdf,
    required Map<String, dynamic> processedJson,
    required PdfPageFormat format,
    required String unit,
    required Map<String, pw.ImageProvider> imageCache,
    required List<dynamic> globalHeader,
    required List<dynamic> globalFooter,
  });
}
