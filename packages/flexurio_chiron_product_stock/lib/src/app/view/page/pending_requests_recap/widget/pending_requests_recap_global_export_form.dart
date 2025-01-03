import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/pending_requests_recap_global_query/pending_requests_recap_global_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/pending_requests_recap/util/pending_requests_recap_global.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

class PendingRequestsRecapGlobalExportForm extends StatefulWidget {
  const PendingRequestsRecapGlobalExportForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PendingRequestsRecapGlobalQueryBloc(),
        ),
      ],
      child: const PendingRequestsRecapGlobalExportForm._(),
    );
  }

  @override
  State<PendingRequestsRecapGlobalExportForm> createState() => 
  _PendingRequestsRecapGlobalExportFormState();
}

class _PendingRequestsRecapGlobalExportFormState extends 
State<PendingRequestsRecapGlobalExportForm> {

  final _formKey = GlobalKey<FormState>();

  DateTime? _startDate;
  DateTime? _endDate;
  
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _startDate = _startDate;
    _endDate = _endDate;
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<PendingRequestsRecapGlobalQueryBloc>().add(
        PendingRequestsRecapGlobalQueryEvent.fetch(
          pageOptions: PageOptions.emptyNoLimit(
            sortBy: 'product_id',
          ),
          startDate: _startDate,
          endDate: _endDate,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;
    final entity = Entity.pendingRequestsRecapGlobal;

    return BlocListener<PendingRequestsRecapGlobalQueryBloc, 
    PendingRequestsRecapGlobalQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()..addPage(
              await pdfPendingRequestsRecapGlobal(
                data: pageOptions.data,
                startDate: _startDate,
                endDate: _endDate,
              ),
            );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: '${'pending_requests_recap_global'.tr()}.pdf',
            );
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${entity.title}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<PendingRequestsRecapGlobalQueryBloc, 
          PendingRequestsRecapGlobalQueryState>(
            builder: (context, state) {
              return Button(
                permission: null,
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
            ],
          ),
        ),
      ),
    );
  }
}
