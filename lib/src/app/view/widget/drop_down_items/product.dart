import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FDropDownSearchProduct extends StatelessWidget
    implements DropDownObject<Product> {
  const FDropDownSearchProduct({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.small = false,
    this.label,
    this.format,
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

  final List<String>? format;

  @override
  Widget build(BuildContext context) {
    String? Function(Product?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

  return BlocBuilder<ProductQueryBloc, ProductQueryState>(
      builder: (context, state) {
      if (small) {
          return DropDownSmall<Product>(
            key: ValueKey(initialValue),
            initialValue: initialValue,
            labelText: label ?? Entity.product.title,
            itemAsString: (product) => product.id,
            items: state.maybeWhen(
              orElse: () => [],
              loaded: (products) => products.data,
            ),
            onChanged: onChanged,
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
            loaded: (products) => products.data,
          ),
          itemAsString: (product) => '[${product.id}] ${product.name}',
        );
      },
    );
  }
}


class FDropDownSearchSmallProduct extends StatelessWidget
    implements DropDownObject<Product> {
  const FDropDownSearchSmallProduct({
    required this.onChanged,
    required this.width,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.optionAll = false,
    this.label,
    this.iconField,
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

  final bool optionAll;
  final double width;
  final IconData? iconField;

  @override
  Widget build(BuildContext context) {
    String? Function(Product?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<ProductQueryBloc, ProductQueryState>(
      builder: (context, state) {
        return FDropDownSearchSmall<Product>(
          width: width,
          labelText: label ?? Entity.product.title,
          onChanged: onChanged,
          iconField: iconField ?? Icons.supervisor_account_rounded,
          initialValue: initialValue,
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (product) {
              if (optionAll) {
                return [
                  // Product.empty().copyWith(id: 'All'),
                  ...product.data,
                ];
              } else {
                return product.data;
              }
            },
          ),
          itemAsString: (product) => product.id,
        );
      },
    );
  }
}
