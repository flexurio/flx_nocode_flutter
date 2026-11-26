import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/symbol_picker_dialog.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Interactive Symbol Picker',
  type: SymbolPickerDialog,
  path: '[Popups]/Dialogs',
)
Widget interactiveSymbolPickerUseCase(BuildContext context) {
  return const _SymbolPickerDemo();
}

@UseCase(
  name: 'Inline Dialog Preview',
  type: SymbolPickerDialog,
  path: '[Popups]/Dialogs',
)
Widget inlineSymbolPickerUseCase(BuildContext context) {
  final controller = TextEditingController(text: 'Konsentrasi 25 µg/mL ± 0.5%');
  return Center(
    child: SymbolPickerDialog(controller: controller),
  );
}

class _SymbolPickerDemo extends StatefulWidget {
  const _SymbolPickerDemo();

  @override
  State<_SymbolPickerDemo> createState() => _SymbolPickerDemoState();
}

class _SymbolPickerDemoState extends State<_SymbolPickerDemo> {
  final _controller = TextEditingController(
    text: 'Suhu ruang 25°C, pH 7.0 ',
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 460),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _controller,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Spesifikasi / Formula',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.functions),
                label: const Text('Buka Symbol Picker Popup'),
                onPressed: () {
                  showSymbolPickerDialog(
                    context: context,
                    controller: _controller,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
