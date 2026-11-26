import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Interactive Action Confirmation',
  type: CardConfirmation,
  path: '[Popups]/Dialogs',
)
Widget interactiveConfirmationDialogUseCase(BuildContext context) {
  final label = context.knobs.string(
    label: 'Target Label',
    initialValue: 'CAPA-2026-0042',
  );
  final message = context.knobs.string(
    label: 'Custom Confirmation Message',
    initialValue: 'Apakah Anda yakin ingin memproses dokumen CAPA-2026-0042?',
  );
  final danger = context.knobs.boolean(
    label: 'Danger / Destructive Style',
    initialValue: false,
  );

  return Center(
    child: ElevatedButton.icon(
      icon: Icon(danger ? Icons.delete_outline : Icons.check_circle_outline),
      label: const Text('Buka Dialog Konfirmasi'),
      onPressed: () {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (dialogCtx) {
            var isProgress = false;
            return StatefulBuilder(
              builder: (ctx, setState) {
                return CardConfirmation.action(
                  isProgress: isProgress,
                  action: danger ? DataAction.delete : DataAction.approve,
                  data: Entity.assetType,
                  label: label,
                  danger: danger,
                  confirmationMessageText: message.isEmpty ? null : message,
                  onConfirm: () async {
                    setState(() => isProgress = true);
                    await Future<void>.delayed(
                      const Duration(milliseconds: 800),
                    );
                    if (ctx.mounted) {
                      Navigator.of(ctx).pop();
                    }
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Aksi dikonfirmasi: $label')),
                      );
                    }
                  },
                );
              },
            );
          },
        );
      },
    ),
  );
}

@UseCase(
  name: 'Destructive Delete Preview (Inline)',
  type: CardConfirmation,
  path: '[Popups]/Dialogs',
)
Widget destructiveConfirmationInlineUseCase(BuildContext context) {
  final isProgress = context.knobs.boolean(
    label: 'Loading (isProgress)',
    initialValue: false,
  );

  return Center(
    child: CardConfirmation.action(
      isProgress: isProgress,
      action: DataAction.delete,
      data: Entity.assetType,
      label: 'Batch #B-2026-019',
      danger: true,
      confirmationMessageText:
          'Data yang sudah dihapus tidak dapat dikembalikan. Lanjutkan penghapusan?',
      onConfirm: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Delete confirmed!')),
        );
      },
    ),
  );
}
