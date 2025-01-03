import 'package:appointment/src/app/view/widget/drop_down_items/material_group.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_stock_rupiah/util/pdf_material_mutation_rupiah.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_stock_rupiah/util/pdf_material_return_rupiah.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MaterialReturnRupiahExportPdfForm extends StatefulWidget {
  const MaterialReturnRupiahExportPdfForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialReturnRupiahQueryBloc(),
        ),
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(MaterialGroupQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
      ],
      child: const MaterialReturnRupiahExportPdfForm._(),
    );
  }

  @override
  State<MaterialReturnRupiahExportPdfForm> createState() =>
      _MaterialReturnRupiahExportPdfFormState();
}

class _MaterialReturnRupiahExportPdfFormState
    extends State<MaterialReturnRupiahExportPdfForm> {
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
      context.read<MaterialReturnRupiahQueryBloc>().add(
            MaterialReturnRupiahQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(sortBy: 'mrd.material_id'),
              dateGte: _startDate,
              dateLte: _endDate,
              materialGroupId: _materialGroup,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;

    return BlocListener<MaterialReturnRupiahQueryBloc,
        MaterialReturnRupiahQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfMaterialReturnRupiah(
                  data: pageOptions.data,
                  startDate: _startDate!,
                  endDate: _endDate!,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Material_Return_Rupiah.pdf',
            );
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${'material_return_rupiah'.tr()}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<MaterialReturnRupiahQueryBloc,
              MaterialReturnRupiahQueryState>(
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
