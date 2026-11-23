import 'dart:async';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/field/models/display_source_model.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flx_nocode_flutter/src/app/resource/entity_custom.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';

/// Function signature for pluggable/mockable reference batch fetching.
typedef ReferenceBatchFetcher = Future<List<Map<String, dynamic>>> Function({
  required String path,
  required String batchParam,
  required List<String> ids,
  String? url,
});

class _CachedReferenceEntry {
  final String label;
  final DateTime expiresAt;

  _CachedReferenceEntry({
    required this.label,
    required this.expiresAt,
  });

  bool get isExpired => DateTime.now().isAfter(expiresAt);
}

/// Centralized in-memory cache and DataLoader engine for foreign-key / relational references.
///
/// Features:
/// 1. **Anti-N+1 Batch Fetching**: Groups unique IDs on a table page into a single request
///    (`?id.in=1,2,3`).
/// 2. **In-Flight Request Deduplication**: Prevents duplicate HTTP requests when multiple
///    widgets/cells request the same data simultaneously.
/// 3. **Global In-Memory TTL Cache**: Shares resolved references across screens and widgets
///    to avoid re-fetching data while navigating.
/// 4. **Multi-Consumer Consistency**: Supports Table, Detail, Filter, XLSX Export, and Print PDF.
/// 5. **Hermetic Testing**: Supports [customFetcher] for hermetic unit testing and Widgetbook mock data.
class ReferenceLabelCache {
  ReferenceLabelCache._();

  static ReferenceLabelCache _instance = ReferenceLabelCache._();

  static ReferenceLabelCache get instance => _instance;

  static set instance(ReferenceLabelCache val) => _instance = val;

  /// Internal memory store: key = `"{effectivePath}:{key}:{rawValue}"`.
  final Map<String, _CachedReferenceEntry> _cache = {};

  /// In-flight batch requests to prevent redundant network calls:
  /// key = `"{effectivePath}:{key}:{sortedIds}"`.
  final Map<String, Future<Map<String, String>>> _inFlightBatchRequests = {};

  /// Optional custom batch fetcher hook for testing and Widgetbook mock data.
  ReferenceBatchFetcher? customFetcher;

  /// Builds a deterministic cache key.
  static String buildCacheKey(String pathOrEntity, String key, dynamic rawValue) {
    return '$pathOrEntity:$key:${rawValue.toString().trim()}';
  }

  /// Clears all cached items and resets in-flight requests.
  void clear() {
    _cache.clear();
    _inFlightBatchRequests.clear();
  }

  /// Explicitly seeds a display label into the cache (e.g. for testing or pre-joined data).
  void seed(
    String pathOrEntity,
    String key,
    dynamic rawValue,
    String label, {
    Duration ttl = const Duration(minutes: 5),
  }) {
    if (rawValue == null) return;
    final cKey = buildCacheKey(pathOrEntity, key, rawValue);
    _cache[cKey] = _CachedReferenceEntry(
      label: label,
      expiresAt: DateTime.now().add(ttl),
    );
  }

  /// Synchronously returns the cached display label if present and unexpired.
  String? getCached(DisplaySourceModel source, dynamic rawValue) {
    if (rawValue == null) return null;
    final rawStr = rawValue.toString().trim();
    if (rawStr.isEmpty) return '';

    final cKey = buildCacheKey(source.effectivePath, source.key, rawStr);
    final entry = _cache[cKey];
    if (entry != null && !entry.isExpired) {
      return entry.label;
    }
    return null;
  }

  /// Asynchronously resolves a single foreign key [rawValue] to its display label.
  Future<String?> resolveOne(
    DisplaySourceModel source,
    dynamic rawValue, {
    String? accessToken,
  }) async {
    if (rawValue == null) return null;
    final rawStr = rawValue.toString().trim();
    if (rawStr.isEmpty) return '';

    final cached = getCached(source, rawStr);
    if (cached != null) return cached;

    final batchResult = await resolveBatch(
      source,
      [rawStr],
      accessToken: accessToken,
    );
    return batchResult[rawStr] ?? _resolveFallback(source, rawStr);
  }

  /// Asynchronously resolves a list of [rawValues] in a single batched HTTP request.
  Future<Map<String, String>> resolveBatch(
    DisplaySourceModel source,
    List<dynamic> rawValues, {
    String? accessToken,
  }) async {
    final result = <String, String>{};
    if (rawValues.isEmpty) return result;

    final missingIds = <String>{};

    for (final raw in rawValues) {
      if (raw == null) continue;
      final strVal = raw.toString().trim();
      if (strVal.isEmpty) continue;

      final cached = getCached(source, strVal);
      if (cached != null) {
        result[strVal] = cached;
      } else {
        missingIds.add(strVal);
      }
    }

    if (missingIds.isEmpty) {
      return result;
    }

    final sortedIds = missingIds.toList()..sort();
    final inFlightKey =
        '${source.effectivePath}:${source.key}:${sortedIds.join(',')}';

    Future<Map<String, String>>? inFlight = _inFlightBatchRequests[inFlightKey];

    if (inFlight == null) {
      inFlight = _executeBatchFetch(
        source,
        sortedIds,
        accessToken: accessToken,
      );
      _inFlightBatchRequests[inFlightKey] = inFlight;
    }

    try {
      final fetchedLabels = await inFlight;
      result.addAll(fetchedLabels);
      return result;
    } finally {
      _inFlightBatchRequests.remove(inFlightKey);
    }
  }

  /// Ensures all foreign key references in a dataset of [rows] are loaded into the cache.
  ///
  /// Call this when a page of data table records arrives, or before exporting to XLSX/PDF.
  Future<void> ensureLoadedForRows(
    List<Map<String, dynamic>> rows,
    List<EntityField> fields, {
    String? accessToken,
  }) async {
    if (rows.isEmpty || fields.isEmpty) return;

    final tasks = <Future<void>>[];

    for (final field in fields) {
      final source = field.effectiveDisplaySource;
      if (source == null) continue;

      final values = <dynamic>[];
      for (final row in rows) {
        final val = row[field.reference];
        if (val != null) values.add(val);
      }

      if (values.isNotEmpty) {
        tasks.add(resolveBatch(source, values, accessToken: accessToken));
      }
    }

    if (tasks.isNotEmpty) {
      await Future.wait(tasks);
    }
  }

  Future<Map<String, String>> _executeBatchFetch(
    DisplaySourceModel source,
    List<String> ids, {
    String? accessToken,
  }) async {
    final result = <String, String>{};
    final ttl = Duration(seconds: source.cacheTtlSeconds);

    try {
      List<Map<String, dynamic>> items;

      if (customFetcher != null) {
        items = await customFetcher!(
          path: source.effectivePath,
          batchParam: source.effectiveBatchParam,
          ids: ids,
          url: source.url,
        );
      } else {
        items = await _defaultHttpFetch(
          source,
          ids,
          accessToken: accessToken,
        );
      }

      for (final item in items) {
        final keyVal = item[source.key]?.toString().trim();
        if (keyVal != null && keyVal.isNotEmpty) {
          final formatted = source.format(item);
          result[keyVal] = formatted;
          seed(
            source.effectivePath,
            source.key,
            keyVal,
            formatted,
            ttl: ttl,
          );
        }
      }

      // Handle any IDs that weren't returned by the server (e.g. 404 or deleted records)
      for (final id in ids) {
        if (!result.containsKey(id)) {
          final fallbackVal = _resolveFallback(source, id);
          result[id] = fallbackVal;
          // Cache missing items for a shorter period (60s) to prevent spamming
          seed(
            source.effectivePath,
            source.key,
            id,
            fallbackVal,
            ttl: const Duration(seconds: 60),
          );
        }
      }
    } catch (e) {
      // Graceful degradation on error: fallback to raw or configured fallback
      for (final id in ids) {
        final fallbackVal = _resolveFallback(source, id);
        result[id] = fallbackVal;
      }
    }

    return result;
  }

  Future<List<Map<String, dynamic>>> _defaultHttpFetch(
    DisplaySourceModel source,
    List<String> ids, {
    String? accessToken,
  }) async {
    final token = accessToken ?? UserRepositoryAppNocode.instance.token ?? '';
    final path = source.effectivePath;
    final paramName = source.effectiveBatchParam;

    // Build filter map
    final filterMap = <String, dynamic>{
      paramName: ids.join(','),
    };

    final fetched = await EntityCustomRepository.instance.fetch(
      accessToken: token,
      pageOptions: PageOptions.emptyNoLimit(),
      method: 'GET',
      path: path,
      filterMap: filterMap,
    );

    return fetched.data;
  }

  static String _resolveFallback(DisplaySourceModel source, String rawValue) {
    switch (source.fallback.toLowerCase()) {
      case 'empty':
        return '';
      case 'dash':
        return '-';
      case 'raw':
      default:
        return rawValue;
    }
  }
}
