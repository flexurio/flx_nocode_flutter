import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/shared/services/http_request_executor.dart';
import 'package:get/get.dart';

class ActionVisibilityWrapper extends StatefulWidget {
  final ActionD action;
  final Map<String, dynamic> data;
  final Widget child;

  const ActionVisibilityWrapper({
    super.key,
    required this.action,
    required this.data,
    required this.child,
  });

  @override
  State<ActionVisibilityWrapper> createState() => _ActionVisibilityWrapperState();
}

class _ActionVisibilityWrapperState extends State<ActionVisibilityWrapper> {
  static final Map<String, HttpRequestResult> _cache = {};
  static final Map<String, Future<HttpRequestResult>> _pending = {};

  bool? _isVisible;

  @override
  void initState() {
    super.initState();
    _checkVisibility();
  }

  @override
  void didUpdateWidget(covariant ActionVisibilityWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.action.visibilityHttp?.http.url != widget.action.visibilityHttp?.http.url ||
        oldWidget.data != widget.data) {
      _checkVisibility();
    }
  }

  Future<void> _checkVisibility() async {
    final visHttp = widget.action.visibilityHttp;
    if (visHttp == null) {
      if (mounted) {
        setState(() {
          _isVisible = true;
        });
      }
      return;
    }

    try {
      final executor = Get.isRegistered<HttpRequestExecutor>()
          ? Get.find<HttpRequestExecutor>()
          : HttpRequestExecutor();

      final requestConfig = visHttp.http.toRequestConfig(widget.data);
      final cacheKey = '${requestConfig.method}:${requestConfig.url}:${requestConfig.body}';

      HttpRequestResult result;
      if (_cache.containsKey(cacheKey)) {
        result = _cache[cacheKey]!;
      } else {
        if (_pending.containsKey(cacheKey)) {
          result = await _pending[cacheKey]!;
        } else {
          final future = executor.execute(requestConfig);
          _pending[cacheKey] = future;
          result = await future;
          _cache[cacheKey] = result;
          _pending.remove(cacheKey);
        }
      }

      if (!result.isSuccess) {
        if (mounted) {
          setState(() {
            _isVisible = false;
          });
        }
        return;
      }

      final responseData = result.data;
      bool visible = true;

      if (visHttp.rule != null) {
        final evalState = <String, dynamic>{};
        if (responseData is Map) {
          evalState.addAll(responseData.cast<String, dynamic>());
        } else if (responseData is List) {
          evalState['data'] = responseData;
        } else {
          evalState['data'] = responseData;
        }
        visible = visHttp.rule!.evaluate(evalState);
      } else {
        if (responseData == null) {
          visible = false;
        } else if (responseData is List) {
          visible = responseData.isNotEmpty;
        } else if (responseData is Map) {
          final dataField = responseData['data'];
          if (dataField is List) {
            visible = dataField.isNotEmpty;
          }
        }
      }

      if (mounted) {
        setState(() {
          _isVisible = visible;
        });
      }
    } catch (e) {
      debugPrint('[ActionVisibilityWrapper] Error checking visibility: $e');
      if (mounted) {
        setState(() {
          _isVisible = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isVisible == null) {
      return const SizedBox.shrink();
    }
    return _isVisible! ? widget.child : const SizedBox.shrink();
  }
}
