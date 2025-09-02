import 'dart:convert';
import 'package:hive_ce/hive.dart';

/// Menyimpan data dengan timestamp supaya bisa expired
class CacheEntry {
  final List<Map<String, dynamic>> data;
  final DateTime timestamp;

  CacheEntry(this.data, this.timestamp);

  Map<String, dynamic> toJson() => {
        'data': data,
        'timestamp': timestamp.toIso8601String(),
      };

  factory CacheEntry.fromJson(Map<String, dynamic> json) {
    final list = (json['data'] as List<dynamic>)
        .map<Map<String, dynamic>>((e) => Map.from(e))
        .toList();
    return CacheEntry(
      list,
      DateTime.parse(json['timestamp'] as String),
    );
  }
}

/// Service khusus untuk handle cache
class EntityCustomCache {
  static const _boxName = 'entity_custom_cache';

  /// bikin key unik dari url, method, filter, pageOptions
  static String buildKey({
    required String url,
    required String method,
    Map<String, dynamic>? filterMap,
  }) {
    final buffer = StringBuffer();
    buffer.write(method);
    buffer.write('|');
    buffer.write(url);

    if (filterMap != null && filterMap.isNotEmpty) {
      buffer.write('|filters=');
      buffer.write(jsonEncode(filterMap));
    }

    return buffer.toString();
  }

  /// Simpan data ke cache
  static Future<void> put(
    String key,
    List<Map<String, dynamic>> data,
  ) async {
    final box = await Hive.openBox(_boxName);
    final entry = CacheEntry(data, DateTime.now());
    await box.put(key, entry.toJson());
  }

  /// Ambil data dari cache kalau masih valid
  static Future<List<Map<String, dynamic>>?> get(
    String key, {
    required int durationSeconds,
  }) async {
    final box = await Hive.openBox(_boxName);
    final cachedJson = box.get(key);
    if (cachedJson == null) return null;

    final entry = CacheEntry.fromJson(Map<String, dynamic>.from(cachedJson));

    final isValid =
        DateTime.now().difference(entry.timestamp).inSeconds <= durationSeconds;

    if (!isValid) {
      await box.delete(key);
      return null;
    }

    return entry.data;
  }
}
