import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchProductionLine extends StatelessWidget
    implements DropDownObject<ProductionLine> {
  const FDropDownSearchProductionLine({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final ProductionLine? initialValue;

  @override
  final void Function(ProductionLine? value) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(ProductionLine?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<ProductionLineQueryBloc, ProductionLineQueryState>(
      builder: (context, state) {
        return FDropDownSearch<ProductionLine>(
          enabled: enabled,
          labelText: label ?? Entity.productionLine.title,
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
            loaded: (product) => product.data,
          ),
          itemAsString: (product) => product.name,
        );
      },
    );
  }
}
