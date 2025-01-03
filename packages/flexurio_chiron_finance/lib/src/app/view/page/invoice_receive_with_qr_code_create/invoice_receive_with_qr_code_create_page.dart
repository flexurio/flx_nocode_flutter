import 'package:flexurio_chiron_finance/src/app/bloc/invoice_receive/invoice_receive_bloc.dart';
import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_group.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/purchase_order.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/tax.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/model/validate_invoice.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_query/bloc/product_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';

class InvoiceReceiveWithQrCodeCreatePage extends StatefulWidget {
  const InvoiceReceiveWithQrCodeCreatePage._({
    required this.resValidateInvoicePm,
  });

  final ResValidateInvoicePm resValidateInvoicePm;

  static Route route({
    required ResValidateInvoicePm resValidateInvoicePm,
  }) {
    return MaterialPageRoute(
      builder: (context) => InvoiceReceiveWithQrCodeCreatePage.prepare(
        resValidateInvoicePm: resValidateInvoicePm,
      ),
    );
  }

  static Widget prepare({
    required ResValidateInvoicePm resValidateInvoicePm,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => InvoiceReceiveBloc()),
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(MaterialGroupQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
        BlocProvider(create: (context) => MaterialQueryBloc()),
        BlocProvider(
            create: (context) => ProductQueryBloc(isExternal: false)
              ..add(
                ProductQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              )),
        BlocProvider(create: (context) => PurchaseOrderQueryBloc()),
      ],
      child: InvoiceReceiveWithQrCodeCreatePage._(
        resValidateInvoicePm: resValidateInvoicePm,
      ),
    );
  }

  @override
  State<InvoiceReceiveWithQrCodeCreatePage> createState() =>
      _InvoiceReceiveWithQrCodeCreatePageState();
}

class _InvoiceReceiveWithQrCodeCreatePageState
    extends State<InvoiceReceiveWithQrCodeCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _invoiceDateController = TextEditingController();
  final _taxInvoiceDateController = TextEditingController();
  final _dueDateController = TextEditingController();
  final _termOfPaymentController = TextEditingController();
  final _taxInvoiceNoController = TextEditingController();
  final _ppnController = TextEditingController();
  TaxType? _taxType;
  Supplier? _supplier;
  DateTime? _invoiceDate;
  DateTime? _dueDate;
  DateTime? _taxInvoiceDate;
  MaterialGroup? _materialGroup;
  PurchaseOrder? _purchaseOrder;
  Ppn? _ppn;

  List<InvoiceReceiveDetailRequest> _details = [];

  @override
  void initState() {
    super.initState();
    _setDetails();
  }

  @override
  void dispose() {
    _invoiceDateController.dispose();
    _taxInvoiceDateController.dispose();
    _dueDateController.dispose();
    _termOfPaymentController.dispose();
    _taxInvoiceNoController.dispose();
    _ppnController.dispose();
    super.dispose();
  }

  void _setDetails() {
    _details.clear();
    for (final detail in widget.resValidateInvoicePm.transactionDetails) {
      _details.add(
        InvoiceReceiveDetailRequest(
          quantity: detail.itemQuantity.toDouble(),
          price: detail.unitPrice.toDouble(),
          total: detail.totalPrice.toDouble(),
          unitId: '',
          materialId: '',
          productId: '',
        ),
      );
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      for (int i = 0; i < _details.length; i++) {
        if (_details[i].materialId == '' && _details[i].productId == '') {
          Toast(context)
              .fail('Please provide material or product at row ${i + 1}');
          return;
        }
      }

      final deliveryOrderDate = DateTime.parse(
          '${DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.resValidateInvoicePm.invoiceDate.split('/')[2] + '-' + widget.resValidateInvoicePm.invoiceDate.split('/')[1] + '-' + widget.resValidateInvoicePm.invoiceDate.split('/')[0]))}');
      context.read<InvoiceReceiveBloc>().add(
            InvoiceReceiveEvent.createWithDetail(
              invoiceNo: widget.resValidateInvoicePm.reference,
              purchaseOrder: _purchaseOrder!,
              supplier: _supplier!,
              rate: _purchaseOrder!.rate,
              invoiceDate: _invoiceDate!,
              deliveryOrderId: widget.resValidateInvoicePm.invoiceNumber,
              deliveryOrderDate: deliveryOrderDate,
              taxInvoiceNo: _taxInvoiceNoController.text,
              taxInvoiceDate: _taxInvoiceDate!,
              subtotal: _subtotal(),
              ppn: _ppn!,
              taxType: _taxType!,
              total: _total(),
              termOfPayment: stringToInt(_termOfPaymentController.text),
              dueDate: _dueDate!,
              invoiceReceiveDetails: _details,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final action = DataAction.create;
    final entity = Entity.invoiceReceive;
    return MultiBlocListener(
      listeners: [
        BlocListener<InvoiceReceiveBloc, InvoiceReceiveState>(
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
        ),
        BlocListener<ProductQueryBloc, ProductQueryState>(
          listener: (context, state) {
            // TODO: implement listener
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          action: action,
          entity: entity,
          formKey: _formKey,
          size: SingleFormPanelSize.large,
          actions: [
            BlocBuilder<InvoiceReceiveBloc, InvoiceReceiveState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  action: action,
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
            _buildForm(),
            Gap(24),
            if (_materialGroup != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: _buildTableDetails(),
              ),
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

  Widget _buildTableDetails() {
    return YuhuTable<TransactionDetail>(
      rowHeight: 80,
      columns: [
        TableColumn(
          width: 400,
          title: 'name'.tr(),
          builder: (item, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.itemName),
                _materialGroup?.id == 'PRODUCT'
                    ? FDropDownSearchProduct(
                        key: Key(_materialGroup?.id ?? ''),
                        onChanged: (product) {
                          _details[index].productId = product?.id ?? '';
                        },
                      )
                    : FDropDownSearchMaterial(
                        key: Key(_materialGroup?.id ?? ''),
                        onChanged: (material) {
                          _details[index].materialId = material?.id ?? '';
                        },
                      ),
              ],
            );
          },
        ),
        TableColumn(
          width: 50,
          alignment: Alignment.centerRight,
          title: 'quantity'.tr(),
          builder: (item, _) {
            return Text(item.itemQuantity.format());
          },
        ),
        TableColumn(
          width: 100,
          alignment: Alignment.centerRight,
          title: 'price'.tr(),
          builder: (item, _) {
            return Text(item.unitPrice.format());
          },
        ),
        TableColumn(
          width: 100,
          alignment: Alignment.centerRight,
          title: 'total'.tr(),
          builder: (item, _) {
            return Text(item.totalPrice.format());
          },
        ),
      ],
      status: Status.loaded,
      data: widget.resValidateInvoicePm.transactionDetails,
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        RowFields(
          children: [
            TileDataVertical(
              label: 'invoice_number'.tr(),
              child: Text(widget.resValidateInvoicePm.reference),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'delivery_order'.tr(),
              child: Text(widget.resValidateInvoicePm.invoiceNumber),
            ),
            TileDataVertical(
              label: 'delivery_order_date'.tr(),
              child: Text(widget.resValidateInvoicePm.invoiceDate),
            ),
          ],
        ),
        const Gap(24),
        RowFields(
          children: [
            FieldDatePicker(
              labelText: 'invoice_date'.tr(),
              validator: requiredObjectValidator.call,
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
              onChanged: (materialGroup) {
                if (materialGroup != null) {
                  _materialGroup = materialGroup;
                  _purchaseOrder = null;
                  _setDetails();
                  context.read<MaterialQueryBloc>().add(
                        MaterialQueryEvent.fetch(
                          pageOptions: PageOptions.emptyNoLimit(),
                          materialGroup: materialGroup,
                        ),
                      );
                  context.read<PurchaseOrderQueryBloc>().add(
                        PurchaseOrderQueryEvent.fetch(
                          status: [PurchaseOrderStatus.input],
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
              initialValue: _purchaseOrder,
              onChanged: (purchaseOrder) {
                if (purchaseOrder != null) {
                  _purchaseOrder = purchaseOrder;
                  _supplier = purchaseOrder.supplier;
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
            FTextFormField(
              labelText: 'tax_invoice_number'.tr(),
              controller: _taxInvoiceNoController,
            ),
            FieldDatePicker(
              labelText: 'tax_invoice_date'.tr(),
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
            ),
            FieldDatePicker(
              labelText: 'due_date'.tr(),
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
            SelectChipField<Ppn>(
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
      ],
    );
  }

  double _subtotal() {
    return widget.resValidateInvoicePm.transactionDetails.fold(
      0,
      (total, transactionDetail) =>
          total + transactionDetail.totalPrice.toDouble(),
    );
  }

  double _total() {
    final subtotal = _subtotal();
    return subtotal +
        (subtotal * ((_ppn?.id ?? 0) / 100)) -
        (subtotal * ((_taxType?.taxPercent ?? 0) / 100));
  }
}
