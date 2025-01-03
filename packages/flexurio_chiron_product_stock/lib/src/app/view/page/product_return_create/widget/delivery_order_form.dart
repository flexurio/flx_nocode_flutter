import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return/product_return_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_create/widget/detail_table.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_create/widget/producte_return_detail_add_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductReturnCreateDeliveryOrderForm extends StatefulWidget {
  const ProductReturnCreateDeliveryOrderForm({
    required this.onNext,
    required this.onPrevious,
    super.key,
  });

  final void Function() onNext;
  final void Function() onPrevious;

  @override
  State<ProductReturnCreateDeliveryOrderForm> createState() =>
      _ProductReturnCreateDeliveryOrderFormState();
}

class _ProductReturnCreateDeliveryOrderFormState
    extends State<ProductReturnCreateDeliveryOrderForm> {
  final _formKey = GlobalKey<FormState>();

  void _submit(BuildContext context, List<ProductReturnDetail>? products) {
    if (products!.isNotEmpty) {
      widget.onNext();
      return;
    }
    Toast(context).fail('Please provide at least one material');
  }

  @override
  Widget build(BuildContext context) {
    return FormAction(
      formKey: _formKey,
      actions: [
        Button(
          permission: null,
          action: DataAction.back,
          isSecondary: true,
          onPressed: widget.onPrevious,
        ),
        const Gap(12),
        BlocBuilder<ProductReturnBloc, ProductReturnState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: Container.new,
              initial: (products, customerForm) {
                return Button(
                  permission: null,
                  action: DataAction.next,
                  onPressed: () {
                    _submit(context, products);
                  },
                );
              },
            );
          },
        ),
      ],
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ProductReturnAddButton(
              productReturnBloc: context.read<ProductReturnBloc>(),
            ),
          ],
        ),
        const Gap(24),
        const ProductReturnDetailTable(
          isView: false,
        ),
      ],
    );
  }
}
