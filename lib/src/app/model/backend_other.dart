import 'package:hive_ce/hive.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart' as core;
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/bloc/entity/entity_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackendOther extends HiveObject {
  final String method;
  final String url;
  final String title;
  final String visible;
  final Color color;
  final Map<String, String>? headers;

  /// Whether to use mock data instead of calling the actual API.
  final bool mockEnabled;

  /// The data to return when [mockEnabled] is true.
  final Object? mockData;

  BackendOther({
    required this.method,
    required this.url,
    required this.title,
    required this.visible,
    required this.color,
    this.headers,
    this.mockEnabled = false,
    this.mockData,
  });

  factory BackendOther.fromJson(Map<String, dynamic> json) {
    return BackendOther(
      method: json['method'],
      url: json['url'],
      title: json['title'],
      visible: json['visible'],
      color: core.colorFromHex(json['color']),
      headers: (json['headers'] as Map?)?.cast<String, String>(),
      mockEnabled: (json['mock_enabled'] as bool?) ?? false,
      mockData: json['mock_data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'method': method,
      'url': url,
      'title': title,
      'visible': visible,
      'color': '#${color.value.toRadixString(16).padLeft(8, '0')}',
      'headers': headers,
      'mock_enabled': mockEnabled,
      'mock_data': mockData,
    };
  }

  bool checkVisible(Map<String, dynamic> data) {
    if (visible.contains('visible_by_field_bool')) {
      final regex = RegExp(r'\((.*?)\)');
      final match = regex.firstMatch(visible);
      if (match != null) {
        var insideParentheses = match.group(1);
        final isNegation = insideParentheses!.startsWith('!');
        if (isNegation) {
          insideParentheses = insideParentheses.substring(1);
        }
        if (data.containsKey(insideParentheses)) {
          final value = data[insideParentheses] as bool;
          if (isNegation) {
            return !value;
          }
          return data[insideParentheses];
        }
      }
    }
    return false;
  }

  static List<BackendOther> fromJsonList(List<dynamic> json) =>
      json.map((e) => BackendOther.fromJson(e)).toList();

  static List<ActionButtonItem> buildButton({
    required List<BackendOther> events,
    required BuildContext context,
    required EntityCustom entity,
    required Map<String, dynamic> data,
  }) {
    final children = <ActionButtonItem>[];

    for (var event in events) {
      if (event.checkVisible(data)) {
        children.add(
          ActionButtonItem(
            color: event.color,
            icon: Icons.assignment,
            label: event.title,
            onPressed: () async {
              BackendOther.showConfirmationDialog(
                onConfirm: (controller) =>
                    controller.otherEvent(data: data, event: event),
                context: context,
                onSuccess: () => Navigator.pop(context),
                entity: entity,
                data: data,
                title: event.title,
              );
            },
          ),
        );
      }
    }

    return children;
  }

  static Future<bool?> showConfirmationDialog({
    required BuildContext context,
    required VoidCallback onSuccess,
    required EntityCustom entity,
    required Map<String, dynamic> data,
    required String title,
    required Function(EntityController controller) onConfirm,
  }) {
    final tag = 'confirmation_${DateTime.now().millisecondsSinceEpoch}';
    final controller = Get.put(EntityController(entity), tag: tag);
    return showDialog<bool?>(
      barrierDismissible: false,
      useRootNavigator: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return Obx(() {
          final state = controller.state;

          state.maybeWhen(
            success: (_) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (controller.state is Success) {
                  Toast(context).dataChanged(action, entity.coreEntity);
                  onSuccess();
                  Navigator.pop(context, true);
                  Get.delete<EntityController>(tag: tag);
                }
              });
            },
            error: (error) => WidgetsBinding.instance.addPostFrameCallback((_) {
              Toast(context).fail(error);
            }),
            orElse: () {},
          );

          final isInProgress = state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );

          return CardConfirmation.string(
            isProgress: isInProgress,
            action: title,
            entity: entity.coreEntity,
            label: data['id'].toString(),
            onConfirm: () => onConfirm(controller),
          );
        });
      },
    );
  }
}

Map<String, dynamic> mapAddPageData({
  required Map<String, dynamic> data,
  required Map<String, dynamic> filters,
}) {
  final newData = <String, dynamic>{};
  for (var key in data.keys) {
    var value = data[key];
    for (var pageKey in NoCode.pageData.keys) {
      value = value.replaceAll('{page.$pageKey}', NoCode.pageData[pageKey]);
    }
    for (var filterKey in filters.keys) {
      value = value.replaceAll('{filter.$filterKey}', filters[filterKey]);
    }
    newData[key] = value;
  }

  for (var key in newData.keys) {
    final value = newData[key];
    if (value is String) {
      final regex = RegExp(r'\{[^}]+\}');
      if (regex.hasMatch(value)) {
        throw FormatException(
            'Unreplaced placeholder found in key "$key": "$value"');
      }
    }
  }

  return newData;
}

String urlWithValuesReplace(String urlX, Map<String, dynamic> data) {
  final keys = data.keys;
  var url = urlX;
  for (var key in keys) {
    url = url.replaceAll('{$key}', data[key].toString());
  }
  final pageData = NoCode.pageData;
  for (var key in pageData.keys) {
    url = url.replaceAll('{page.$key}', pageData[key].toString());
  }
  return url;
}
