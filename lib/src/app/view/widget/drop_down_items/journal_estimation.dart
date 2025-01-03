import 'package:flexurio_chiron_accounting/src/app/model/journal_estimation.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';

class FDropDownSearchJournalEstimationType extends StatelessWidget
    implements DropDownObject<JournalEstimationType> {
  const FDropDownSearchJournalEstimationType({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });
  @override
  final JournalEstimationType? initialValue;

  @override
  final void Function(JournalEstimationType?) onChanged;

  @override
  final String? label;

  @override
  final bool isRequired;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(JournalEstimationType?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }
    return FDropDownSearch<JournalEstimationType>(
      labelText: label ?? 'Type',
      initialValue: initialValue,
      enabled: enabled,
      validator: validator,
      itemAsString: (data) => data.label,
      items: JournalEstimationType.list,
      onChanged: onChanged,
    );
  }
}
