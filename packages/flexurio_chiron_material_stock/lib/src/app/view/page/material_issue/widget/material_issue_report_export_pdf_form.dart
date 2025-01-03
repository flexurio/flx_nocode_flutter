import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MaterialIssueReportExportPdfForm extends StatefulWidget {
  const MaterialIssueReportExportPdfForm._(this.isExternal);

  final bool isExternal;

  static Widget prepare({
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              MaterialIssueReportQueryBloc(isExternal: isExternal),
        ),
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: isExternal)
            ..add(
              ProductQueryEvent.fetch(pageOptions: PageOptions.emptyNoLimit()),
            ),
        ),
      ],
      child: MaterialIssueReportExportPdfForm._(isExternal),
    );
  }

  @override
  State<MaterialIssueReportExportPdfForm> createState() =>
      _MaterialIssueReportExportPdfFormState();
}

class _MaterialIssueReportExportPdfFormState
    extends State<MaterialIssueReportExportPdfForm> {
  final _formKey = GlobalKey<FormState>();
  late MaterialIssueReportType _type;
  DateTime? _startDate;
  DateTime? _endDate;

  final _typeController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<MaterialIssueReportQueryBloc>().add(
            MaterialIssueReportQueryEvent.fetch(
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

    return BlocListener<MaterialIssueReportQueryBloc,
        MaterialIssueReportQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfMaterialIssueReport(
                  data: pageOptions.data,
                  type: _type,
                ),
              );

            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Material-Issue-Report-${_type.label.tr()}.pdf',
            ).then((_) => Navigator.pop(context));
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${'material_issue_report'.tr()}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<MaterialIssueReportQueryBloc,
              MaterialIssueReportQueryState>(
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
              SelectChipField<MaterialIssueReportType>(
                label: 'type'.tr(),
                getLabel: (type) => type.label.tr(),
                controller: _typeController,
                validator: requiredValidator.call,
                options: MaterialIssueReportType.list,
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
