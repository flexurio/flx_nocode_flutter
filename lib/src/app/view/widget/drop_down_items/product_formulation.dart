import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_query/product_formulation_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchProductFormulation extends StatelessWidget
    implements DropDownObject<ProductFormulation> {
  const FDropDownSearchProductFormulation({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final ProductFormulation? initialValue;

  @override
  final void Function(ProductFormulation?) onChanged;

  @override
  final String? label;

  @override
  final bool isRequired;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(ProductFormulation?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<ProductFormulationQueryBloc,
        ProductFormulationQueryState>(
      builder: (context, state) {
        return FDropDownSearch<ProductFormulation>(
          labelText: label ?? Entity.billOfMaterial.title,
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
            loaded: (productFormulation) => productFormulation.data,
          ),
          itemAsString: (productFormulation) =>
              '[${productFormulation.scale.productFormulationScale}] ${productFormulation.product.name}',
        );
      },
    );
  }
}
