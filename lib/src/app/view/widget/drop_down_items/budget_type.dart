import 'package:flexurio_chiron_accounting/src/app/bloc/budget_type_query/budget_type_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/budget_type.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchBudgetType extends StatelessWidget
    implements DropDownObject<BudgetType> {
  const FDropDownSearchBudgetType({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.label,
    this.enabled = true,
  });

  @override
  final BudgetType? initialValue;

  @override
  final void Function(BudgetType?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(BudgetType?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<BudgetTypeQueryBloc, BudgetTypeQueryState>(
      builder: (context, state) {
        return FDropDownSearch<BudgetType>(
          enabled: enabled,
          labelText: label ?? Entity.budgetType.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          itemAsString: (budgetType) => budgetType.name,
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (budgetTypes) => budgetTypes,
          ),
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: () => Status.progress,
            orElse: () => Status.loaded,
          ),
        );
      },
    );
  }
}
