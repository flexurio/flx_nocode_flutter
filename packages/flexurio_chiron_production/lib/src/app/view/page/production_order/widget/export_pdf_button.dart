import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ProductionOrderExportPdfButton extends StatelessWidget {
  const ProductionOrderExportPdfButton({required this.isExternal, super.key});
    final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductionOrderQueryBloc, ProductionOrderQueryState>(
      bloc: ProductionOrderQueryBloc(isExternal: isExternal)
        ..add(
          ProductionOrderQueryEvent.fetch(
            isCancel: true,
            pageOptions: PageOptions.emptyNoLimit(),
          ),
        ),
      builder: (context, state) {
        final status = state.maybeWhen(
          loading: (_) => Status.progress,
          loaded: (_) => Status.loaded,
          orElse: () => Status.error,
        );
        final data = state.maybeWhen(
          orElse: () => <ProductionOrder>[],
          loaded: (pageOptions) => pageOptions.data,
        );
        Future<void> printPdf() async {
          final pdf = pw.Document()..addPage(await reportProductionOrder(data));
          await Printing.sharePdf(
            bytes: await pdf.save(),
            filename: 'Production_Order_Report_Batch.pdf',
          );
        }

        return LightButtonSmall(
          action: DataAction.exportBatch,
          permission: null,
          onPressed: printPdf,
          status: status,
        );
      },
    );
  }
}
