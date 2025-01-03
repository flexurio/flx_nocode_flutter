import 'package:flexurio_chiron_product_stock/src/app/bloc/product_issue/product_issue_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_issue_query/product_issue_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_issue.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class ProductIssueDeliveryActualPage extends StatefulWidget {
  const ProductIssueDeliveryActualPage({
    required this.productIssue,
    super.key,
  });

  final ProductIssue productIssue;

  static Route<bool?> route({
    required ProductIssue productIssue,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductIssueBloc(),
          ),
          BlocProvider(
            create: (context) => ProductIssueQueryBloc()
              ..add(const ProductIssueQueryEvent.fetch()),
          ),
        ],
        child: ProductIssueDeliveryActualPage(
          productIssue: productIssue,
        ),
      ),
    );
  }

  @override
  State<ProductIssueDeliveryActualPage> createState() =>
      _ProductIssueDeliveryActualPageState();
}

class _ProductIssueDeliveryActualPageState
    extends State<ProductIssueDeliveryActualPage> {
  final _formKey = GlobalKey<FormState>();
  final _expeditionController = TextEditingController();
  final _shippingNoController = TextEditingController();
  final _shippingChargeController = TextEditingController();
  final _packageQtyController = TextEditingController();
  final _kilogramQtyController = TextEditingController();
  final _salesOrderController = TextEditingController();
  final _deliveryOrderIdController = TextEditingController();

  DateTime? _deliveryOrderReceived;
  DateTime? _deliveryDate;
  DateTime? _endPackingDate;
  DateTime? _deliveryOrderDate;

  late ProductIssueShipmentVia _shipmentVia;
  late DataAction _action;

  @override
  void initState() {
    super.initState();

    _action = createOrEdit(widget.productIssue);

    if (_action.isEdit) {
      _expeditionController.text = widget.productIssue.expedition;
      _shippingNoController.text = widget.productIssue.shippingNo;
      _shipmentVia = widget.productIssue.shipmentVia;
      _shippingChargeController.text =
          widget.productIssue.shippingCharge.toString();
      _packageQtyController.text = widget.productIssue.packageQty.toString();
      _kilogramQtyController.text = widget.productIssue.kilogramQty.toString();
      _deliveryDate = widget.productIssue.deliveryDate;
      _deliveryOrderReceived = widget.productIssue.deliveryOrderReceived;
      _endPackingDate = widget.productIssue.endPackingDate;
      _salesOrderController.text = widget.productIssue.salesOrderId ?? '';
      _deliveryOrderIdController.text = widget.productIssue.deliveryOrderId;
      _deliveryOrderDate = widget.productIssue.deliveryOrderDate;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<ProductIssueBloc>().add(
            ProductIssueEvent.deliveryActual(
              id: widget.productIssue,
              deliveryOrderReceived: _deliveryOrderReceived!,
              deliveryDate: _deliveryDate!,
              expedition: _expeditionController.text,
              shippingNo: _shippingNoController.text,
              shipmentVia: _shipmentVia,
              shippingCharge: int.parse(_shippingChargeController.text),
              packageQty: int.parse(_packageQtyController.text),
              kilogramQty: int.parse(_kilogramQtyController.text),
              endPackingDate: _endPackingDate!,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.deliveryActual;
    final entity = Entity.productIssue;

    return BlocListener<ProductIssueBloc, ProductIssueState>(
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
          formKey: _formKey,
          action: action,
          entity: entity,
          actions: [
            BlocBuilder<ProductIssueBloc, ProductIssueState>(
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
            FTextFormField(
              enabled: _action.isCreate,
              labelText: 'Sales Order',
              controller: _salesOrderController,
              validator: requiredValidator.call,
            ),
            const SizedBox(height: 24),
            RowFields(
              children: [
                FTextFormField(
                  enabled: _action.isCreate,
                  labelText: 'Delivery Order',
                  controller: _deliveryOrderIdController,
                  validator: requiredValidator.call,
                ),
                FieldDatePicker(
                  initialSelectedDate: _deliveryOrderDate,
                  labelText: 'delivery_order_date'.tr(),
                  controller: TextEditingController(),
                  onChanged: (value) => _deliveryOrderDate = value,
                  validator: requiredObjectValidator.call,
                  enabled: false,
                ),
              ],
            ),
            const SizedBox(height: 24),
            FieldDatePicker(
              initialSelectedDate: _deliveryOrderReceived,
              labelText: 'Delivery Order Received',
              controller: TextEditingController(),
              onChanged: (value) => _deliveryOrderReceived = value,
              validator: requiredObjectValidator.call,
            ),
            const SizedBox(height: 24),
            RowFields(
              children: [
                FieldDatePicker(
                  initialSelectedDate: _deliveryDate,
                  labelText: 'delivery_date'.tr(),
                  controller: TextEditingController(),
                  onChanged: (value) => _deliveryDate = value,
                  validator: requiredObjectValidator.call,
                ),
                FieldDatePicker(
                  initialSelectedDate: _endPackingDate,
                  labelText: 'End Packing Date',
                  controller: TextEditingController(),
                  onChanged: (value) => _endPackingDate = value,
                  validator: requiredObjectValidator.call,
                ),
              ],
            ),
            const SizedBox(height: 24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'Shipping Number',
                  controller: _shippingNoController,
                  validator: requiredValidator.call,
                ),
                FTextFormField(
                  labelText: 'Expedition',
                  controller: _expeditionController,
                  validator: requiredValidator.call,
                ),
              ],
            ),
            const SizedBox(height: 24),
            RowFields(
              children: [
                FDropDownSearch<ProductIssueShipmentVia>(
                  labelText: 'Shipping Method',
                  validator: requiredObjectValidator.call,
                  itemAsString: (shipmentVia) => shipmentVia.id,
                  initialValue: widget.productIssue.shipmentVia,
                  items: ProductIssueShipmentVia.list,
                  onChanged: (shipmentVia) {
                    if (shipmentVia != null) {
                      _shipmentVia = shipmentVia;
                    }
                  },
                ),
                FTextFormField(
                  labelText: 'Package Quantity',
                  controller: _packageQtyController,
                  validator: requiredValidator.call,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'Shipping Charge',
                  controller: _shippingChargeController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                FTextFormField(
                  labelText: 'Kilogram Quantity',
                  controller: _kilogramQtyController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
