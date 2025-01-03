import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ProductStockWarehouseExportPdfForm extends StatefulWidget {
  const ProductStockWarehouseExportPdfForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductStockQueryBloc(),
        ),
      ],
      child: const ProductStockWarehouseExportPdfForm._(),
    );
  }

  @override
  State<ProductStockWarehouseExportPdfForm> createState() =>
      _ProductStockWarehouseExportPdfFormState();
}

class _ProductStockWarehouseExportPdfFormState
    extends State<ProductStockWarehouseExportPdfForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _divisionController = TextEditingController();
  Division? _division;

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ProductStockQueryBloc>().add(
            ProductStockQueryEvent.fetch(
              period: DateTime.now(),
              endingBalance: 0,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;
    final entity = Entity.productReturn;

    return BlocListener<ProductStockQueryBloc, ProductStockQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (data) {
            state.maybeWhen(
              orElse: () {},
              error: (error) => Toast(context).fail(error),
              loaded: (productStock) async {
                final pdf = pw.Document()
                  ..addPage(
                    await pdfProductStockWarehouse(
                      data: productStock,
                    ),
                  );
                await Printing.sharePdf(
                  bytes: await pdf.save(),
                  filename: 'Product-Stock-Warehouse-$_division.pdf',
                );
              },
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
          BlocBuilder<ProductStockQueryBloc, ProductStockQueryState>(
            builder: (context, state) {
              return Button(
                permission: null,
                isInProgress: state.maybeWhen(
                  orElse: () => false,
                  loading: () => true,
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
              SelectChipField<Division>(
                label: 'division'.tr(),
                getLabel: (ppn) => ppn.label,
                controller: _divisionController,
                validator: requiredValidator.call,
                options: Division.list,
                onChanged: (value) {
                  _division = value;
                  _divisionController.text = value.label;
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
