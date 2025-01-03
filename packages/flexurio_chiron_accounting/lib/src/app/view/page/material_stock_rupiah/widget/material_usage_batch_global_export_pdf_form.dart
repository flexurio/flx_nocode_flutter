import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/material_usage_batch_global_query/material_usage_batch_global_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_stock_rupiah/util/pdf_material_usage_batch_global.dart';
// import 'package:flexurio_chiron_accounting/src/app/bloc/material_usage_batch_query/material_usage_batch_query_bloc.dart';
// import 'package:flexurio_chiron_accounting/src/app/view/page/material_stock_rupiah/util/pdf_material_usage_batch.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
// import 'package:appointment/src/app/view/widget/drop_down_items/production_order.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';

class MaterialUsageBatchGlobalExportPdfForm extends StatefulWidget {
  const MaterialUsageBatchGlobalExportPdfForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialUsageBatchGlobalQueryBloc(),
        ),
        BlocProvider(
          create: (context) => ProductionOrderQueryBloc(isExternal: false)..add(
            ProductionOrderQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            ),
          ),
        ),
      ],
      child: const MaterialUsageBatchGlobalExportPdfForm._(),
    );
  }

  @override
  State<MaterialUsageBatchGlobalExportPdfForm> createState() =>
      _MaterialUsageBatchGlobalExportPdfFormState();
}

class _MaterialUsageBatchGlobalExportPdfFormState
  extends State<MaterialUsageBatchGlobalExportPdfForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _startDate;
  DateTime? _endDate;
  // ProductionOrder? _batch;

  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<MaterialUsageBatchGlobalQueryBloc>().add(
        MaterialUsageBatchGlobalQueryEvent.fetch(
          pageOptions: PageOptions.emptyNoLimit(sortBy: 'batch_no'),
          startDate: _startDate,
          endDate: _endDate,
          // batch: _batch,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;

    return MultiBlocListener(
      listeners: [
        BlocListener<MaterialUsageBatchGlobalQueryBloc, MaterialUsageBatchGlobalQueryState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loaded: (pageOptions) async {
                final pdf = pw.Document()..addPage(
                  await pdfMaterialUsageBatchGlobal(
                    data: pageOptions.data,
                    startDate: _startDate,
                    endDate: _endDate,
                    // batch: _batch,
                  ),
                );
                await Printing.sharePdf(
                  bytes: await pdf.save(),
                  filename: 'Material Usage Batch Global.pdf',
                );
                Navigator.pop(context);
              },
            );
          },
        ),
      ],
      child: CardForm(
        popup: true,
        title: '${action.title} ${'Material Usage Batch Global'.tr()}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          BlocBuilder<MaterialUsageBatchGlobalQueryBloc, MaterialUsageBatchGlobalQueryState>(
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
              // const Gap(24),
              // RowFields(
              //   children: [
              //     FDropDownSearchProductionOrder(
              //       label: 'Batch',
              //       onChanged: (batch) {
              //         if (batch != null) {
              //           _batch = batch;
              //         }
              //       },
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
