import 'package:flx_core_flutter/flx_core_flutter.dart' as core;
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/bloc/entity/entity_bloc.dart';
import 'package:flx_nocode_flutter/src/app/model/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BackendOther {
  final String method;
  final String url;
  final String title;
  final String visible;
  final Color color;

  BackendOther({
    required this.method,
    required this.url,
    required this.title,
    required this.visible,
    required this.color,
  });

  factory BackendOther.fromJson(Map<String, dynamic> json) {
    return BackendOther(
      method: json['method'],
      url: json['url'],
      title: json['title'],
      visible: json['visible'],
      color: core.colorFromHex(json['color']),
    );
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

  String urlWithValues(Map<String, dynamic> data) {
    final keys = data.keys;
    var url = this.url;
    for (var key in keys) {
      url = url.replaceAll('{$key}', data[key].toString());
    }
    final pageData = NoCode.pageData;
    for (var key in pageData.keys) {
      url = url.replaceAll('{page.$key}', pageData[key].toString());
    }
    return url;
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
                event: EntityEvent.otherEvent(data: data, event: event),
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
    required EntityEvent event,
  }) {
    final bloc = EntityBloc(entity);
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<EntityBloc, EntityState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: (_) {
                Toast(context).dataChanged(action, entity.coreEntity);
                onSuccess();
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<EntityBloc, EntityState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation.string(
                isProgress: isInProgress,
                action: title,
                entity: entity.coreEntity,
                label: data['id'].toString(),
                onConfirm: () {
                  bloc.add(event);
                },
              );
            },
          ),
        );
      },
    );
  }
}
