import 'package:appointment/src/app/view/widget/drop_down_items/material_group.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/material_loans_borrowings_query/material_loans_borrowings_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_stock_rupiah/util/pdf_material_loans_borrowings.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MaterialLoansBorrowingsExportPdfForm extends StatefulWidget {
  const MaterialLoansBorrowingsExportPdfForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialLoansBorrowingsQueryBloc(),
        ),
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(MaterialGroupQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
      ],
      child: const MaterialLoansBorrowingsExportPdfForm._(),
    );
  }

  @override
  State<MaterialLoansBorrowingsExportPdfForm> createState() =>
      _MaterialLoansBorrowingsExportPdfFormState();
}

class _MaterialLoansBorrowingsExportPdfFormState
    extends State<MaterialLoansBorrowingsExportPdfForm> {
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
      context.read<MaterialLoansBorrowingsQueryBloc>().add(
            MaterialLoansBorrowingsQueryEvent.fetch(
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

    return BlocListener<MaterialLoansBorrowingsQueryBloc,
        MaterialLoansBorrowingsQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfMaterialLoansBorrowings(
                  data: pageOptions.data,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Material_Loans_Borrowings.pdf',
            );
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${'material_loans_borrowings'.tr()}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<MaterialLoansBorrowingsQueryBloc,
              MaterialLoansBorrowingsQueryState>(
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
