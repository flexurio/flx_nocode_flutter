import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_stock_mutation_report_query_bloc/material_stock_mutation_report_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_stock/util/util/pdf_material_stock_mutation_report.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_group.dart';

class MaterialStockMutationReportExportPdfForm extends StatefulWidget {
  const MaterialStockMutationReportExportPdfForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => MaterialStockMutationReportQueryBloc()),
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(
              MaterialGroupQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const MaterialStockMutationReportExportPdfForm._(),
    );
  }

  @override
  State<MaterialStockMutationReportExportPdfForm> createState() =>
      _MaterialStockMutationReportExportPdfFormState();
}

class _MaterialStockMutationReportExportPdfFormState
    extends State<MaterialStockMutationReportExportPdfForm> {
  final _formKey = GlobalKey<FormState>();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  late MaterialGroup _materialGroup;
  late DateTime _startDate;
  late DateTime _endDate;

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<MaterialStockMutationReportQueryBloc>().add(
            MaterialStockMutationReportQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(sortBy: 'rwms.material_id'),
              materialGroupId: _materialGroup.id,
              startDate: _startDate,
              endDate: _endDate,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;

    return BlocListener<MaterialStockMutationReportQueryBloc,
        MaterialStockMutationReportQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfMaterialStockMutationReport(
                    data: pageOptions.data,
                    startDate: _startDate,
                    endDate: _endDate),
              );

            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Material-Stock-Mutation-Report.pdf',
            ).then((_) => Navigator.pop(context));
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${'material_stock_mutation_report'.tr()}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<MaterialStockMutationReportQueryBloc,
              MaterialStockMutationReportQueryState>(
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            FieldDatePicker(
              validator: requiredObjectValidator.call,
              labelText: 'start_date'.tr(),
              controller: _startDateController,
              onChanged: (value) {
                _startDate = value;
              },
            ),
            Gap(12),
            FieldDatePicker(
              validator: requiredObjectValidator.call,
              labelText: 'end_date'.tr(),
              controller: _endDateController,
              onChanged: (value) {
                _endDate = value;
              },
            ),
            Gap(12),
            FDropDownSearchMaterialGroup(
              onChanged: (materialGroup) {
                if (materialGroup != null) {
                  _materialGroup = materialGroup;
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
