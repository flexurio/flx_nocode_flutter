import 'package:appointment/src/app/view/widget/drop_down_items/material.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_group.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/material_receipt_detail_summary_purchase_order_query/material_receipt_detail_summary_purchase_order_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_stock_rupiah/util/pdf_material_receipt_detail_summary_purchase_order.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MaterialReceiptDetailSummaryPurchaseOrderExportPdfForm
    extends StatefulWidget {
  const MaterialReceiptDetailSummaryPurchaseOrderExportPdfForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              MaterialReceiptDetailSummaryPurchaseOrderQueryBloc(),
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
      child: const MaterialReceiptDetailSummaryPurchaseOrderExportPdfForm._(),
    );
  }

  @override
  State<MaterialReceiptDetailSummaryPurchaseOrderExportPdfForm> createState() =>
      _MaterialReceiptDetailSummaryPurchaseOrderExportPdfFormState();
}

class _MaterialReceiptDetailSummaryPurchaseOrderExportPdfFormState
    extends State<MaterialReceiptDetailSummaryPurchaseOrderExportPdfForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _startDate;
  DateTime? _endDate;
  MaterialGroup? _materialGroup;
  model.Material? _material;
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    _materialGroup = _materialGroup;
    _startDate = _startDate;
    _endDate = _endDate;
    _material = _material;
    super.initState();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<MaterialReceiptDetailSummaryPurchaseOrderQueryBloc>().add(
            MaterialReceiptDetailSummaryPurchaseOrderQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(sortBy: 'transaction_name'),
              startDate: _startDate,
              endDate: _endDate,
              materialGroup: _materialGroup,
              material: _material,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;

    return BlocListener<MaterialReceiptDetailSummaryPurchaseOrderQueryBloc,
        MaterialReceiptDetailSummaryPurchaseOrderQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfMaterialReceiptDetailSummaryByPurchaseOrder(
                  data: pageOptions.data,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Material_Receipt_Detail_Summary_By_Purchase_Order.pdf',
            );
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title:
            '${action.title} ${'material_receipt_detail_summary_by_purchase_order'.tr()}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<MaterialReceiptDetailSummaryPurchaseOrderQueryBloc,
              MaterialReceiptDetailSummaryPurchaseOrderQueryState>(
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
              RowFields(
                children: [
                  FDropDownSearchMaterialGroup(
                    onChanged: (materialGroup) {
                      if (materialGroup != null) {
                        _materialGroup = materialGroup;
                        setState(() {});
                      }
                    },
                  ),
                  FDropDownSearchMaterial(
                    onChanged: (material) {
                      if (material != null) {
                        _material = material;
                        setState(() {});
                      }
                    },
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
