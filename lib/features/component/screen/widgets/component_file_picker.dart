import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component_file_picker.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

extension ComponentFilePickerWidgets on ComponentFilePicker {
  Widget toWidget(JsonMap data) {
    final controller = data['controller'] as TextEditingController? ??
        (data['allControllers'] != null
            ? (data['allControllers'] as Map<String, TextEditingController>)[id]
            : null) ??
        TextEditingController(text: initialValue);

    return _FilePickerWidget(
      label: label,
      controller: controller,
      enabled: enabled,
      isRequired: this.required,
      allowedExtensions: allowedExtensions,
    );
  }

  Widget toMockWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
        ],
        Container(
          height: 44,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Select file...',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                ),
              ),
              Icon(Icons.attach_file, color: Colors.grey.shade600, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}

class _FilePickerWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool enabled;
  final bool isRequired;
  final List<String>? allowedExtensions;

  const _FilePickerWidget({
    required this.label,
    required this.controller,
    required this.enabled,
    required this.isRequired,
    this.allowedExtensions,
  });

  @override
  State<_FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<_FilePickerWidget> {
  Future<void> _pickFile() async {
    if (!widget.enabled) return;

    final result = await FilePicker.platform.pickFiles(
      type: widget.allowedExtensions != null ? FileType.custom : FileType.any,
      allowedExtensions: widget.allowedExtensions,
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        widget.controller.text = result.files.single.path!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: _pickFile,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                const Icon(Icons.attach_file),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.controller.text.isEmpty
                        ? 'Click to select file'
                        : widget.controller.text.split('/').last,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (widget.controller.text.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        widget.controller.clear();
                      });
                    },
                  ),
              ],
            ),
          ),
        ),
        if (widget.isRequired && widget.controller.text.isEmpty)
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'File is required',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
