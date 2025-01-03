import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/invoice_receive_detail/invoice_receive_detail_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive_detail.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class InvoiceReceiveDetailCreatePage extends StatefulWidget {
  const InvoiceReceiveDetailCreatePage({
    required this.invoiceReceive,
    super.key,
  });

  final InvoiceReceive invoiceReceive;

  static Widget prepare({
    required InvoiceReceive invoiceReceive,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(const ProductQueryEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => MaterialQueryBloc()
            ..add(
              MaterialQueryEvent.fetch(pageOptions: PageOptions.emptyNoLimit()),
            ),
        ),
        BlocProvider(create: (context) => InvoiceReceiveDetailBloc()),
        BlocProvider(
          create: (context) => PurchaseOrderDetailQueryBloc()
            ..add(PurchaseOrderDetailQueryEvent.fetch(
                purchaseOrder: invoiceReceive.purchaseOrder)),
        )
      ],
      child: InvoiceReceiveDetailCreatePage(invoiceReceive: invoiceReceive),
    );
  }

  @override
  State<InvoiceReceiveDetailCreatePage> createState() =>
      _InvoiceReceiveDetailCreatePageState();
}

class _InvoiceReceiveDetailCreatePageState
    extends State<InvoiceReceiveDetailCreatePage> {
  final formatter = NumberFormat('###,###');
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();
  final _invoiceReceiveTypeController = TextEditingController();
  MaterialUnit? _unit;

  @override
  void initState() {
    super.initState();
  }

  double _total() {
    return stringDecimalToDouble(_quantityController.text) *
        stringDecimalToDouble(_priceController.text);
  }

  InvoiceReceiveType? _invoiceReceiveType;
  Product? _product;
  model.Material? _material;

  bool isProductTypeSelected() {
    return _invoiceReceiveType == InvoiceReceiveType.product;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<InvoiceReceiveDetailBloc>().add(
            InvoiceReceiveDetailEvent.create(
              invoiceReceive: widget.invoiceReceive,
              unit: _unit ?? MaterialUnit.empty(),
              material: _material ?? model.Material.empty(),
              product: _product ?? Product.empty(),
              qtyInvoice: stringDecimalToDouble(_quantityController.text),
              price: stringDecimalToDouble(_priceController.text),
              total: _total(),
            ),
          );
    }
  }

  // MaterialUnit? _unit() {
  //   if (_invoiceReceiveType == InvoiceReceiveType.product) {
  //     return _product?.unitPacking;
  //   } else if (_invoiceReceiveType == InvoiceReceiveType.material) {
  //     return _material?.materialUnit;
  //   } else {
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.invoiceReceiveDetail;
    return BlocListener<InvoiceReceiveDetailBloc, InvoiceReceiveDetailState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => Toast(context).fail(error),
          success: () {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          size: SingleFormPanelSize.large,
          formKey: _formKey,
          action: action,
          entity: entity,
          actions: [
            BlocBuilder<InvoiceReceiveDetailBloc, InvoiceReceiveDetailState>(
              builder: (context, state) {
                return Button(
                  action: action,
                  permission: null,
                  onPressed: _invoiceReceiveType == null ? null : _submit,
                  isInProgress: state.maybeWhen(
                    orElse: () => false,
                    loading: () => true,
                  ),
                );
              },
            ),
          ],
          children: [
            TileDataVertical(
              label: 'invoice_number'.tr(),
              child: Text(widget.invoiceReceive.id),
            ),
            const Gap(12),
            RowFields(
              children: [
                SelectChipField<InvoiceReceiveType>(
                  label: 'type'.tr(),
                  getLabel: (ppn) => ppn.value,
                  controller: _invoiceReceiveTypeController,
                  validator: requiredValidator.call,
                  options: const [
                    InvoiceReceiveType.product,
                    InvoiceReceiveType.material,
                  ],
                  onChanged: (type) {
                    _invoiceReceiveType = type;
                    _product = null;
                    _material = null;
                    setState(() {});
                  },
                ),
                if (_invoiceReceiveType == InvoiceReceiveType.product)
                  BlocBuilder<PurchaseOrderDetailQueryBloc,
                      PurchaseOrderDetailQueryState>(
                    builder: (context, state) {
                      return FDropDownSearch<PurchaseOrderDetail>(
                        labelText: Entity.product.title,
                        onChanged: (value) {
                          _unit = value?.unitConvert ?? MaterialUnit.empty();
                          _product = value?.product;
                          if (value != null) {
                            _quantityController.text =
                                value.quantityReceived?.format() ?? '0';
                            _priceController.text = value.price.format();
                            setState(() {});
                          }
                        },
                        initialValue: PurchaseOrderDetail.empty()
                            .copyWith(product: _product),
                        validator: requiredObjectValidator.call,
                        status: state.maybeWhen(
                          error: (_) => Status.error,
                          loading: () => Status.progress,
                          orElse: () => Status.loaded,
                        ),
                        items: state.maybeWhen(
                            orElse: () => <PurchaseOrderDetail>[],
                            loaded: (product) =>
                                List<PurchaseOrderDetail>.from(product)
                                  ..removeWhere((e) => e.product?.id == '')),
                        itemAsString: (data) => data.product?.name ?? '',
                      );
                    },
                  ),
                if (_invoiceReceiveType == InvoiceReceiveType.material)
                  BlocBuilder<PurchaseOrderDetailQueryBloc,
                      PurchaseOrderDetailQueryState>(
                    builder: (context, state) {
                      return FDropDownSearch<PurchaseOrderDetail>(
                          labelText: Entity.material.title,
                          onChanged: (value) {
                            _unit = value?.unit ?? MaterialUnit.empty();

                            _material = value?.material;
                            if (value != null) {
                              _quantityController.text =
                                  value.quantityReceived?.format() ?? '0';
                              _priceController.text = value.price.format();
                              setState(() {});
                            }
                          },
                          initialValue: PurchaseOrderDetail.empty()
                              .copyWith(material: _material),
                          validator: requiredObjectValidator.call,
                          status: state.maybeWhen(
                            error: (_) => Status.error,
                            loading: () => Status.progress,
                            orElse: () => Status.loaded,
                          ),
                          items: state.maybeWhen(
                              orElse: () => <PurchaseOrderDetail>[],
                              loaded: (material) =>
                                  List<PurchaseOrderDetail>.from(material)
                                    ..removeWhere((e) => e.material?.id == '')),
                          itemAsString: (data) => data.material?.name ?? '');
                    },
                  ),
                if (_invoiceReceiveType == null) const SizedBox.shrink(),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                FTextFormField(
                  isNumeric: true,
                  labelText: 'quantity'.tr(),
                  controller: _quantityController,
                  inputFormatters: [
                    currencyFormatter,
                  ],
                  onChanged: (total) {
                    setState(() {});
                  },
                ),
                FTextFormField(
                  isNumeric: true,
                  labelText: 'price'.tr(),
                  controller: _priceController,
                  inputFormatters: [
                    currencyFormatter,
                  ],
                  onChanged: (total) {
                    setState(() {});
                  },
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'unit'.tr(),
                  child: Text(_unit?.id ?? '-'),
                ),
                TileDataVertical(
                  label: 'total'.tr(),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _total().format(),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
