import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchProductionMachine extends StatelessWidget
    implements DropDownObject<ProductionMachine> {
  const FDropDownSearchProductionMachine({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final ProductionMachine? initialValue;

  @override
  final void Function(ProductionMachine? value) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(ProductionMachine?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<ProductionMachineQueryBloc, ProductionMachineQueryState>(
      builder: (context, state) {
        return FDropDownSearch<ProductionMachine>(
          enabled: enabled,
          labelText: label ?? Entity.productionMachine.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: (_) => Status.progress,
            orElse: () => Status.loaded,
          ),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (machine) => machine.data,
          ),
          itemAsString: (machine) => machine.name,
        );
      },
    );
  }
}
