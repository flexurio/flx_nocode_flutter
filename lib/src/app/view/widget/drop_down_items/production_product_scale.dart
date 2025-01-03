import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/widgets.dart';

class FDropDownSearchProductionProductScale extends StatelessWidget
    implements DropDownObject<ProductionProductScale> {
  const FDropDownSearchProductionProductScale({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final ProductionProductScale? initialValue;

  @override
  final void Function(ProductionProductScale?) onChanged;

  @override
  final String? label;

  @override
  final bool isRequired;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(ProductionProductScale?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return FDropDownSearch<ProductionProductScale>(
      labelText: label ?? 'Scale',
      onChanged: onChanged,
      initialValue: initialValue,
      validator: validator,
      enabled: enabled,
      items: ProductionProductScale.list,
      itemAsString: (material) => material.label,
    );
  }
}
