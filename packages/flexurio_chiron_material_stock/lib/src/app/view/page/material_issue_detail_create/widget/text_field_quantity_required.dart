import 'package:flexurio_chiron_production/src/app/bloc/formulation_query_quantity/formulation_query_quantity_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class FTextFormFieldQuantityRequired extends StatelessWidget {
  const FTextFormFieldQuantityRequired({
    required this.quantityRequiredController,
    required this.product,
    required this.material,
    super.key,
  });

  final Product product;
  final model.Material material;
  final TextEditingController quantityRequiredController;

  static Widget prepare({
    required Product product,
    required model.Material material,
    required TextEditingController quantityRequiredController,
  }) {
    return BlocProvider(
      create: (context) => FormulationQueryQuantityBloc()
        ..add(
          FormulationQueryQuantityEvent.fetch(
            product: product,
            material: material,
          ),
        ),
      child: FTextFormFieldQuantityRequired(
        product: product,
        material: material,
        quantityRequiredController: quantityRequiredController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormulationQueryQuantityBloc,
        FormulationQueryQuantityState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (formulationQuantities) {
            return quantityRequiredController.text =
                formulationQuantities.quantity.toString();
          },
        );
      },
      child: FTextFormField(
        labelText: 'Quantity Required',
        enabled: false,
        controller: quantityRequiredController,
        inputFormatters: [
          ThousandsFormatter(),
        ],
      ),
    );
  }
}
