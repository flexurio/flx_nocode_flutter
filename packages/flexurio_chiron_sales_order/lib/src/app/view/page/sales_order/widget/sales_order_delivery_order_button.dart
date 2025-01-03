import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order/sales_order_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_detail/sales_order_detail_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_query/sales_order_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'sales_order_form_delivery_order.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ExportDeliveryOrderButton extends StatelessWidget {
  const ExportDeliveryOrderButton._({required this.salesOrder});

  static Widget prepare(SalesOrder salesOrder) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SalesOrderDetailBloc()
            ..add(SalesOrderDetailEvent.fetch(salesOrder: salesOrder)),
        ),
        BlocProvider(create: (context) => SalesOrderBloc()),
      ],
      child: ExportDeliveryOrderButton._(salesOrder: salesOrder),
    );
  }

  final SalesOrder salesOrder;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SalesOrderBloc, SalesOrderState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            context
                .read<SalesOrderQueryBloc>()
                .add(const SalesOrderQueryEvent.fetch());
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: BlocBuilder<SalesOrderDetailBloc, SalesOrderDetailState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: SizedBox.new,
            initial: (_, salesOrderDetail) {
              return Visibility(
                child: IconButtonSmall(
                  permission:
                      PermissionProductStock.salesOrderExportDeliveryOrder,
                  action: DataAction.exportDeliveryOrder,
                  onPressed: () async {
                    context.read<SalesOrderBloc>().add(
                          SalesOrderEvent.updateDeliveryOrder(salesOrder),
                        );

                    await Printing.layoutPdf(
                      format: const PdfPageFormat(
                        17 * PdfPageFormat.cm,
                        22.5 * PdfPageFormat.cm,
                        marginAll: 1 * PdfPageFormat.cm,
                      ),
                      onLayout: (format) async {
                        final pdf = pw.Document()
                          ..addPage(
                            await exportDeliveryOrder(
                              salesOrder,
                              salesOrderDetail!.keys.toList(),
                            ),
                          );
                        return await pdf.save();
                      },
                      name:
                          'Delivery_Order_${salesOrder.productRequest!.id}.pdf'
                              .replaceAll('/', '-'),
                    );

                    // final pdf = pw.Document()
                    //   ..addPage(
                    //     await exportDeliveryOrder(
                    //       salesOrder,
                    //       salesOrderDetail!.keys.toList(),
                    //     ),
                    //   );

                    // await Printing.sharePdf(
                    //   bytes: await pdf.save(),
                    //   filename:
                    //       'Delivery_Order_${salesOrder.productRequest!.id}.pdf'
                    //           .replaceAll('/', '-'),
                    // );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
