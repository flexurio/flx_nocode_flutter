import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_stock_report_query_bloc/material_stock_report_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_stock/util/util/pdf_material_stock_report.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_group.dart';

class MaterialStockReportExportPdfForm extends StatefulWidget {
  const MaterialStockReportExportPdfForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MaterialStockReportQueryBloc()),
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(
              MaterialGroupQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const MaterialStockReportExportPdfForm._(),
    );
  }

  @override
  State<MaterialStockReportExportPdfForm> createState() =>
      _MaterialStockReportExportPdfFormState();
}

class _MaterialStockReportExportPdfFormState
    extends State<MaterialStockReportExportPdfForm> {
  final _formKey = GlobalKey<FormState>();
  late MaterialGroup _materialGroup;

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<MaterialStockReportQueryBloc>().add(
            MaterialStockReportQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(sortBy: 'material_id'),
              materialGroupId: _materialGroup.id,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;

    return BlocListener<MaterialStockReportQueryBloc,
        MaterialStockReportQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfMaterialStockReport(data: pageOptions.data),
              );

            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Material-Stock-Report.pdf',
            ).then((_) => Navigator.pop(context));
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${'material_stock_report'.tr()}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<MaterialStockReportQueryBloc,
              MaterialStockReportQueryState>(
            builder: (context, state) {
              return Button(
                permission: null,
                isInProgress: state.maybeWhen(
                  orElse: () => false,
                  loading: (_) => true,
                ),
                onPressed: () => _submit(context),
                action: action,
              );
            },
          ),
        ],
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FDropDownSearchMaterialGroup(
                onChanged: (materialGroup) {
                  if (materialGroup != null) {
                    _materialGroup = materialGroup;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
