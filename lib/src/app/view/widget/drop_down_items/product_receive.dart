import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive_query/product_receive_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchProductReceive extends StatelessWidget
    implements DropDownObject<ProductReceive> {
  const FDropDownSearchProductReceive({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final ProductReceive? initialValue;

  @override
  final void Function(ProductReceive?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(ProductReceive?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<ProductReceiveQueryBloc, ProductReceiveQueryState>(
      builder: (context, state) {
        return FDropDownSearch<ProductReceive>(
          enabled: enabled,
          labelText: label ?? Entity.productReceive.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: () => Status.progress,
            orElse: () => Status.loaded,
          ),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (productReceive) => productReceive,
          ),
          itemAsString: (productReceive) => productReceive.id,
        );
      },
    );
  }
}
