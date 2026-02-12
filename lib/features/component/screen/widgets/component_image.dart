import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component_image.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

extension ComponentImageWidgets on ComponentImage {
  Widget toWidget(JsonMap data) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: _mapFit(fit),
      errorBuilder: (context, error, stackTrace) => Container(
        width: width ?? 100,
        height: height ?? 100,
        color: Colors.grey.shade200,
        child: const Icon(Icons.broken_image, color: Colors.grey),
      ),
    );
  }

  Widget toMockWidget() {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: _mapFit(fit),
      errorBuilder: (context, error, stackTrace) => Container(
        width: width ?? 100,
        height: height ?? 100,
        color: Colors.grey.shade200,
        child: const Icon(Icons.image, color: Colors.grey),
      ),
    );
  }

  BoxFit _mapFit(String fit) {
    switch (fit.toLowerCase()) {
      case 'contain':
        return BoxFit.contain;
      case 'fill':
        return BoxFit.fill;
      case 'fitwidth':
        return BoxFit.fitWidth;
      case 'fitheight':
        return BoxFit.fitHeight;
      case 'none':
        return BoxFit.none;
      case 'scaleDown':
        return BoxFit.scaleDown;
      case 'cover':
      default:
        return BoxFit.cover;
    }
  }
}
