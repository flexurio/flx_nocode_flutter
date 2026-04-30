import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/utils/pdf_data_utils.dart'
    show PdfDataUtils;
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfImageService {
  final Map<String, pw.ImageProvider> _imageCache = {};

  Future<Map<String, pw.ImageProvider>> loadImages(
      Map<String, dynamic> processedJson) async {
    final Set<String> imageUrls = {};
    PdfDataUtils.extractImageUrls(processedJson, imageUrls);

    for (final url in imageUrls) {
      if (_imageCache.containsKey(url)) continue;
      try {
        _imageCache[url] = await networkImage(url);
      } catch (e) {
        // Ignore image load failures
        print('Failed to load image: $url');
      }
    }
    return _imageCache;
  }

  Map<String, pw.ImageProvider> get cache => _imageCache;
}
