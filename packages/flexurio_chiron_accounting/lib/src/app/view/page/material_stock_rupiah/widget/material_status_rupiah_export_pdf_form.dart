import 'package:appointment/src/app/view/widget/drop_down_items/material_group.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/material_status_rupiah_quarantine_query/material_status_rupiah_quarantine_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/material_status_rupiah_query/material_status_rupiah_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_stock_rupiah/util/pdf_material_status_rupiah.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_stock_rupiah/util/pdf_material_status_rupiah_quarantine.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MaterialStatusRupiahExportPdfForm extends StatefulWidget {
  const MaterialStatusRupiahExportPdfForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialStatusRupiahQueryBloc(),
        ),
        BlocProvider(
          create: (context) => MaterialStatusRupiahQuarantineQueryBloc(),
        ),
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(
              MaterialGroupQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const MaterialStatusRupiahExportPdfForm._(),
    );
  }

  @override
  State<MaterialStatusRupiahExportPdfForm> createState() =>
      _MaterialStatusRupiahExportPdfFormState();
}

class _MaterialStatusRupiahExportPdfFormState
    extends State<MaterialStatusRupiahExportPdfForm> {
  final _formKey = GlobalKey<FormState>();

  String? _status;
  DateTime? _startDate;
  DateTime? _endDate;
  MaterialGroup? _materialGroup;
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _statusController = TextEditingController();

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (_status != null && _status == 'Release' ||
          _status != null && _status == 'Reject')
        context.read<MaterialStatusRupiahQueryBloc>().add(
              MaterialStatusRupiahQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(sortBy: 'transaction_id'),
                startDate: _startDate,
                endDate: _endDate,
                materialGroup: _materialGroup,
              ),
            );
      if (_status != null && _status == 'Quarantine')
        context.read<MaterialStatusRupiahQuarantineQueryBloc>().add(
              MaterialStatusRupiahQuarantineQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(sortBy: 'transaction_id'),
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

    return MultiBlocListener(
      listeners: [
        BlocListener<MaterialStatusRupiahQueryBloc,
            MaterialStatusRupiahQueryState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loaded: (pageOptions) async {
                final pdf = pw.Document()
                  ..addPage(
                    await pdfMaterialStatusRupiah(
                      data: pageOptions.data,
                      startDate: _startDate,
                      endDate: _endDate,
                    ),
                  );
                await Printing.sharePdf(
                  bytes: await pdf.save(),
                  filename: 'Material Status Rupiah.pdf',
                );
                Navigator.pop(context);
              },
            );
          },
        ),
        BlocListener<MaterialStatusRupiahQuarantineQueryBloc,
            MaterialStatusRupiahQuarantineQueryState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loaded: (pageOptions) async {
                final pdf = pw.Document()
                  ..addPage(
                    await pdfMaterialStatusRupiahQuarantine(
                      data: pageOptions.data,
                      startDate: _startDate,
                      endDate: _endDate,
                    ),
                  );
                await Printing.sharePdf(
                  bytes: await pdf.save(),
                  filename: 'Material Status Rupiah Quarantine.pdf',
                );
                Navigator.pop(context);
              },
            );
          },
        ),
      ],
      child: CardForm(
        popup: true,
        title: '${action.title} ${'Material Status Rupiah'.tr()}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          if (_status != null && _status == 'Release' ||
              _status != null && _status == 'Reject')
            BlocBuilder<MaterialStatusRupiahQueryBloc,
                MaterialStatusRupiahQueryState>(
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
          if (_status != null && _status == 'Quarantine')
            BlocBuilder<MaterialStatusRupiahQuarantineQueryBloc,
                MaterialStatusRupiahQuarantineQueryState>(
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
            )
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
                    controller: _startDateController,
                    onChanged: (value) => _startDate = value,
                  ),
                  FieldDatePicker(
                    labelText: 'end_date'.tr(),
                    validator: requiredObjectValidator.call,
                    controller: _endDateController,
                    onChanged: (value) => _endDate = value,
                  ),
                ],
              ),
              const Gap(24),
              RowFields(
                children: [
                  FDropDownSearchMaterialGroup(
                    onChanged: (materialGroup) {
                      if (materialGroup != null) {
                        _materialGroup = materialGroup;
                      }
                    },
                  ),
                  FDropDownSearch<String>(
                    validator: requiredObjectValidator.call,
                    labelText: 'Status',
                    items: ['Quarantine', 'Release', 'Reject'],
                    onChanged: (status) {
                      if (status != null) {
                        setState(() {
                          _status = status;
                          _statusController.text = status;
                        });
                      }
                    },
                    itemAsString: (status) => status,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
