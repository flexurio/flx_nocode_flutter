import 'package:appointment/src/app/view/widget/drop_down_items/product_return.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_check_query/product_return_check_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_detail_query/product_return_detail_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_note_detail/product_return_note_detail_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_query/product_return_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_note.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_note_detail.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class ProductReturnNoteDetailCreatePage extends StatefulWidget {
  const ProductReturnNoteDetailCreatePage({
    required this.productReturnNote,
    super.key,
  });

  final ProductReturnNote productReturnNote;

  static Widget prepare({
    required ProductReturnNote productReturnNote,
  }) {
    final DateTime period = DateTime.now().startOfDay;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(const ProductQueryEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => PurchaseOrderQueryBloc()
            ..add(
              const PurchaseOrderQueryEvent.fetch(),
            ),
        ),
        BlocProvider(
          create: (context) => ProductReturnQueryBloc()
            ..add(
              ProductReturnQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
                createdDateStart: period.startOfMonth,
                createdDateEnd: period.endOfMonth,
                customerId: productReturnNote.customer.id,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => ProductReturnNoteDetailBloc(),
        ),
        BlocProvider(
          create: (context) => ProductReturnDetailQueryBloc(),
        ),
        BlocProvider(
          create: (context) => ProductReturnCheckQueryBloc(),
        ),
        BlocProvider(
          create: (context) => ProductionOrderQueryBloc(isExternal: false)
            ..add(const ProductionOrderQueryEvent.fetch()),
        ),
      ],
      child: ProductReturnNoteDetailCreatePage(
        productReturnNote: productReturnNote,
      ),
    );
  }

  @override
  State<ProductReturnNoteDetailCreatePage> createState() =>
      _ProductReturnNoteDetailCreatePageState();
}

class _ProductReturnNoteDetailCreatePageState
    extends State<ProductReturnNoteDetailCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _totalController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _unitController = TextEditingController();
  final _productNameController = TextEditingController();
  final _qtyOutRemainingController = TextEditingController();
  final _deliveryController = TextEditingController();
  final _periodController = TextEditingController();
  final _productList = <ProductReturnNoteDetail>[];
  Product? _product;
  ProductReturn? _productReturn;
  ProductionOrder? _productionOrder;
  late DateTime _period;

  @override
  void initState() {
    super.initState();
    _period = DateTime.now().startOfDay;
  }

  @override
  void dispose() {
    _totalController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    _unitController.dispose();
    _productNameController.dispose();
    _qtyOutRemainingController.dispose();
    _deliveryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.productReturnNoteDetail;
    return BlocListener<ProductReturnNoteDetailBloc,
        ProductReturnNoteDetailState>(
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
          action: action,
          entity: entity,
          formKey: _formKey,
          actions: [
            _buildButtonSubmit(action),
          ],
          children: [
            RowFields(
              children: [
                TileDataVertical(
                  label: 'product_return_id'.tr(),
                  child: Text(widget.productReturnNote.id),
                ),
                TileDataVertical(
                  label: 'customer'.tr(),
                  child: Text(widget.productReturnNote.customer.name),
                ),
              ],
            ),
            Gap(12),
            _buildFieldPeriod(),
            Gap(24),
            RowFields(
              children: [
                Column(
                  children: [
                    _buildFieldProductReturn(),
                    const Gap(24),
                    _buildFieldProduct(),
                    const Gap(26),
                    _buildFieldBatch(),
                    const Gap(24),
                    _buildFieldQuantity(),
                  ],
                ),
                Column(
                  children: [
                    _buildFieldDeliveryOrder(),
                    const Gap(24),
                    _buildFieldUnit(),
                    const Gap(24),
                    _buildFieldPrice(),
                    const Gap(24),
                    _buildFieldQtyOutRemaining(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldDeliveryOrder() {
    return BlocBuilder<ProductReturnDetailQueryBloc,
        ProductReturnDetailQueryState>(
      builder: (context, state) {
        return FDropDownSearch<String>(
          key: ValueKey(_deliveryController.text),
          initialValue:
              _deliveryController.text == '' ? null : _deliveryController.text,
          validator: requiredObjectValidator.call,
          labelText: 'delivery_order'.tr(),
          itemAsString: (deliveryOrder) => deliveryOrder,
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (productReturnDetail) => productReturnDetail.data
                .map((e) => e.deliveryOrderId)
                .toSet()
                .toList(),
          ),
          onChanged: (delivery) {
            if (delivery != null) {
              _deliveryController.text = delivery;
            }
          },
        );
      },
    );
  }

  Widget _buildFieldUnit() {
    return BlocBuilder<ProductReturnDetailQueryBloc,
        ProductReturnDetailQueryState>(
      builder: (context, state) {
        final a = state.maybeWhen(
          orElse: () => <ProductReturnDetail>[],
          loaded: (productReturnDetail) => productReturnDetail.data
              .where((e) => e.product.id == _product?.id)
              .toList(),
        );
        final unit = a.isNotEmpty ? a.first.unit.id : '';
        _unitController.text = unit;
        return FTextFormField(
          labelText: 'Unit',
          controller: _unitController,
          validator: requiredValidator.call,
          enabled: false,
        );
      },
    );
  }

  Widget _buildFieldBatch() {
    return BlocBuilder<ProductReturnDetailQueryBloc,
        ProductReturnDetailQueryState>(
      builder: (context, state) {
        return FDropDownSearch<ProductionOrder>(
          validator: requiredObjectValidator.call,
          key: ValueKey(_productReturn),
          labelText: 'batch_no'.tr(),
          itemAsString: (order) => order.id,
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (productionOrders) =>
                productionOrders.data.map((e) => e.batchNo).toSet().toList(),
          ),
          onChanged: (order) {
            if (order != null) {
              _productionOrder = order;
            }
          },
        );
      },
    );
  }

  Widget _buildFieldPeriod() {
    return FieldMonthPicker(
      labelText: 'Period',
      initialSelectedDate: _period,
      controller: _periodController,
      validator: requiredObjectValidator.call,
      onChanged: (value) {
        _period = value;
        _productReturnFetch();
      },
      maxDate: DateTime.now(),
    );
  }

  Widget _buildFieldQuantity() {
    return FTextFormField(
      validator: requiredValidator.call,
      labelText: 'quantity'.tr(),
      controller: _quantityController,
      onChanged: (qty) {
        _totalController.text = _totalValue().format();
      },
    );
  }

  Widget _buildFieldQtyOutRemaining() {
    return FTextFormField(
      labelText: 'quantity_out_remaining'.tr(),
      controller: _qtyOutRemainingController,
      enabled: false,
      validator: requiredValidator.call,
    );
  }

  void _clearForm() {
    _product = null;
    _productReturn = null;
    _productionOrder = null;
    _deliveryController.clear();
    _unitController.clear();
    _quantityController.clear();
    _priceController.clear();
    _totalController.clear();
    _qtyOutRemainingController.clear();
  }

  void _productReturnFetch() {
    _productReturn = null;
    context.read<ProductReturnQueryBloc>().add(
          ProductReturnQueryEvent.fetch(
            createdDateStart: _period.startOfMonth,
            createdDateEnd: _period.endOfMonth,
            customerId: widget.productReturnNote.customer.id,
            pageOptions: PageOptions.emptyNoLimit(),
          ),
        );
    setState(() {});
  }

  double _totalValue() {
    return stringDecimalToDouble(_quantityController.text) *
        stringDecimalToDouble(_priceController.text);
  }

  void _submit() {
    if (_product != null &&
        _productReturn != null &&
        _productionOrder != null &&
        _unitController.text.isNotEmpty &&
        _quantityController.text.isNotEmpty &&
        _priceController.text.isNotEmpty &&
        _totalController.text.isNotEmpty) {
      final quantityOutRemaining = stringToInt(_qtyOutRemainingController.text);
      final quantity = stringToInt(_quantityController.text);
      if (quantityOutRemaining < quantity) {
        Toast(context)
            .fail('Quantity out remaining cannot be less than quantity');
        return;
      }

      context.read<ProductReturnNoteDetailBloc>().add(
            ProductReturnNoteDetailEvent.create(
              productReturnNoteId: widget.productReturnNote.id,
              productReturnId: _productReturn!.id,
              productId: _product!.id,
              batchNoId: _productionOrder!.id,
              deliveryOrderId: _deliveryController.text,
              unitId: _unitController.text,
              quantity: quantity,
              price: stringDecimalToDouble(_priceController.text),
              total: stringDecimalToDouble(_totalController.text),
            ),
          );
    }
  }

  Widget _buildButtonAddItem() {
    return Button(
      permission: null,
      action: DataAction.add,
      onPressed: () {
        if (_product != null &&
            _productReturn != null &&
            _productionOrder != null &&
            _unitController.text.isNotEmpty &&
            _quantityController.text.isNotEmpty &&
            _priceController.text.isNotEmpty &&
            _totalController.text.isNotEmpty) {
          final quantityOutRemaining =
              stringToInt(_qtyOutRemainingController.text);
          final quantity = stringToInt(_quantityController.text);
          if (quantityOutRemaining < quantity) {
            Toast(context)
                .fail('Quantity out remaining cannot be less than quantity');
            return;
          }

          _productList.add(
            ProductReturnNoteDetail(
              id: 0,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              productReturnNote: widget.productReturnNote,
              productReturn: _productReturn!,
              productId: _product!.id,
              product: _product!,
              batchNo: _productionOrder!.id,
              deliveryOrderId: _deliveryController.text,
              unitId: _unitController.text,
              quantity: stringToInt(_quantityController.text),
              price: stringDecimalToDouble(_priceController.text),
              total: stringDecimalToDouble(_totalController.text),
            ),
          );
          _clearForm();
          setState(() {});
        } else {
          Toast(context).fail('Please fill out all fields');
        }
      },
    );
  }

  Widget _buildFieldProduct() {
    return BlocBuilder<ProductReturnDetailQueryBloc,
        ProductReturnDetailQueryState>(
      builder: (context, state) {
        return FDropDownSearch<ProductReturnDetail>(
          validator: requiredObjectValidator.call,
          key: ValueKey(_productReturn?.id),
          labelText: 'product'.tr(),
          itemAsString: (productReturnDetail) {
            final product = productReturnDetail.product;
            return '${product.id} - ${product.name}';
          },
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (productReturnDetail) =>
                productReturnDetail.data.map((e) => e).toSet().toList(),
          ),
          onChanged: (productReturnDetail) {
            if (productReturnDetail != null) {
              _product = productReturnDetail.product;
              _productNameController.text = productReturnDetail.product.name;
              _priceController.text =
                  productReturnDetail.productPrice.format(0);
              _qtyOutRemainingController.text =
                  productReturnDetail.quantityReturn.toString();
            }
            setState(() {});
          },
        );
      },
    );
  }

  Widget _buildFieldProductReturn() {
    return FDropDownSearchProductReturn(
      key: ValueKey(_productReturn?.id),
      initialValue: _productReturn,
      onChanged: (products) {
        if (products != null) {
          _productReturn = products;
          context.read<ProductReturnDetailQueryBloc>().add(
                ProductReturnDetailQueryEvent.fetch(
                  productReturnId: products.id,
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              );
          context.read<ProductReturnCheckQueryBloc>().add(
                ProductReturnCheckQueryEvent.fetch(
                    productReturnId: products.id),
              );
        }
      },
    );
  }

  Widget _buildFieldPrice() {
    return FTextFormField(
      labelText: 'price'.tr(),
      controller: _priceController,
      validator: requiredValidator.call,
      onChanged: (price) {
        _totalController.text = _totalValue().format();
      },
      inputFormatters: [
        ThousandsFormatter(),
      ],
    );
  }

  BlocBuilder<ProductReturnNoteDetailBloc, ProductReturnNoteDetailState>
      _buildButtonSubmit(DataAction action) {
    return BlocBuilder<ProductReturnNoteDetailBloc,
        ProductReturnNoteDetailState>(
      builder: (context, state) {
        return Visibility(
          // visible: _productList.isNotEmpty,
          visible: true,
          child: Button(
            permission: null,
            action: action,
            onPressed: _submit,
            isInProgress: state.maybeWhen(
              orElse: () => false,
              loading: () => true,
            ),
          ),
        );
      },
    );
  }
}
