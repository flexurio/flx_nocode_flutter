import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReceiveCreateProductsForm extends StatefulWidget {
  const ProductReceiveCreateProductsForm({
    required this.onNext,
    required this.onPrevious,
    super.key,
  });

  final void Function() onNext;
  final void Function() onPrevious;

  @override
  State<ProductReceiveCreateProductsForm> createState() =>
      _ProductReceiveCreateProductsFormState();
}

class _ProductReceiveCreateProductsFormState
    extends State<ProductReceiveCreateProductsForm> {
  final _formKey = GlobalKey<FormState>();
  List<ProductReceiveDetail> products = [];
  ProductReceiveType? type;

  void _submit(BuildContext context, List<ProductReceiveDetail> products) {
    if (products.isNotEmpty) {
      widget.onNext();
      return;
    }
    Toast(context).fail('Please provide at least one product');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductReceiveBloc, ProductReceiveState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {},
          initial: (productReceiveDetails, productReceiveForm) {
            products = productReceiveDetails;
            type = productReceiveForm!.type;
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: FormAction(
        formKey: _formKey,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            action: DataAction.back,
            onPressed: widget.onPrevious,
          ),
          const SizedBox(width: 12),
          Button(
            permission: null,
            action: DataAction.next,
            onPressed: () => _submit(context, products),
          ),
        ],
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AddProductButton(type: type),
            ],
          ),
          SizedBox(height: 24),
          ProductReceiveDetailTable(canEdit: true),
        ],
      ),
    );
  }
}
