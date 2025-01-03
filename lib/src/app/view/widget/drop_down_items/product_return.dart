import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchProductReturn extends StatelessWidget
    implements DropDownObject<ProductReturn> {
  const FDropDownSearchProductReturn({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final ProductReturn? initialValue;

  @override
  final void Function(ProductReturn?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(ProductReturn?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<ProductReturnQueryBloc, ProductReturnQueryState>(
      builder: (context, state) {
        return FDropDownSearch<ProductReturn>(
          enabled: enabled,
          labelText: label ?? Entity.productReturn.title,
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
            loaded: (productReturn) => productReturn.data,
          ),
          itemAsString: (productReturn) => productReturn.id,
        );
      },
    );
  }
}
