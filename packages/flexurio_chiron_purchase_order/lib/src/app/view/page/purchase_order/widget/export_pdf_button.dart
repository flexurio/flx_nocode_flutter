import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order_detail_query/purchase_order_detail_query_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order/util/pdf_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ExportPdfButton extends StatefulWidget {
  const ExportPdfButton._({
    required this.purchaseOrder,
  });

  static Widget prepare(
    PurchaseOrder purchaseOrder,
  ) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PurchaseOrderDetailQueryBloc()),
      ],
      child: ExportPdfButton._(purchaseOrder: purchaseOrder),
    );
  }

  final PurchaseOrder purchaseOrder;

  @override
  State<ExportPdfButton> createState() => _ExportPdfButtonState();
}

class _ExportPdfButtonState extends State<ExportPdfButton> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PurchaseOrderDetailQueryBloc>();
    return BlocListener<PurchaseOrderDetailQueryBloc,
        PurchaseOrderDetailQueryState>(
      bloc: bloc,
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => Toast(context).fail(error),
          loaded: (purchaseOrderDetails) async {
            final pdf = pw.Document();

            pdf.addPage(
              await pdfPurchaseOrder(
                widget.purchaseOrder,
                purchaseOrderDetails,
              ),
            );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Purchase_Order_//${widget.purchaseOrder.id}.pdf'
                  .replaceAll('/', '-'),
            );
          },
        );
      },
      child: BlocBuilder<PurchaseOrderDetailQueryBloc,
          PurchaseOrderDetailQueryState>(
        bloc: bloc,
        builder: (context, state) {
          return IconButtonSmall(
            permission: Permission.purchaseRequestExportPdf,
            tooltipMessage: DataAction.exportPdf.title,
            action: DataAction.exportPdf,
            onPressed: () async {
              bloc.add(
                PurchaseOrderDetailQueryEvent.fetch(
                  purchaseOrder: widget.purchaseOrder,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
