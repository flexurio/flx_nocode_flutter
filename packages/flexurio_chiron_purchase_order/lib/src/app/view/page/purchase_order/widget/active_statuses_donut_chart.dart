import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order_query/purchase_order_query_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveStatusesDonutChart extends StatelessWidget {
  const ActiveStatusesDonutChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseOrderQueryBloc, PurchaseOrderQueryState>(
      builder: (context, state) {
        final purchaseOrders = state.maybeWhen(
          loaded: (purchaseOrder) => purchaseOrder.data,
          orElse: () => <PurchaseOrder>[],
        );

        var inputCount = 0.0;
        var confirmManagerCount = 0.0;
        var confirmAccountingCount = 0.0;
        var nextShippingCount = 0.0;
        for (final purchaseOrder in purchaseOrders) {
          if (purchaseOrder.status.isInput) inputCount++;
          if (purchaseOrder.status.isConfirmManager) confirmManagerCount++;
          if (purchaseOrder.status.isConfirmAccounting) {
            confirmAccountingCount++;
          }
          if (purchaseOrder.status.isNextShipping) nextShippingCount++;
        }

        return DonutChart(
          title: 'Active Statuses',
          dataSource: [
            ChartData(
              label: PurchaseOrderStatus.input.label,
              color: PurchaseOrderStatus.input.color,
              value: inputCount,
            ),
            ChartData(
              label: PurchaseOrderStatus.confirmManager.label,
              color: PurchaseOrderStatus.confirmManager.color,
              value: confirmManagerCount,
            ),
            ChartData(
              label: PurchaseOrderStatus.accountingConfirm.label,
              color: PurchaseOrderStatus.accountingConfirm.color,
              value: confirmAccountingCount,
            ),
            ChartData(
              label: PurchaseOrderStatus.nextShipping.label,
              color: PurchaseOrderStatus.nextShipping.color,
              value: nextShippingCount,
            ),
          ],
        );
      },
    );
  }
}
