import 'package:flexurio_chiron_accounting/src/app/bloc/balance_group_query/balance_group_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/balance_group.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchBalanceGroup extends StatelessWidget
    implements DropDownObject<BalanceGroup> {
  const FDropDownSearchBalanceGroup({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.label,
    this.enabled = true,
  });

  @override
  final BalanceGroup? initialValue;

  @override
  final void Function(BalanceGroup?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(BalanceGroup?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<BalanceGroupQueryBloc, BalanceGroupQueryState>(
      builder: (context, state) {
        return FDropDownSearch<BalanceGroup>(
          enabled: enabled,
          labelText: label ?? Entity.balanceGroup.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          itemAsString: (balanceGroup) => balanceGroup.name,
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (balanceGroup) => balanceGroup,
          ),
          status: state.maybeWhen(
            orElse: () => Status.loaded,
            error: (_) => Status.error,
            loading: () => Status.progress,
          ),
        );
      },
    );
  }
}
