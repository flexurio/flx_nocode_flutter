import 'package:flexurio_chiron_material_stock/src/app/model/material_return.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class FDropDownSearchMaterialReturnType extends StatelessWidget
    implements DropDownObject<MaterialReturnType> {
  const FDropDownSearchMaterialReturnType({
    required this.onChanged,
    required this.list,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.label,
    this.enabled = true,
  });

  @override
  final MaterialReturnType? initialValue;
  final List<MaterialReturnType> list;

  @override
  final void Function(MaterialReturnType?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(MaterialReturnType?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return FDropDownSearch<MaterialReturnType>(
      enabled: enabled,
      labelText: label ?? 'Select Type',
      onChanged: onChanged,
      initialValue: initialValue,
      validator: validator,
      items: list,
      itemAsString: (type) => type.title,
    );
  }
}
