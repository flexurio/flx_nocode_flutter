import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';

extension ActionConfirmDialogExtension on ActionD {
  Future<void> showConfirmDialog<T>({
    required BuildContext context,
    required DataAction action,
    required String label,
    String? confirmationMessageText,
    required Future<void> Function(BuildContext ctx) onConfirm,
  }) async {
    await showDialog<void>(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (dialogCtx) {
        bool isProgress = false;
        return StatefulBuilder(builder: (ctx, setState) {
          return CardConfirmation.action(
            isProgress: isProgress,
            action: action,
            data: Entity.assetType,
            label: label,
            confirmationMessageText: confirmationMessageText,
            onConfirm: () async {
              setState(() => isProgress = true);
              try {
                await onConfirm(ctx);
                if (ctx.mounted) {
                  final route = ModalRoute.of(ctx);
                  if (route != null) {
                    if (route.isCurrent) {
                      Navigator.of(ctx).pop();
                    } else {
                      Navigator.of(ctx).removeRoute(route);
                    }
                  }
                }
              } finally {
                if (ctx.mounted) {
                  setState(() => isProgress = false);
                }
              }
            },
          );
        });
      },
    );
  }
}
