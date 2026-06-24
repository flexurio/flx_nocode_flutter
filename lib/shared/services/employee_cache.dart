// lib/shared/services/employee_cache.dart

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';

/// Cache singleton untuk data employee/user.
///
/// Menyimpan daftar user dari endpoint `{auth_host}/users` dalam bentuk
/// [Map<String, String>] dimana **key adalah id user (dalam bentuk String)**
/// dan **value adalah nama user**.
///
/// Penggunaan key sebagai [String] memastikan pencarian berjalan dengan benar
/// meski data dari response API mengirim `user_id` / `nip` dalam tipe `int`
/// maupun `String`.
class EmployeeCache {
  EmployeeCache._();

  static final EmployeeCache instance = EmployeeCache._();

  /// Map dari id (String) → nama user.
  final Map<String, String> _cache = {};

  bool _hasFetched = false;
  bool _isFetching = false;
  Completer<void>? _fetchCompleter;

  /// Mengembalikan nama user berdasarkan [userId].
  ///
  /// [userId] dapat berupa [int] atau [String]; keduanya akan dikonversi ke
  /// [String] sebelum pencarian sehingga `1801005` dan `"1801005"` menghasilkan
  /// hasil yang sama.
  ///
  /// Mengembalikan `null` jika tidak ditemukan.
  Future<String?> findName({
    required String accessToken,
    required dynamic userId,
  }) async {
    await _ensureFetched(accessToken);
    final key = userId.toString();
    return _cache[key];
  }

  /// Mengembalikan format **"NIP - Nama"** berdasarkan [userId].
  ///
  /// Contoh: `"1801005 - Bimo Fikri Wicaksono"`
  ///
  /// Mengembalikan `null` jika tidak ditemukan.
  Future<String?> findNameWithId({
    required String accessToken,
    required dynamic userId,
  }) async {
    await _ensureFetched(accessToken);
    final key = userId.toString();
    final name = _cache[key];
    if (name == null) return null;
    return '$key - $name';
  }

  /// Memastikan data sudah di-fetch sebelum digunakan.
  Future<void> _ensureFetched(String accessToken) async {
    if (_hasFetched) return;

    if (_isFetching) {
      // Tunggu fetch yang sedang berjalan selesai
      await _fetchCompleter?.future;
      return;
    }

    _isFetching = true;
    _fetchCompleter = Completer<void>();

    try {
      await _fetchAndBuild(accessToken);
      _hasFetched = true;
    } catch (e) {
      print('[EmployeeCache] error fetching employees: $e');
    } finally {
      _isFetching = false;
      _fetchCompleter?.complete();
    }
  }

  Future<void> _fetchAndBuild(String accessToken) async {
    final response = await Dio().get<Map<String, dynamic>>(
      '${Api.urlAuth}/users',
      options: Options(
        headers: {
          RequestHeader.authorization: 'Bearer $accessToken',
        },
      ),
    );

    final data = response.data?['data'];
    if (data is! List) return;

    _cache.clear();
    for (final item in data) {
      if (item is! Map<String, dynamic>) continue;

      // Ambil nilai nip/id — bisa berupa int atau String
      final rawId = item['nip'] ?? item['id'] ?? item['user_id'];
      final name = item['name']?.toString();

      if (rawId != null && name != null) {
        _cache[rawId.toString()] = name;
      }
    }
  }

  /// Menghapus cache dan mengizinkan fetch ulang.
  /// Berguna saat logout atau refresh data.
  void invalidate() {
    _cache.clear();
    _hasFetched = false;
    _isFetching = false;
    _fetchCompleter = null;
  }
}
