import 'package:flx_core_flutter/src/app/util/icon_util.dart';
import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/pages/create_page.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action.dart';

class ActionButtonRegular extends StatefulWidget {
  const ActionButtonRegular({
    super.key,
    required this.actionD,
    required this.entity,
    required this.parentData,
    required this.filters,
    required this.onSuccess,
  });

  final ActionD actionD;
  final EntityCustom entity;
  final List<Map<String, dynamic>> parentData;
  final Map<String, dynamic> filters;
  final VoidCallback onSuccess;

  @override
  State<ActionButtonRegular> createState() => _ActionButtonRegularState();
}

class _ActionButtonRegularState extends State<ActionButtonRegular> {
  Status? _status;

  Future<void> _onPressed() async {
    if (_status == Status.progress) return;

    setState(() => _status = Status.progress);
    try {
      final type = widget.actionD.type;
      final action = widget.actionD;

      switch (type) {
        case ActionType.showDialog:
          await showDialog(
            context: context,
            useRootNavigator: false,
            barrierDismissible: false,
            builder: (ctx) {
              return CreatePage.prepare(
                popup: true,
                embedded: true,
                entity: widget.entity,
                layoutFormId: action.layoutFormId ?? '',
                parentData: widget.parentData,
                filters: widget.filters,
                width: action.width,
                onSuccess: () {
                  widget.onSuccess();
                },
              );
            },
          );
          break;

        case ActionType.http:
          if (action.http == null) {
            Toast(context).fail('No http data found');
            return;
          }
          await action.executeHttp(widget.entity, context, widget.filters,
              onSuccessCallback: widget.onSuccess);
          break;

        case ActionType.showConfirmationDialog:
          await action.showConfirmDialog(
            context: context,
            action: action.action,
            label: action.name,
            confirmationMessageText: action.confirmMessage,
            onConfirm: (ctx) async {
              if (action.http != null) {
                await action.executeHttp(widget.entity, ctx, widget.filters,
                    onSuccessCallback: widget.onSuccess);
              } else {
                action.handleOnSuccessSingle(
                  entity: widget.entity,
                  context: context,
                  responseData: null,
                  data: widget.filters,
                  onSuccessCallback: widget.onSuccess,
                );
              }
            },
          );
          break;

        case ActionType.openPage:
        default:
          await Navigator.push(
            context,
            CreatePage.route(
              entity: widget.entity,
              onSuccess: widget.onSuccess,
              embedded: false,
              parentData: widget.parentData,
              filters: widget.filters,
              layoutFormId: action.layoutFormId ?? '',
            ),
          );
          break;
      }
    } catch (e) {
      debugPrint('Error executing action: $e');
    } finally {
      if (mounted) {
        setState(() => _status = null);
      }
    }
  }

  Color? _parseColor(String? colorStr) {
    if (colorStr == null || colorStr.isEmpty) return null;
    try {
      if (colorStr.startsWith('#')) {
        var hex = colorStr.replaceFirst('#', '');
        if (hex.length == 6) hex = 'FF$hex';
        return Color(int.parse('0x$hex'));
      }
      if (colorStr.startsWith('0x')) {
        return Color(int.parse(colorStr));
      }
      return Color(int.parse('0x$colorStr'));
    } catch (e) {
      debugPrint('Error parsing color: $colorStr');
      return null;
    }
  }

  IconData? _actionIcon(ActionD action) {
    if (action.icon != null) {
      return getIconByName(action.icon);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      title: widget.actionD.name,
      action: widget.actionD.action,
      iconColor: _parseColor(widget.actionD.iconColor),
      onPressed: _onPressed,
      status: _status,
      permissions: widget.entity.bypassAllPermissions
          ? null
          : [widget.actionD.getPermission(widget.entity.id)],
      iconOverride: _actionIcon(widget.actionD),
    );
  }
}
