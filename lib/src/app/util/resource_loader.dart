import 'dart:io';

import 'package:flutter/services.dart';

/// Loads a text file from either the filesystem or Flutter assets.
Future<String> loadFromAssetOrFile({
  required String relativePath,
  required String assetBasePath,
  required String fileSystemBasePath,
  bool preferFileSystem = false,
  bool useFileSystem = false,
  String? overrideBasePath,
}) async {
  final shouldUseFileSystem = useFileSystem || preferFileSystem;
  final resolvedBasePath = overrideBasePath ??
      (shouldUseFileSystem ? fileSystemBasePath : assetBasePath);
  final path = '$resolvedBasePath/$relativePath';
  
  if (shouldUseFileSystem) {
    return File(path).readAsString();
  } else {
    try {
      return await rootBundle.loadString(path);
    } catch (e) {
      if (!path.startsWith('packages/')) {
        try {
          final packagePath = 'packages/flx_nocode_flutter/$path';
          return await rootBundle.loadString(packagePath);
        } catch (_) {
          // Ignore and rethrow original error
        }
      }
      rethrow;
    }
  }
}
