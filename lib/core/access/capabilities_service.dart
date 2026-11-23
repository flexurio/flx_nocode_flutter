import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flx_nocode_flutter/core/access/access_control_config.dart';
import 'package:flx_nocode_flutter/core/access/access_policy_evaluator.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flx_nocode_flutter/src/app/util/string.dart';

/// Fetches server-driven effective capabilities from the backend
/// (`AccessControlConfig.capabilitiesEndpoint`) and stores them in
/// [UserRepositoryAppNocode] as the Single Source of Truth.
class CapabilitiesService {
  CapabilitiesService._();

  static final CapabilitiesService instance = CapabilitiesService._();

  /// Loads effective capabilities from [config.capabilitiesEndpoint] if set.
  ///
  /// Returns the normalized capability list on success, or `null` if no
  /// endpoint is configured or if no token is available.
  ///
  /// When [failClosed] is `true` (default), a network/HTTP error explicitly
  /// marks capabilities as loaded with an empty list (`[]`) so menu/action
  /// checks fail closed instead of falling back to unrestricted access.
  Future<List<String>?> syncFromBackend({
    required AccessControlConfig config,
    UserRepositoryAppNocode? userRepository,
    String? accessToken,
    Dio? dio,
    bool failClosed = true,
  }) async {
    final rawEndpoint = config.capabilitiesEndpoint?.trim();
    if (rawEndpoint == null || rawEndpoint.isEmpty) return null;

    final repo = userRepository ?? UserRepositoryAppNocode.instance;
    final token = (accessToken != null && accessToken.isNotEmpty)
        ? accessToken
        : repo.token;
    if (token == null || token.isEmpty) return null;

    String resolvedUrl = rawEndpoint;
    try {
      resolvedUrl = rawEndpoint.replaceStringWithValues(const {});
    } catch (_) {
      // Fallback to rawEndpoint when Configuration.instance is not initialized (e.g. unit tests)
    }
    final client = dio ?? Dio();

    try {
      final response = await client.get<dynamic>(
        resolvedUrl,
        options: Options(
          headers: <String, dynamic>{
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );

      final normalized =
          AccessPolicyEvaluator.normalizeCapabilities(response.data);
      repo.setCapabilities(normalized);
      return normalized;
    } catch (e) {
      debugPrint(
        '[CapabilitiesService] Failed to sync capabilities from "$resolvedUrl": $e',
      );
      if (failClosed && !repo.hasCapabilitiesLoaded) {
        repo.setCapabilities(const <String>[]);
      }
      return null;
    }
  }
}
