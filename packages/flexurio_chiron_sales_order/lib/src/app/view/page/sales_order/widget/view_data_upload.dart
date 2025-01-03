import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_attachment_query/sales_order_attachment_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_query/sales_order_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'attachment_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesOrderViewDocumentButton extends StatelessWidget {
  const SalesOrderViewDocumentButton({
    required this.salesOrder,
    required this.bloc,
    super.key,
  });

  final SalesOrder salesOrder;
  final SalesOrderQueryBloc bloc;

  static Widget prepare({
    required SalesOrder salesOrder,
    required SalesOrderQueryBloc bloc,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SalesOrderAttachmentQueryBloc(),
        ),
      ],
      child: SalesOrderViewDocumentButton(
        salesOrder: salesOrder,
        bloc: bloc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SalesOrderViewData.prepare(
      salesOrder: salesOrder,
      bloc: context.read<SalesOrderAttachmentQueryBloc>(),
      viewFromDetail: false,
    );
  }
}
