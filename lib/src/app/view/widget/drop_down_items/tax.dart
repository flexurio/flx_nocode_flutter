import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class FDropDownSearchTaxType extends StatelessWidget
    implements DropDownObject<TaxType> {
  const FDropDownSearchTaxType({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final TaxType? initialValue;

  @override
  final void Function(TaxType?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(TaxType?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return FDropDownSearch<TaxType>(
      enabled: enabled,
      labelText: label ?? Entity.tax.title,
      onChanged: onChanged,
      initialValue: initialValue,
      validator: validator,
      items: TaxType.list,
      itemAsString: (taxType) =>
          '${taxType.label} (Tax: ${taxType.taxPercent}%, PPH22: ${taxType.pph22Percent}%)',
    );
  }
}
