import 'package:flexurio_chiron_finance/src/app/bloc/currency_query/currency_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/rate_query/rate_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/invoice_receive/invoice_receive_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_finance/src/app/model/rate.dart';
import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_group.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/purchase_order.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/tax.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive_query/product_receive_query_bloc.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class InvoiceReceiveCreatePage extends StatefulWidget {
  const InvoiceReceiveCreatePage({
    super.key,
    this.invoiceReceive,
    this.currency,
    this.purchaseOrder,
    this.supplier,
    this.rate,
  });

  final InvoiceReceive? invoiceReceive;
  final Currency? currency;
  final Rate? rate;
  final PurchaseOrder? purchaseOrder;
  final Supplier? supplier;

  static Widget prepare({
    InvoiceReceive? invoiceReceive,
    Currency? currency,
    Rate? rate,
    PurchaseOrder? purchaseOrder,
    Supplier? supplier,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => InvoiceReceiveBloc()),
        BlocProvider(
            create: (context) => MaterialReceiveQueryBloc(isExternal: false)),
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(MaterialGroupQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
        BlocProvider(
            create: (context) => ProductReceiveQueryBloc(isExternal: false)),
        BlocProvider(
          create: (context) =>
              CurrencyQueryBloc()..add(const CurrencyQueryEvent.fetch()),
        ),
        BlocProvider(create: (context) => PurchaseOrderQueryBloc()),
        BlocProvider(
          create: (context) =>
              SupplierQueryBloc()..add(const SupplierQueryEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => RateQueryBloc()
            ..add(
              RateQueryEvent.fetch(pageOptions: PageOptions.emptyNoLimit()),
            ),
        ),
      ],
      child: InvoiceReceiveCreatePage(
        invoiceReceive: invoiceReceive,
        currency: currency,
        rate: rate,
        purchaseOrder: purchaseOrder,
        supplier: supplier,
      ),
    );
  }

  @override
  State<InvoiceReceiveCreatePage> createState() =>
      _InvoiceReceiveCreatePageState();
}

class _InvoiceReceiveCreatePageState extends State<InvoiceReceiveCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _invoiceNoController = TextEditingController();
  final _invoiceDateController = TextEditingController();
  final _deliveryOrderIdController = TextEditingController();
  final _taxInvoiceDateController = TextEditingController();
  final _dueDateController = TextEditingController();
  final _materialGroupIdController = TextEditingController();
  final _termOfPaymentController = TextEditingController();
  final _subtotalController = TextEditingController();
  final _taxInvoiceNoController = TextEditingController();
  final _ppnController = TextEditingController();
  final _deliveryOrderDateController = TextEditingController();
  double ppnP = 1;
  TaxType? _taxType;

  late DataAction _action;
  Supplier? _supplier;
  DateTime? _deliveryOrderDate;
  DateTime? _invoiceDate;
  DateTime? _dueDate;
  DateTime? _taxInvoiceDate;
  MaterialGroup? _materialGroup;
  PurchaseOrder? _purchaseOrder;

  Ppn? _ppn;

  double _total() {
    final subtotal = stringDecimalToDouble(_subtotalController.text);
    return subtotal +
        (subtotal * ((_ppn?.id ?? 0) / 100)) -
        (subtotal * ((_taxType?.taxPercent ?? 0) / 100));
  }

  @override
  void initState() {
    _action = createOrEdit(widget.invoiceReceive);
    super.initState();

    if (_action.isEdit) {
      _taxInvoiceNoController.text = widget.invoiceReceive!.taxInvoiceNo;
      _deliveryOrderIdController.text = widget.invoiceReceive!.deliveryOrderId;
      _ppnController.text = widget.invoiceReceive!.ppn.label;
      _supplier = widget.invoiceReceive!.supplier;
      _materialGroupIdController.text =
          widget.invoiceReceive!.purchaseOrder.materialGroup!.id;
      _materialGroup = widget.invoiceReceive!.purchaseOrder.materialGroup;
      _purchaseOrder = widget.invoiceReceive!.purchaseOrder;
      _invoiceDate = widget.invoiceReceive!.invoiceDate;
      _taxInvoiceDate = widget.invoiceReceive!.taxInvoiceDate;
      _deliveryOrderDate = widget.invoiceReceive!.deliveryOrderDate;
      _dueDate = widget.invoiceReceive!.dueDate;
      _invoiceNoController.text = widget.invoiceReceive!.id;
      _termOfPaymentController.text =
          widget.invoiceReceive!.termOfPayment.toString();
      // _totalController.text = widget.invoiceReceive!.total.format();
      _subtotalController.text = widget.invoiceReceive!.subtotal.format();
      _ppnController.text = widget.invoiceReceive!.ppn.label;
      _ppn = widget.invoiceReceive!.ppn;
      _taxType = widget.invoiceReceive!.pph;
      // _rate = widget.invoiceReceive!.rate;
      // _transactionNoController.text = widget.invoiceReceive!.transactionNo;
      // _ppnPercent = widget.invoiceReceive!.ppn;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (_action.isEdit) {
        context.read<InvoiceReceiveBloc>().add(
              InvoiceReceiveEvent.edit(
                invoiceReceive: widget.invoiceReceive!,
                subtotal: stringDecimalToDouble(_subtotalController.text),
                ppn: _ppn!,
                taxType: _taxType!,
                total: _total(),
                termOfPayment: stringToInt(_termOfPaymentController.text),
                dueDate: _dueDate!,
              ),
            );
      } else {
        context.read<InvoiceReceiveBloc>().add(
              InvoiceReceiveEvent.create(
                invoiceNo: _invoiceNoController.text,
                purchaseOrder: _purchaseOrder!,
                supplier: _supplier!,
                rate: _purchaseOrder!.rate,
                invoiceDate: _invoiceDate!,
                deliveryOrderId: _deliveryOrderIdController.text,
                deliveryOrderDate: _deliveryOrderDate!,
                taxInvoiceNo: _taxInvoiceNoController.text,
                taxInvoiceDate: _taxInvoiceDate!,
                subtotal: stringDecimalToDouble(_subtotalController.text),
                ppn: _ppn!,
                taxType: _taxType!,
                total: _total(),
                termOfPayment: stringToInt(_termOfPaymentController.text),
                dueDate: _dueDate!,
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.invoiceReceive;
    return BlocListener<InvoiceReceiveBloc, InvoiceReceiveState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => Toast(context).fail(error),
          success: () {
            Toast(context).dataChanged(_action, entity);
            Navigator.pop(context, true);
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          action: _action,
          entity: entity,
          formKey: _formKey,
          size: SingleFormPanelSize.large,
          actions: [
            BlocBuilder<InvoiceReceiveBloc, InvoiceReceiveState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  action: _action,
                  onPressed: _submit,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                );
              },
            ),
          ],
          children: [
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'invoice_number'.tr(),
                  controller: _invoiceNoController,
                  validator: requiredValidator.call,
                  enabled: _action.isCreate,
                ),
                FieldDatePicker(
                  labelText: 'invoice_date'.tr(),
                  validator: requiredObjectValidator.call,
                  enabled: _action.isCreate,
                  controller: _invoiceDateController,
                  onChanged: (value) => _invoiceDate = value,
                  initialSelectedDate: _invoiceDate,
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                FDropDownSearchMaterialGroup(
                  initialValue:
                      widget.invoiceReceive?.purchaseOrder.materialGroup,
                  onChanged: (materialGroup) {
                    if (materialGroup != null) {
                      _materialGroup = materialGroup;
                      _purchaseOrder = null;
                      context.read<PurchaseOrderQueryBloc>().add(
                            PurchaseOrderQueryEvent.fetch(
                              status: [
                                PurchaseOrderStatus.close,
                                PurchaseOrderStatus.nextShipping
                              ],
                              pageOptions: PageOptions.emptyNoLimit(),
                              materialGroupId: [materialGroup.id],
                            ),
                          );
                      setState(() {});
                    }
                  },
                ),
                FDropDownSearchPurchaseOrder(
                  key: ValueKey(_materialGroup),
                  initialValue: widget.invoiceReceive?.purchaseOrder,
                  onChanged: (purchaseOrder) {
                    context.read<MaterialReceiveQueryBloc>().add(
                        MaterialReceiveQueryEvent.fetch(
                            purchaseOrder: purchaseOrder));
                    if (purchaseOrder != null) {
                      _purchaseOrder = purchaseOrder;
                      _subtotalController.text =
                          purchaseOrder.subtotal.format();
                      _deliveryOrderIdController.text =
                          purchaseOrder.deliveryOrderId ?? '-';
                      _deliveryOrderDateController.text =
                          purchaseOrder.deliveryDate.yMMMMd;
                      _supplier = purchaseOrder.supplier;
                      _ppn = purchaseOrder.ppn;
                      _taxType = purchaseOrder.taxType;
                      _ppnController.text = purchaseOrder.ppn.label;
                      setState(() {});
                    }
                  },
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'currency'.tr(),
                  child: Text(_purchaseOrder?.currency.id ?? '-'),
                ),
                TileDataVertical(
                  label: 'rate'.tr(),
                  child: Text(_purchaseOrder?.rate.format() ?? '-'),
                ),
                TileDataVertical(
                  label: 'supplier'.tr(),
                  child: Text(_supplier?.name ?? '-'),
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                BlocListener<MaterialReceiveQueryBloc,
                    MaterialReceiveQueryState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      loaded: (materialReceive) {
                        _deliveryOrderIdController.text =
                            materialReceive.first.deliveryOrderId;
                      },
                    );
                  },
                  child: FTextFormField(
                    labelText: 'delivery_order'.tr(),
                    controller: _deliveryOrderIdController,
                    validator: requiredValidator.call,
                    enabled: _action.isCreate,
                  ),
                ),
                FieldDatePicker(
                  labelText: 'delivery_order_date'.tr(),
                  validator: requiredObjectValidator.call,
                  enabled: _action.isCreate,
                  controller: _deliveryOrderDateController,
                  onChanged: (value) => _deliveryOrderDate = value,
                  initialSelectedDate: _deliveryOrderDate,
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'tax_invoice_number'.tr(),
                  controller: _taxInvoiceNoController,
                  enabled: _action.isCreate,
                ),
                FieldDatePicker(
                  labelText: 'tax_invoice_date'.tr(),
                  enabled: _action.isCreate,
                  controller: _taxInvoiceDateController,
                  onChanged: (value) => _taxInvoiceDate = value,
                  initialSelectedDate: _taxInvoiceDate,
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'term_of_payment'.tr(),
                  controller: _termOfPaymentController,
                  validator: requiredValidator.call,
                  enabled: _action.isCreate,
                ),
                FieldDatePicker(
                  labelText: 'due_date'.tr(),
                  enabled: _action.isCreate,
                  validator: requiredObjectValidator.call,
                  controller: _dueDateController,
                  onChanged: (value) => _dueDate = value,
                  initialSelectedDate: _dueDate,
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'Subtotal',
                  controller: _subtotalController,
                  onChanged: (subtotal) {
                    setState(() {});
                  },
                  inputFormatters: [currencyFormatter],
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                SelectChipField<Ppn>(
                  key: ValueKey(_ppn.hashCode),
                  label: 'PPN',
                  getLabel: (ppn) => ppn.label,
                  controller: _ppnController,
                  validator: requiredValidator.call,
                  options: Ppn.list,
                  onChanged: (value) {
                    _ppn = value;
                    setState(() {});
                  },
                ),
                FDropDownSearchTaxType(
                  initialValue: _taxType,
                  onChanged: (taxType) {
                    if (taxType != null) {
                      _taxType = taxType;
                      setState(() {});
                    }
                  },
                ),
              ],
            ),
            const Gap(24),
            TileDataHorizontal(
              label: 'Total',
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              child: Text(
                _total().format(),
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
