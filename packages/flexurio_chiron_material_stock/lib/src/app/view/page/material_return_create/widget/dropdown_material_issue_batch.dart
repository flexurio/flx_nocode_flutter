import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchMaterialIssueBatch extends StatelessWidget
    implements DropDownObject<ProductionOrder> {
  const FDropDownSearchMaterialIssueBatch({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
    this.small = false,
    this.productId,
  });

  @override
  final ProductionOrder? initialValue;

  @override
  final void Function(ProductionOrder?) onChanged;

  @override
  final String? label;

  @override
  final bool isRequired;

  @override
  final bool enabled;

  final bool small;

  final String? productId;

  @override
  Widget build(BuildContext context) {
    String? Function(ProductionOrder?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<MaterialIssueQueryBloc, MaterialIssueQueryState>(
      builder: (context, state) {
        if (small) {
          return DropDownSmall<ProductionOrder>(
            key: ValueKey(initialValue),
            labelText: label ?? Entity.productionOrder.title,
            itemAsString: (batch) => batch.id,
            initialValue: initialValue,
            items: state.maybeWhen(
              orElse: () => [],
              loaded: (materialIssues) =>
                  materialIssues.data.map((e) => e.batch).toSet().toList(),
            ),
            onChanged: onChanged,
          );
        }
        return FDropDownSearch<ProductionOrder>(
          labelText: label ?? Entity.productionOrder.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          enabled: enabled,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: (_) => Status.progress,
            orElse: () => Status.loaded,
          ),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (materialIssue) => materialIssue.data
                .where((element) {
                  if (productId != null) {
                    return element.product.id == productId;
                  }
                  return true;
                })
                .map((e) => e.batch)
                .toList(),
          ),
          itemAsString: (batch) => batch.id,
        );
      },
    );
  }
}
