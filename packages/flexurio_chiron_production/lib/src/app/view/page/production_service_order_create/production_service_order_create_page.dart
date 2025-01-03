import 'package:appointment/src/app/view/widget/drop_down_items/customer.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/production_product_scale.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/production_product_status.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_service_order/production_service_order_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/production_order.dart';
import 'package:flexurio_chiron_production/src/app/model/production_service_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class ProductionServiceOrderCreatePage extends StatefulWidget {
  const ProductionServiceOrderCreatePage._(this.productionServiceOrder);

  final ProductionServiceOrder? productionServiceOrder;

  static Route<bool?> route({ProductionServiceOrder? productionServiceOrder}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CustomerQueryBloc()..add(const CustomerQueryEvent.fetch()),
          ),
          BlocProvider(create: (context) => ProductionServiceOrderBloc()),
        ],
        child: ProductionServiceOrderCreatePage._(productionServiceOrder),
      ),
    );
  }

  @override
  State<ProductionServiceOrderCreatePage> createState() =>
      _ProductionServiceOrderCreatePageState();
}

class _ProductionServiceOrderCreatePageState
    extends State<ProductionServiceOrderCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _productIdController = TextEditingController();
  final _batchNoController = TextEditingController();
  final _quantityController = TextEditingController();
  final _expirationDateController = TextEditingController();
  final _purchaseOrderIdController = TextEditingController();
  final _descriptionController = TextEditingController();
  ProductionProductScale? _scale;
  ProductionProductStatus? _status;
  Customer? _customer;
  late DataAction _action;
  var _isBulk = false;
  DateTime? _expirationDate;

  @override
  void initState() {
    _action = createOrEdit(widget.productionServiceOrder);
    super.initState();
    if (_action.isEdit) {
      final productionOrder = widget.productionServiceOrder!;
      _productNameController.text = productionOrder.productName;
      _productIdController.text = productionOrder.productId;
      _batchNoController.text = productionOrder.batchNo;
      _quantityController.text = productionOrder.quantity.toString();
      _productNameController.text = productionOrder.productName;
      _purchaseOrderIdController.text = productionOrder.purchaseOrderId;
      _descriptionController.text = productionOrder.description;
      _scale = productionOrder.productScale;
      _status = productionOrder.productStatus;
      _expirationDate = productionOrder.expirationDate;
      _customer = productionOrder.customer;
      _isBulk = productionOrder.isBulk;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late ProductionServiceOrderEvent event;

      if (_action.isEdit) {
        event = ProductionServiceOrderEvent.edit(
          productionServiceOrder: widget.productionServiceOrder!,
          productId: _productIdController.text,
          productName: _productNameController.text,
          customerId: _customer!.id,
          batchNo: _batchNoController.text,
          purchaseOrderId: _purchaseOrderIdController.text,
          quantity: stringToInt(_quantityController.text),
          description: _descriptionController.text,
          isBulk: _isBulk,
          status: _status!,
          scale: _scale!,
          expirationDate: _expirationDate!,
        );
      } else {
        event = ProductionServiceOrderEvent.create(
          productId: _productIdController.text,
          productName: _productNameController.text,
          customerId: _customer!.id,
          batchNo: _batchNoController.text,
          purchaseOrderId: _purchaseOrderIdController.text,
          quantity: stringToInt(_quantityController.text),
          description: _descriptionController.text,
          isBulk: _isBulk,
          status: _status!,
          scale: _scale!,
          expirationDate: _expirationDate!,
        );
      }

      context.read<ProductionServiceOrderBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductionServiceOrderBloc,
        ProductionServiceOrderState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(_action, Entity.productionServiceOrder);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          formKey: _formKey,
          action: _action,
          entity: Entity.productionServiceOrder,
          actions: [
            BlocBuilder<ProductionServiceOrderBloc,
                ProductionServiceOrderState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                  action: _action,
                );
              },
            ),
          ],
          children: [
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'Product ID',
                  controller: _productIdController,
                  validator: requiredValidator.call,
                  maxLength: 100,
                ),
                FTextFormField(
                  labelText: 'Product Name',
                  controller: _productNameController,
                  validator: requiredValidator.call,
                  inputFormatters: inputLetterOnly,
                  maxLength: 100,
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                FDropDownSearchCustomer(
                  initialValue: _customer,
                  onChanged: (customer) {
                    if (customer != null) {
                      _customer = customer;
                    }
                  },
                ),
                FTextFormField(
                  labelText: 'Batch No',
                  controller: _batchNoController,
                  validator: requiredValidator.call,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 100,
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'Purchase Order ID',
                  controller: _purchaseOrderIdController,
                  validator: requiredValidator.call,
                  maxLength: 100,
                ),
                FTextFormField(
                  labelText: 'Quantity',
                  controller: _quantityController,
                  validator: requiredValidator.call,
                  inputFormatters: [ThousandsFormatter()],
                  maxLength: 100,
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                FDropDownSearchProductionProductScale(
                  initialValue: _scale,
                  onChanged: (scale) {
                    if (scale != null) {
                      _scale = scale;
                    }
                  },
                ),
                FDropDownSearchProductionProductStatus(
                  initialValue: _status,
                  onChanged: (status) {
                    if (status != null) {
                      _status = status;
                    }
                  },
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                CheckboxWithText(
                  initialValue: _isBulk,
                  text: 'Bulk / Ruahan',
                  onChanged: (value) {
                    setState(() {
                      _isBulk = value;
                    });
                  },
                ),
                FieldDatePicker(
                  labelText: 'Expiration Date',
                  initialSelectedDate: _expirationDate,
                  controller: _expirationDateController,
                  validator: requiredObjectValidator.call,
                  minDate: DateTime.now(),
                  onChanged: (value) {
                    setState(() {
                      _expirationDate = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
