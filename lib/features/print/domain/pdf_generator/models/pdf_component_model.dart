abstract class PdfComponentModel {
  final String type;
  final Map<String, dynamic> rawJson;

  PdfComponentModel({required this.type, required this.rawJson});

  factory PdfComponentModel.fromJson(dynamic json) {
    if (json is Map) {
      final type = json['type']?.toString() ?? 'unknown';
      return PdfGenericComponentModel(
        type: type,
        rawJson: Map<String, dynamic>.from(json),
      );
    }
    
    // Fallback for plain strings (wrapping them as text components)
    final value = json?.toString() ?? '';
    return PdfGenericComponentModel(
      type: 'text',
      rawJson: {'type': 'text', 'value': value},
    );
  }

  // Helper to recreate model after interpolation
  PdfComponentModel copyWithInterpolatedJson(Map<String, dynamic> interpolated) {
    return PdfComponentModel.fromJson(interpolated);
  }
}

class PdfGenericComponentModel extends PdfComponentModel {
  PdfGenericComponentModel({required super.type, required super.rawJson});
}
