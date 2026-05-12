// lib/core/utils/js/src/js_helper_provider.dart

/// Interface for providing JavaScript helper functions to the script builder.
abstract class JsHelperProvider {
  /// Appends the JS code for the helper functions to the [buffer].
  void append(StringBuffer buffer);
}
