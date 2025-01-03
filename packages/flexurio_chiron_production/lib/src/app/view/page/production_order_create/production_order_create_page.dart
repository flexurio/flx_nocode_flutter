import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_query/bloc/product_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_order/production_order_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/production_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class ProductionOrderCreatePage extends StatefulWidget {
  const ProductionOrderCreatePage._(this.productOrder);

  final ProductionOrder? productOrder;

  static Route<bool?> route({
    required bool isExternal, ProductionOrder? productOrder,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ProductionOrderBloc(isExternal: isExternal),),
          BlocProvider(
            create: (context) => ProductQueryBloc(isExternal: isExternal)
              ..add(
                ProductQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
        ],
        child: ProductionOrderCreatePage._(productOrder),
      ),
    );
  }

  @override
  State<ProductionOrderCreatePage> createState() => _ProductCreatePageState();
}

class _ProductCreatePageState extends State<ProductionOrderCreatePage> {
  late DataAction _action;

  final _formKey = GlobalKey<FormState>();
  var _isRuahan = false;
  var _isTollIn = false;
  final _batchNoController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _expirationDateController = TextEditingController();
  final _batchSizeController = TextEditingController();
  final _requiredValidatorBatch = RequiredValidatorBatch(
    errorText: 'Batch not valid',
  );
  DateTime? _expirationDate;
  Product? _product;
  late ProductionProductStatus _productStatus;
  ProductionProductScale? _scale;

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.productOrder);

    if (_action.isEdit) {
      _expirationDateController.text =
          widget.productOrder!.expirationDate.yMMMMd;
      _productStatus = widget.productOrder!.productStatus;
      _scale = widget.productOrder!.scale;
      _expirationDate = widget.productOrder!.expirationDate;
      _product = widget.productOrder!.product;
      _isRuahan = widget.productOrder!.isRuahan;
      _isTollIn = widget.productOrder!.isTollIn;
      _batchNoController.text = widget.productOrder!.id;
      _descriptionController.text = widget.productOrder!.description;
      _batchSizeController.text = widget.productOrder!.batchSize.toString();
    }
  }

  @override
  void dispose() {
    _batchNoController.dispose();
    _descriptionController.dispose();
    _expirationDateController.dispose();
    _batchSizeController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late ProductionOrderEvent event;

      if (_action.isEdit) {
        event = ProductionOrderEvent.update(
          isRuahan: _isRuahan,
          product: _product!,
          isTollIn: _isTollIn,
          batchNo: _batchNoController.text,
          batchSize: stringToInt(_batchSizeController.text),
          scale: _scale!,
          description: _descriptionController.text,
          productStatus: _productStatus,
          expirationDate: _expirationDate ?? DateTime(0),
        );
      } else {
        event = ProductionOrderEvent.create(
          isRuahan: _isRuahan,
          product: _product!,
          isTollIn: _isTollIn,
          batchNo: _batchNoController.text,
          batchSize: stringToInt(_batchSizeController.text),
          scale: _scale!,
          expirationDate: _expirationDate ?? DateTime(0),
          description: _descriptionController.text,
          productStatus: _productStatus,
        );
      }

      context.read<ProductionOrderBloc>().add(event);
    }
  }

  void _updateExpiredDate() {
    try {
      var batch = _batchNoController.text;
      final regex = RegExp(r'\d{5}(0[1-9]|1[0-2])\d{2}');

      if (regex.hasMatch(batch) && _product != null) {
        batch = batch.startsWith('T') ? batch.substring(1) : batch;

        final year = int.parse(batch.substring(0, 2)) + 1980;
        final month = int.parse(batch.substring(5, 7));
        final expiryMonth = month + _product!.expiryPeriod + 1;
        final date = DateTime(year, expiryMonth, 0);

        _expirationDate = date;
        _expirationDateController.text = date.yMMMMd;
      } else {
        _expirationDate = null;
      }
    } catch (e) {
      _expirationDate = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.productionOrder;
    return BlocListener<ProductionOrderBloc, ProductionOrderState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(_action, entity);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          actions: [
            const SizedBox(height: 35),
            BlocBuilder<ProductionOrderBloc, ProductionOrderState>(
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
          formKey: _formKey,
          action: _action,
          entity: entity,
          children: [
            RowFields(
              children: [
                BlocBuilder<ProductQueryBloc, ProductQueryState>(
                  builder: (context, state) {
                    return FDropDownSearch<Product>(
                      enabled: _action.isCreate,
                      validator: requiredObjectValidator.call,
                      status: state.maybeWhen(
                        error: (_) => Status.error,
                        loading: (_) => Status.progress,
                        orElse: () => Status.loaded,
                      ),
                      labelText: 'Product',
                      items: state.maybeWhen(
                        orElse: () => [],
                        loaded: (product) => product.data,
                      ),
                      initialValue: widget.productOrder?.product,
                      onChanged: (value) {
                        if (value != null) {
                          _product = value;

                          _batchSizeController.text =
                              value.quantityBatch.toString();
                        }
                        _updateExpiredDate();
                      },
                      itemAsString: (product) => product.name,
                    );
                  },
                ),
                FDropDownSearch<ProductionProductStatus>(
                  validator: requiredObjectValidator.call,
                  labelText: 'Product Status',
                  items: ProductionProductStatus.list,
                  onChanged: (value) {
                    if (value != null) {
                      _productStatus = value;
                    }
                  },
                  initialValue: widget.productOrder?.productStatus,
                  itemAsString: (value) => value.id,
                ),
              ],
            ),
            const Gap(12),
            RowFields(
              children: [
                FDropDownSearch<ProductionProductScale>(
                  validator: requiredObjectValidator.call,
                  labelText: 'Scale',
                  items: ProductionProductScale.list,
                  onChanged: (value) {
                    if (value != null) {
                      _scale = value;
                      setState(() {});
                    }
                  },
                  initialValue: widget.productOrder?.scale,
                  itemAsString: (value) => value.id,
                ),
                FTextFormField(
                  enabled: _action.isCreate,
                  labelText: 'Batch',
                  controller: _batchNoController,
                  validator: _requiredValidatorBatch.call,
                  maxLength: 50,
                  onChanged: (_) {
                    _updateExpiredDate();
                  },
                ),
              ],
            ),
            const Gap(12),
            if (_scale == ProductionProductScale.pilot)
              RowFields(
                children: [
                  FieldDatePicker(
                    labelText: 'Expired Date',
                    initialSelectedDate: widget.productOrder?.expirationDate,
                    controller: _expirationDateController,
                    onChanged: (date) {
                      _expirationDate = date;
                      _expirationDateController.text = date.yMMMMd;
                    },
                  ),
                  FTextFormField(
                    labelText: 'Batch Size',
                    controller: _batchSizeController,
                  ),
                ],
              ),
            if (_scale != ProductionProductScale.pilot)
              RowFields(
                children: [
                  TileDataVertical(
                    label: 'Expired Date',
                    child: Text(
                      _expirationDate == null ? '-' : _expirationDate!.yMMMMd,
                    ),
                  ),
                  FTextFormField(
                    labelText: 'Batch Size',
                    controller: _batchSizeController,
                  ),
                ],
              ),
            const Gap(12),
            FTextFormField(
              labelText: 'Note',
              maxLines: 3,
              controller: _descriptionController,
            ),
            const Gap(12),
            CheckboxWithText(
              initialValue: _isRuahan,
              text: 'Ruahan',
              onChanged: (value) {
                _isRuahan = value;
              },
            ),
            const Gap(12),
            CheckboxWithText(
              initialValue: _isTollIn,
              text: 'Toll In',
              onChanged: (value) {
                _isTollIn = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
