import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchPurchaseOrderDetail extends StatelessWidget
    implements DropDownObject<PurchaseOrderDetail> {
  const FDropDownSearchPurchaseOrderDetail({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final PurchaseOrderDetail? initialValue;

  @override
  final void Function(PurchaseOrderDetail?) onChanged;

  @override
  final String? label;

  @override
  final bool isRequired;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(PurchaseOrderDetail?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<PurchaseOrderDetailQueryBloc,
        PurchaseOrderDetailQueryState>(
      builder: (context, state) {
        return FDropDownSearch<PurchaseOrderDetail>(
          labelText: label ?? Entity.productionOrderDetail.title,
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
            loaded: (productionOrderDetails) => productionOrderDetails,
          ),
          itemAsString: (productionOrderDetail) =>
              '${productionOrderDetail.productionOrder?.id} '
              '${productionOrderDetail.product?.name ?? ''}',
        );
      },
    );
  }
}
