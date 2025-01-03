import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_usage/util/pdf_material_usage_global.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MaterialUsageGlobalExportPdfButton extends StatefulWidget {
  const MaterialUsageGlobalExportPdfButton({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialGlobalUsageQueryBloc(),
        ),
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(
              MaterialGroupQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => TransactionTypeQueryBloc()
            ..add(
              TransactionTypeQueryEvent.fetch(
                type: 'MATERIAL ISSUE',
                flag: '',
                name: '',
                pageOptions: PageOptions.emptyNoLimit(sortBy: 'id'),
              ),
            ),
        ),
      ],
      child: const MaterialUsageGlobalExportPdfButton(),
    );
  }

  @override
  State<MaterialUsageGlobalExportPdfButton> createState() =>
      _MaterialUsageGlobalExportPdfButtonState();
}

class _MaterialUsageGlobalExportPdfButtonState
    extends State<MaterialUsageGlobalExportPdfButton> {
  TransactionType? _transactionType;
  MaterialGroup? _materialGroup;
  DateTime? _startDate;
  DateTime? _endDate;
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _requiredObjectValidator = RequiredObjectValidator<dynamic>(
    errorText: pleaseFillOutThisField.tr(),
  );

  @override
  void initState() {
    _transactionType = _transactionType;
    _startDate = _startDate;
    _endDate = _endDate;
    _materialGroup = _materialGroup;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<MaterialGlobalUsageQueryBloc>();
    final materialGroupBloc = context.read<MaterialGroupQueryBloc>();
    final transactionTypeBloc = context.read<TransactionTypeQueryBloc>();

    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'Recap Usage Material Global',
      permission: PermissionAccounting.recapUsageMaterialGlobalExportPdf,
      onPressed: () async {
        await _showFilter(
          context,
          queryBloc,
          materialGroupBloc,
          transactionTypeBloc,
        );
      },
    );
  }

  Future<void> _showFilter(
    BuildContext context,
    MaterialGlobalUsageQueryBloc queryBloc,
    MaterialGroupQueryBloc materialGroupBloc,
    TransactionTypeQueryBloc transactionTypeBloc,
  ) async {
    await showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CardForm(
          popup: true,
          title: 'filter'.tr(),
          icon: Icons.sort,
          actions: [
            Button(
              action: DataAction.cancel,
              permission: null,
              isSecondary: true,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(width: 12),
            BlocListener<MaterialGlobalUsageQueryBloc,
                MaterialUsageGlobalQueryState>(
              bloc: queryBloc,
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (error) => Toast(context).fail(error),
                  loaded: (materialUsageGlobal) async {
                    final pdf = pw.Document()
                      ..addPage(
                        await pdfMaterialUsageGlobal(
                          data: materialUsageGlobal.data,
                        ),
                      );
                    await Printing.sharePdf(
                      bytes: await pdf.save(),
                      filename: 'Recap_Usage_Material_Global.pdf',
                    );
                  },
                );
              },
              child: BlocBuilder<MaterialGlobalUsageQueryBloc,
                  MaterialUsageGlobalQueryState>(
                bloc: queryBloc,
                builder: (context, state) {
                  return Button.small(
                    action: DataAction.exportPdf,
                    permission: null,
                    onPressed: () {
                      if (_transactionType != null &&
                          _materialGroup != null &&
                          _startDate != null &&
                          _endDate != null) {
                        queryBloc.add(
                          MaterialUsageGlobalQueryEvent.fetch(
                            transactionType: _transactionType,
                            materialGroup: _materialGroup,
                            startDate: _startDate,
                            endDate: _endDate,
                            pageOptions: PageOptions.emptyNoLimit(
                              sortBy: 'material_issue_id',
                              ascending: false,
                            ),
                          ),
                        );
                      } else {
                        Toast(context).fail(
                          'You must insert the Group, Type & Date',
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>(
                bloc: materialGroupBloc,
                builder: (context, state) {
                  return FDropDownSearch<MaterialGroup>(
                    validator: _requiredObjectValidator.call,
                    labelText: 'group'.tr(),
                    itemAsString: (materialGroup) => materialGroup.id,
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (materialUnit) => materialUnit.data,
                    ),
                    status: state.maybeWhen(
                      error: (_) => Status.error,
                      loading: (_) => Status.progress,
                      orElse: () => Status.loaded,
                    ),
                    onChanged: (value) {
                      if (value != null) {
                        _materialGroup = value;
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 12),
              BlocBuilder<TransactionTypeQueryBloc, TransactionTypeQueryState>(
                bloc: transactionTypeBloc,
                builder: (context, state) {
                  return FDropDownSearch<TransactionType>(
                    validator: _requiredObjectValidator.call,
                    labelText: 'transaction_type'.tr(),
                    itemAsString: (transactionType) => transactionType.id,
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (pageOptions) => pageOptions.data,
                    ),
                    status: state.maybeWhen(
                      orElse: () => Status.error,
                      loading: (_) => Status.progress,
                      loaded: (_) => Status.loaded,
                    ),
                    onChanged: (transactionType) async {
                      if (transactionType != null) {
                        _transactionType = transactionType;
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 12),
              FieldDatePicker(
                validator: _requiredObjectValidator.call,
                labelText: 'Period Start',
                controller: _startDateController,
                onChanged: (value) => _startDate = value,
              ),
              const SizedBox(height: 12),
              FieldDatePicker(
                validator: _requiredObjectValidator.call,
                labelText: 'Period End',
                controller: _endDateController,
                onChanged: (value) => _endDate = value,
              ),
            ],
          ),
        );
      },
    );
  }
}
