import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order_query/purchase_order_query_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchPurchaseOrder extends StatelessWidget
    implements DropDownObject<PurchaseOrder> {
  const FDropDownSearchPurchaseOrder({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
    this.validatorX,
  });

  @override
  final PurchaseOrder? initialValue;

  @override
  final void Function(PurchaseOrder?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  final String? Function(PurchaseOrder?)? validatorX;

  @override
  Widget build(BuildContext context) {
    String? Function(PurchaseOrder?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }
    if (validatorX != null) {
      validator = validatorX;
    }

    return BlocBuilder<PurchaseOrderQueryBloc, PurchaseOrderQueryState>(
      builder: (context, state) {
        return FDropDownSearch<PurchaseOrder>(
          enabled: enabled,
          labelText: label ?? Entity.purchaseOrder.title,
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
            loaded: (purchaseOrder) => purchaseOrder.data,
          ),
          itemAsString: (purchaseOrder) => purchaseOrder.id,
        );
      },
    );
  }
}
