import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:flx_nocode_flutter/src/app/model/entity_cache.dart';

void main() {
  setUpAll(() async {
    final tempDir = Directory.systemTemp.createTempSync('hive_cache_test');
    Hive.init(tempDir.path);
  });

  group('EntityCustomCache Tests', () {
    test('buildKey creates unique key from url, method, and filterMap', () {
      final key = EntityCustomCache.buildKey(
        url: 'https://example.com/api/data',
        method: 'GET',
        filterMap: {'page': 1, 'limit': 10},
      );
      expect(key, contains('GET|https://example.com/api/data'));
      expect(key, contains('filters='));
    });

    test('put and get saves and retrieves valid cache data', () async {
      final key = EntityCustomCache.buildKey(
        url: 'https://example.com/api/customers',
        method: 'GET',
      );

      final dummyData = [
        {'id': 1, 'name': 'Customer A'},
        {'id': 2, 'name': 'Customer B'},
      ];

      await EntityCustomCache.put(key, dummyData);

      final cached = await EntityCustomCache.get(key, durationSeconds: 3600);
      expect(cached, isNotNull);
      expect(cached!.length, 2);
      expect(cached[0]['name'], 'Customer A');
    });

    test('get returns null and deletes cache when expired', () async {
      final key = EntityCustomCache.buildKey(
        url: 'https://example.com/api/expired',
        method: 'GET',
      );

      final dummyData = [
        {'id': 99, 'name': 'Expired Item'},
      ];

      // Store cache entry
      await EntityCustomCache.put(key, dummyData);

      // Retrieve with negative durationSeconds to trigger expiration
      final cached = await EntityCustomCache.get(key, durationSeconds: -10);
      expect(cached, isNull);
    });
  });
}
