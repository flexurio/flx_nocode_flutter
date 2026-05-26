import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/component/models/component_selection_base.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component.dart';
import 'package:gap/gap.dart';

/// A themed dialog that shows filter fields before executing a print action.
/// Uses dynamic [Component] structure to allow flexible inputs including dropdowns from API.
///
/// Returns a [Map<String, String>] with key-value pairs of all generated values.
class PrintFilterDialog extends StatefulWidget {
  final String printName;
  final List<Component> fields;
  final Map<String, dynamic> initialData;

  const PrintFilterDialog({
    super.key,
    required this.printName,
    required this.fields,
    this.initialData = const {},
  });

  /// Show the print filter dialog. Returns the collected filter data,
  /// or null if dismissed.
  static Future<Map<String, String>?> show(
    BuildContext context, {
    required String printName,
    required List<Component> fields,
    Map<String, dynamic> initialData = const {},
  }) {
    return showDialog<Map<String, String>?>(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (ctx) => PrintFilterDialog(
        printName: printName,
        fields: fields,
        initialData: initialData,
      ),
    );
  }

  @override
  State<PrintFilterDialog> createState() => _PrintFilterDialogState();
}

class _PrintFilterDialogState extends State<PrintFilterDialog> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _allControllers = {};
  bool _isProgress = false;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    // 1. Initialize controllers for the explicit fields
    for (final component in widget.fields) {
      final initialVal = widget.initialData[component.id]?.toString() ?? '';
      _allControllers[component.id] = TextEditingController(text: initialVal);

      // 2. Also scan for actions that target other IDs (e.g. side-effects setting department_name)
      if (component is ComponentSelectionBase) {
        for (final action in component.onChangeActions) {
          final tid = action.targetId;
          if (tid.isNotEmpty && !_allControllers.containsKey(tid)) {
            final secondaryVal = widget.initialData[tid]?.toString() ?? '';
            _allControllers[tid] = TextEditingController(text: secondaryVal);
          }
        }
      }
    }
  }

  @override
  void dispose() {
    for (final c in _allControllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  void _onConfirm() {
    if (_formKey.currentState!.validate()) {
      // Harvest results from ALL registered controllers (including dynamic side-effects)
      final Map<String, String> finalResult = {};
      _allControllers.forEach((key, controller) {
        finalResult[key] = controller.text.trim();
      });

      Navigator.of(context).pop(finalResult);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    // Construct the dynamic framework context that children will receive
    final renderData = {
      'allControllers': _allControllers,
      'data': widget.initialData,
    };

    return Theme(
      data: theme.copyWith(cardColor: Colors.white),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: CardForm(
          popup: true,
          title: widget.printName,
          icon: Icons.calendar_month,
          actions: [
            Button.action(
              permission: null,
              isSecondary: true,
              isInProgress: _isProgress,
              onPressed: () => Navigator.pop(context),
              action: DataAction.cancel,
            ),
            const SizedBox(width: 10),
            Button.action(
              permission: null,
              color: primaryColor,
              isInProgress: _isProgress,
              onPressed: _onConfirm,
              action: DataAction.print,
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < widget.fields.length; i++) ...[
                if (i > 0) const Gap(16),
                // Render via the core component rendering extension
                widget.fields[i].toWidget(
                  data: renderData,
                  controllers: _allControllers,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
