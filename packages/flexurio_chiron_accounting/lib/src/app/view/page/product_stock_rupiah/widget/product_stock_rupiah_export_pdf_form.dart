import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/product_stock_rupiah_query/product_stock_rupiah_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/product_stock_rupiah/util/pdf_product_stock_rupiah.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ProductStockRupiahExportPdfForm extends StatefulWidget {
  const ProductStockRupiahExportPdfForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductStockRupiahQueryBloc(),
        ),
        // BlocProvider(
        //   create: (context) => MaterialGroupQueryBloc()
        //     ..add(const MaterialGroupQueryEvent.fetch()),
        // ),
      ],
      child: const ProductStockRupiahExportPdfForm._(),
    );
  }

  @override
  State<ProductStockRupiahExportPdfForm> createState() => _ProductStockRupiahExportPdfFormState();
}

class _ProductStockRupiahExportPdfFormState extends State<ProductStockRupiahExportPdfForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _startDate;
  // DateTime? _endDate;
  // MaterialGroup? _materialGroup;
  final _startDateController = TextEditingController();
  // final _endDateController = TextEditingController();

  @override
  void initState() {
    // _materialGroup = _materialGroup;
    _startDate = _startDate;
    // _endDate = _endDate;
    super.initState();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ProductStockRupiahQueryBloc>().add(
        ProductStockRupiahQueryEvent.fetch(
          pageOptions: PageOptions.emptyNoLimit(sortBy: 'product_id'),
          date: _startDate,
          // endDate: _endDate,
          // materialGroup: _materialGroup,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;

    return BlocListener<ProductStockRupiahQueryBloc, ProductStockRupiahQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()..addPage(
              await pdfProductStockRupiah(
                data: pageOptions.data,
              ),
            );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'LAPORAN STOK PRODUCT ( Rp. ).pdf',
            );
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${'product_stock_in_rupiah'.tr()}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<ProductStockRupiahQueryBloc, ProductStockRupiahQueryState>(
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
                    labelText: 'date'.tr(),
                    controller: _startDateController,
                    onChanged: (value) => _startDate = value,
                  ),
                  // FieldDatePicker(
                  //   labelText: 'end_date'.tr(),
                  //   validator: requiredObjectValidator.call,
                  //   controller: _endDateController,
                  //   onChanged: (value) => _endDate = value,
                  // ),
                ],
              ),
              const Gap(24),
              // FDropDownSearchMaterialGroup(
              //   onChanged: (materialGroup) {
              //     if (materialGroup != null) {
              //       _materialGroup = materialGroup;
              //       setState(() {});
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
