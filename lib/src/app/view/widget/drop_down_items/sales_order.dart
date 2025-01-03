import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_query/sales_order_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchSalesOrder extends StatelessWidget
    implements DropDownObject<SalesOrder> {
  const FDropDownSearchSalesOrder({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final SalesOrder? initialValue;

  @override
  final void Function(SalesOrder?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(SalesOrder?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<SalesOrderQueryBloc, SalesOrderQueryState>(
      builder: (context, state) {
        return FDropDownSearch<SalesOrder>(
          enabled: enabled,
          labelText: label ?? Entity.department.title,
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
            loaded: (salesOrder, _) => salesOrder.data,
          ),
          itemAsString: (salesOrder) => salesOrder.deliveryOrderId,
        );
      },
    );
  }
}
