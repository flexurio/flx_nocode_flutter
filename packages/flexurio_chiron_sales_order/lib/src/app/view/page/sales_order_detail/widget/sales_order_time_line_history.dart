import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order/sales_order_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_attachment_query/sales_order_attachment_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_detail/sales_order_detail_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_history_query/sales_order_history_query_bloc.dart';

import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SalesOrderHistoryTimeLine extends StatefulWidget {
  const SalesOrderHistoryTimeLine({
    required this.detailBloc,
    required this.bloc,
    required this.blocAttachment,
    super.key,
  });

  static Widget prepare({
    required SalesOrderDetailBloc detailBloc,
    required SalesOrderBloc bloc,
    required SalesOrderAttachmentQueryBloc blocAttachment,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => detailBloc,
        ),
      ],
      child: SalesOrderHistoryTimeLine(
        detailBloc: detailBloc,
        bloc: bloc,
        blocAttachment: blocAttachment,
      ),
    );
  }

  final SalesOrderDetailBloc detailBloc;
  final SalesOrderBloc bloc;
  final SalesOrderAttachmentQueryBloc blocAttachment;

  @override
  State<SalesOrderHistoryTimeLine> createState() =>
      _SalesOrderHistoryTimeLineState();
}

class _SalesOrderHistoryTimeLineState extends State<SalesOrderHistoryTimeLine> {
  var _selected = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'histories',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const Gap(12),
        BlocBuilder<SalesOrderHistoryQueryBloc, SalesOrderHistoryQueryState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (salesOrderHistories) {
                return TimeLine(
                  children: List.generate(
                    salesOrderHistories.length,
                    (index) {
                      final salesOrderHistory = salesOrderHistories[index];
                      final selected = index == _selected;
                      return ListTile(
                        subtitle: Text(salesOrderHistory.createdAt!.yMMMdHm),
                        title: Text(
                          'Revision #${salesOrderHistory.revisionNo}',
                          style: selected
                              ? TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                )
                              : null,
                        ),
                        onTap: () {
                          widget.bloc.add(
                            SalesOrderEvent.viewHistoryHeader(
                              salesOrderId: salesOrderHistory.salesOrder,
                              revisionNo: salesOrderHistory,
                            ),
                          );
                          widget.detailBloc.add(
                            SalesOrderDetailEvent.fetchHistory(
                              salesOrder: salesOrderHistory.salesOrder!,
                              revisionNo: salesOrderHistory,
                            ),
                          );
                          widget.blocAttachment.add(
                            SalesOrderAttachmentQueryEvent.fetchAttachment(
                              salesOrder: salesOrderHistory.salesOrder!,
                              revisionNo: salesOrderHistory.revisionNo,
                            ),
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
    );
  }
}
