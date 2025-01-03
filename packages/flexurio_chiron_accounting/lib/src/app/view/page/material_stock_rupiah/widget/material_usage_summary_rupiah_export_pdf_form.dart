import 'package:appointment/src/app/view/widget/drop_down_items/material_group.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/material_usage_summary_rupiah_query/material_usage_summary_rupiah_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_stock_rupiah/util/pdf_material_usage_summary_rupiah.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MaterialUsageSummaryRupiahExportPdfForm extends StatefulWidget {
  const MaterialUsageSummaryRupiahExportPdfForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialUsageSummaryRupiahQueryBloc(),
        ),
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(MaterialGroupQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
      ],
      child: const MaterialUsageSummaryRupiahExportPdfForm._(),
    );
  }

  @override
  State<MaterialUsageSummaryRupiahExportPdfForm> createState() =>
      _MaterialUsageSummaryRupiahExportPdfFormState();
}

class _MaterialUsageSummaryRupiahExportPdfFormState
    extends State<MaterialUsageSummaryRupiahExportPdfForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _startDate;
  DateTime? _endDate;
  MaterialGroup? _materialGroup;
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    _materialGroup = _materialGroup;
    _startDate = _startDate;
    _endDate = _endDate;
    super.initState();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<MaterialUsageSummaryRupiahQueryBloc>().add(
            MaterialUsageSummaryRupiahQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(
                sortBy: 'material_issue_type_id',
              ),
              startDate: _startDate,
              endDate: _endDate,
              materialGroup: _materialGroup,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;

    return BlocListener<MaterialUsageSummaryRupiahQueryBloc,
        MaterialUsageSummaryRupiahQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfMaterialUsageSummaryRupiah(
                  data: pageOptions.data,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Material_Usage_Summary_Rupiah.pdf',
            );
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${'material_usage_summary_rupiah'.tr()}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<MaterialUsageSummaryRupiahQueryBloc,
              MaterialUsageSummaryRupiahQueryState>(
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
              RowFields(
                children: [
                  FieldDatePicker(
                    labelText: 'Period Start',
                    controller: _startDateController,
                    onChanged: (value) => _startDate = value,
                  ),
                  FieldDatePicker(
                    labelText: 'Period End',
                    controller: _endDateController,
                    onChanged: (value) => _endDate = value,
                  ),
                ],
              ),
              const Gap(24),
              FDropDownSearchMaterialGroup(
                onChanged: (materialGroup) {
                  if (materialGroup != null) {
                    _materialGroup = materialGroup;
                    setState(() {});
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
