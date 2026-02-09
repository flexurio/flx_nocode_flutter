import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';

class ComponentTableController extends GetxController {
  final ComponentTable component;
  JsonMap contextData;

  ComponentTableController({
    required this.component,
    required this.contextData,
  });

  /// Updates the context data from the parent widget.
  void updateContextData(JsonMap newData) {
    contextData = newData;
  }

  final rows = <JsonMap>[].obs;
  final isLoading = true.obs;
  final error = RxnString();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      error.value = null;

      final httpData = component.http;

      // We want to see the interpolated values
      final requestConfig = httpData.toRequestConfig(contextData);

      // Debug prints
      debugPrint('--- ComponentTable HTTP Request ---');
      debugPrint('ID: ${component.id}');
      debugPrint('Method: ${requestConfig.method}');
      debugPrint('URL: ${requestConfig.url}');
      debugPrint('Headers: ${requestConfig.headers}');
      debugPrint('Body: ${requestConfig.body}');

      final result = await httpData.execute(contextData);

      debugPrint('--- ComponentTable HTTP Response ---');
      debugPrint('Is Success: ${result.isSuccess}');
      debugPrint('Status Code: ${result.statusCode}');

      if (result.isSuccess) {
        debugPrint('Data Type: ${result.data?.runtimeType}');
      } else {
        debugPrint('Error Message: ${result.message}');
        debugPrint('Raw Error Data: ${result.raw}');
      }

      if (!result.isSuccess) {
        error.value = result.message ?? 'Request failed';
        return;
      }

      final data = result.data;

      if (data is List) {
        rows.value = data
            .where((e) => e is Map)
            .map<JsonMap>((e) => Map<String, dynamic>.from(e as Map))
            .toList();
      } else if (data is Map) {
        final map = Map<String, dynamic>.from(data);
        final inner = map['data'];
        if (inner is List) {
          rows.value = inner
              .where((e) => e is Map)
              .map<JsonMap>((e) => Map<String, dynamic>.from(e as Map))
              .toList();
        } else {
          // If it's a single object, wrap it in a list?
          // Usually tables expect a list.
          rows.value = [map];
        }
      } else {
        rows.value = const <JsonMap>[];
      }
    } catch (e) {
      debugPrint('--- ComponentTable HTTP Error ---');
      debugPrint(e.toString());
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
