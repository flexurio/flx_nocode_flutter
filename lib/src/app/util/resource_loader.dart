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
  return shouldUseFileSystem
      ? File(path).readAsString()
      : rootBundle.loadString(path);
}
