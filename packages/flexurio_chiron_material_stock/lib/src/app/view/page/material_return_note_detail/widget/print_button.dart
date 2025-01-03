import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order/sales_order_bloc.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return_note_detail/widget/report_pdf_detail_return_note.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MaterialReturnNoteDetailPrintButton extends StatelessWidget {
  const MaterialReturnNoteDetailPrintButton._({
    required this.materialReturnNote,
  });

  final MaterialReturnNote materialReturnNote;

  static Widget prepare(
    MaterialReturnNote materialReturnNote,
  ) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialReturnNoteDetailQueryBloc()
            ..add(MaterialReturnNoteDetailQueryEvent.fetch(materialReturnNote)),
        ),
        BlocProvider(
          create: (context) => SalesOrderBloc(),
        ),
      ],
      child: MaterialReturnNoteDetailPrintButton._(
        materialReturnNote: materialReturnNote,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SalesOrderBloc, SalesOrderState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(DataAction.printPDF, Entity.materialReturnNote);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: BlocBuilder<MaterialReturnNoteDetailQueryBloc, MaterialReturnNoteDetailQueryState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: Container.new,
            loaded: (materialReturnNoteDetail) {
              return LightButtonSmall(
                action: DataAction.printPDF,
                permission: PermissionMaterialStock.materialReturnNoteExportPdf,
                onPressed: () async {
                  final pdf = pw.Document()
                    ..addPage(
                      await printMaterialReturnNote(
                        materialReturnNote: materialReturnNote,
                        materialReturnNoteDetail: materialReturnNoteDetail,
                      ),
                    );
                  await Printing.sharePdf(
                    bytes: await pdf.save(),
                    filename: 'Material-Return-Note.pdf',
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
