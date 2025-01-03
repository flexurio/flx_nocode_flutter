import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order/purchase_order_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order_history_query/purchase_order_history_query_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HistoryTimeLine extends StatefulWidget {
  const HistoryTimeLine({
    super.key,
  });

  @override
  State<HistoryTimeLine> createState() => _HistoryTimeLineState();
}

class _HistoryTimeLineState extends State<HistoryTimeLine> {
  var _selected = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(24),
          Text(
            'histories'.tr(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Gap(12),
          BlocBuilder<PurchaseOrderHistoryQueryBloc,
              PurchaseOrderHistoryQueryState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (purchaseOrders) {
                  return TimeLine(
                    children: List.generate(
                      purchaseOrders.length,
                      (index) {
                        final purchaseOrder = purchaseOrders[index];
                        final selected = index == _selected;
                        return ListTile(
                          subtitle: Text(purchaseOrder.createdAt.yMMMdHm),
                          title: Text(
                            'Revision #${purchaseOrder.revisionNo}',
                            style: selected
                                ? TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor,
                                  )
                                : null,
                          ),
                          onTap: () {
                            context.read<PurchaseOrderBloc>().add(
                                  PurchaseOrderEvent.viewHistory(purchaseOrder),
                                );
                            setState(() {
                              _selected = index;
                            });
                          },
                        );
                      },
                    ),
                  );
                },
                error: (_) => const ErrorIndicator(),
                orElse: () => const ProgressingIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
