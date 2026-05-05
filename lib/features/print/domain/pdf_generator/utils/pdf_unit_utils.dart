import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfUnitUtils {
  static double convertToPt(dynamic value, String unit) {
    if (value == null) return 0.0;
    double val = 0.0;
    if (value is num) {
      val = value.toDouble();
    } else if (value is String) {
      val = double.tryParse(value) ?? 0.0;
    }
    switch (unit) {
      case 'mm':
        return val * 2.83465;
      case 'cm':
        return val * 28.3465;
      case 'in':
        return val * 72.0;
      case 'px':
        return val * 0.75; // Approx
      case 'pt':
      default:
        return val;
    }
  }

  static PdfPageFormat parsePageSize(dynamic pageSize, String unit) {
    if (pageSize is List && pageSize.length == 2) {
      final width = convertToPt(pageSize[0], unit);
      final height = convertToPt(pageSize[1], unit);
      return PdfPageFormat(width, height);
    } else if (pageSize is String) {
      final size = pageSize.toUpperCase();
      if (size == 'A4') return PdfPageFormat.a4;
      if (size == 'LETTER') return PdfPageFormat.letter;
      if (size == 'A3') return PdfPageFormat.a3;
      if (size == 'A5') return PdfPageFormat.a5;
    }
    return PdfPageFormat.a4;
  }

  static pw.EdgeInsetsGeometry? parseEdgeInsets(dynamic value, String unit) {
    if (value == null) return null;
    if (value is num) {
      final val = convertToPt(value, unit);
      return val > 0 ? pw.EdgeInsets.all(val) : null;
    }
    if (value is Map) {
      return pw.EdgeInsets.only(
        left: convertToPt(value['left'] ?? 0, unit),
        top: convertToPt(value['top'] ?? 0, unit),
        right: convertToPt(value['right'] ?? 0, unit),
        bottom: convertToPt(value['bottom'] ?? 0, unit),
      );
    }
    return null;
  }
}
