import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/product_stock_mutation_recap_query/product_stock_mutation_recap_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/medical_treatment_expense_department/util/pdf_product_stock_mutation_recap.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ProductStockMutationRecapExportPdfForm extends StatefulWidget {
  const ProductStockMutationRecapExportPdfForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductStockMutationRecapQueryBloc(),
        ),
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(MaterialGroupQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
        BlocProvider(
          create: (context) => MaterialQueryBloc()
            ..add(
              MaterialQueryEvent.fetch(pageOptions: PageOptions.emptyNoLimit()),
            ),
        ),
      ],
      child: const ProductStockMutationRecapExportPdfForm._(),
    );
  }

  @override
  State<ProductStockMutationRecapExportPdfForm> createState() =>
      _MaterialMutationRupiahExportPdfFormState();
}

class _MaterialMutationRupiahExportPdfFormState
    extends State<ProductStockMutationRecapExportPdfForm> {
  final _formKey = GlobalKey<FormState>();

  late DateTime _startDate;
  late DateTime _endDate;
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ProductStockMutationRecapQueryBloc>().add(
            ProductStockMutationRecapQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(sortBy: 'product_id'),
              startDate: _startDate,
              endDate: _endDate,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;

    return BlocListener<ProductStockMutationRecapQueryBloc,
        ProductStockMutationRecapQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfProductStockMutationRecap(
                  data: pageOptions.data,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Product-Stock-Mutation-Recap.pdf',
            );
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${'Material_Mutation_Loans_Borrowings'.tr()}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<ProductStockMutationRecapQueryBloc,
              ProductStockMutationRecapQueryState>(
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
            ],
          ),
        ),
      ),
    );
  }
}
