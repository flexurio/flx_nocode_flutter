import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive_report_query/material_receive_report_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_report.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_stock/util/util/pdf_material_receive_report.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MaterialReceiveReportExportPdfForm extends StatefulWidget {
  const MaterialReceiveReportExportPdfForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialReceiveReportQueryBloc(),
        ),
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(
              ProductQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const MaterialReceiveReportExportPdfForm._(),
    );
  }

  @override
  State<MaterialReceiveReportExportPdfForm> createState() =>
      _MaterialReceiveReportExportPdfFormState();
}

class _MaterialReceiveReportExportPdfFormState
    extends State<MaterialReceiveReportExportPdfForm> {
  final _formKey = GlobalKey<FormState>();
  late MaterialReceiveReportType _type;
  DateTime? _startDate;
  DateTime? _endDate;

  final _typeController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<MaterialReceiveReportQueryBloc>().add(
            MaterialReceiveReportQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(sortBy: 'id'),
              startDate: _startDate,
              endDate: _endDate,
              type: _type,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;

    return BlocListener<MaterialReceiveReportQueryBloc,
        MaterialReceiveReportQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfMaterialReceiveReport(
                  data: pageOptions.data,
                  type: _type,
                ),
              );

            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Material-Receive-Report-${_type.label.tr()}.pdf',
            ).then((_) => Navigator.pop(context));
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${'material_receive_report'.tr()}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<MaterialReceiveReportQueryBloc,
              MaterialReceiveReportQueryState>(
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
                    validator: requiredObjectValidator.call,
                    labelText: 'start_date'.tr(),
                    onChanged: (value) {
                      _startDate = value;
                    },
                    initialSelectedDate: _startDate,
                    controller: _startDateController,
                  ),
                  FieldDatePicker(
                    validator: requiredObjectValidator.call,
                    labelText: 'end_date'.tr(),
                    onChanged: (value) {
                      _endDate = value;
                    },
                    initialSelectedDate: _endDate,
                    controller: _endDateController,
                  ),
                ],
              ),
              const Gap(24),
              SelectChipField<MaterialReceiveReportType>(
                label: 'type'.tr(),
                getLabel: (type) => type.label.tr(),
                controller: _typeController,
                validator: requiredValidator.call,
                options: MaterialReceiveReportType.list,
                onChanged: (value) {
                  _type = value;
                  _typeController.text = value.label;
                  // setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
