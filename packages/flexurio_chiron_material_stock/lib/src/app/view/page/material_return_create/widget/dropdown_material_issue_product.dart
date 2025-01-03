import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchMaterialIssueProduct extends StatelessWidget
    implements DropDownObject<Product> {
  const FDropDownSearchMaterialIssueProduct({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
    this.small = false,
  });

  @override
  final Product? initialValue;

  @override
  final void Function(Product?) onChanged;

  @override
  final String? label;

  @override
  final bool isRequired;

  @override
  final bool enabled;

  final bool small;

  @override
  Widget build(BuildContext context) {
    String? Function(Product?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<MaterialIssueQueryBloc, MaterialIssueQueryState>(
      builder: (context, state) {
        if (small) {
          return DropDownSmall<Product>(
            key: ValueKey(initialValue),
            labelText: label ?? Entity.product.title,
            onChanged: onChanged,
            initialValue: initialValue,
            items: state.maybeWhen(
              orElse: () => [],
              loaded: (materialIssue) =>
                  materialIssue.data.map((e) => e.product).toSet().toList(),
            ),
            itemAsString: (product) => product.name,
          );
        }
        return FDropDownSearch<Product>(
          labelText: label ?? Entity.product.title,
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
            loaded: (materialIssue) =>
                materialIssue.data.map((e) => e.product).toSet().toList(),
          ),
          itemAsString: (product) => product.name,
        );
      },
    );
  }
}
