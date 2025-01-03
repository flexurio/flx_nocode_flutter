import 'package:flexurio_chiron_accounting/src/app/model/budget_type.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';

class FDropDownSearchBudgetTypeDepartmentType extends StatelessWidget
    implements DropDownObject<BudgetTypeDepartmentType> {
  const FDropDownSearchBudgetTypeDepartmentType({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });
  @override
  final BudgetTypeDepartmentType? initialValue;

  @override
  final void Function(BudgetTypeDepartmentType?) onChanged;

  @override
  final String? label;

  @override
  final bool isRequired;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(BudgetTypeDepartmentType?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }
    return FDropDownSearch<BudgetTypeDepartmentType>(
      labelText: label ?? 'Department Type',
      initialValue: initialValue,
      enabled: enabled,
      validator: validator,
      itemAsString: (dt) => dt.label,
      items: BudgetTypeDepartmentType.list,
      onChanged: onChanged,
    );
  }
}
