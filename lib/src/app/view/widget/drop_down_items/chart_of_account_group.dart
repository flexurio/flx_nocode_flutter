import 'package:flexurio_chiron_accounting/src/app/bloc/chart_of_account_group_query/chart_of_account_group_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_group.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchChartOfAccountGroup extends StatelessWidget
    implements DropDownObject<ChartOfAccountGroup> {
  const FDropDownSearchChartOfAccountGroup({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.label,
    this.enabled = true,
  });

  @override
  final ChartOfAccountGroup? initialValue;

  @override
  final void Function(ChartOfAccountGroup?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(ChartOfAccountGroup?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<ChartOfAccountGroupQueryBloc,
        ChartOfAccountGroupQueryState>(
      builder: (context, state) {
        return FDropDownSearch<ChartOfAccountGroup>(
          enabled: enabled,
          labelText: label ?? Entity.chartOfAccountGroup.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          itemAsString: (chartOfAccountGroup) => chartOfAccountGroup.name,
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (chartOfAccountGroups) => chartOfAccountGroups,
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
