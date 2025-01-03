import 'package:flexurio_chiron_product/src/app/bloc/product_group_query/product_group_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product_group.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchProductGroup extends StatelessWidget
    implements DropDownObject<ProductGroup> {
  const FDropDownSearchProductGroup({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final ProductGroup? initialValue;

  @override
  final void Function(ProductGroup? value) onChanged;

  @override
  final String? label;

  @override
  final bool isRequired;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(ProductGroup?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<ProductGroupQueryBloc, ProductGroupQueryState>(
      builder: (context, state) {
        return FDropDownSearch<ProductGroup>(
          labelText: label ?? Entity.productGroup.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          enabled: enabled,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: () => Status.progress,
            orElse: () => Status.loaded,
          ),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (productGroups) => productGroups,
          ),
          itemAsString: (productGroup) => productGroup.id,
        );
      },
    );
  }
}
