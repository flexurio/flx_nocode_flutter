import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/production_order.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/purchase_order_detail.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_unit.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive/product_receive_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_detail.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class ProductReceiveDetailCreatePage extends StatefulWidget {
  const ProductReceiveDetailCreatePage._(
    this.productReceiveDetail,
    this.orderDetailQueryBloc,
    this.productReceiveBloc,
    this.type,
  );

  final ProductReceiveDetail? productReceiveDetail;
  final PurchaseOrderDetailQueryBloc orderDetailQueryBloc;
  final ProductReceiveBloc productReceiveBloc;
  final ProductReceiveType? type;

  static Widget prepare({
    required PurchaseOrderDetailQueryBloc purchaseOrderDetailQueryBloc,
    required ProductReceiveBloc productReceiveBloc,
    ProductReceiveType? type,
    ProductReceiveDetail? productReceiveDetail,
  }) {
    final active = type == ProductReceiveType.purchaseOrder
        ? false
        : type == ProductReceiveType.nonPurchaseOrder ||
                type == ProductReceiveType.packing
            ? true
            : null;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductQueryBloc(
            pagination: false,
            isExternal: false,
          )..add(ProductQueryEvent.fetch(active: active)),
        ),
        BlocProvider(create: (context) => purchaseOrderDetailQueryBloc),
        BlocProvider(
          create: (context) => MaterialUnitQueryBloc()
            ..add(MaterialUnitQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
        BlocProvider(
          create: (context) =>
              ProductionOrderQueryBloc(pagination: false, isExternal: false),
        ),
      ],
      child: ProductReceiveDetailCreatePage._(
        productReceiveDetail,
        purchaseOrderDetailQueryBloc,
        productReceiveBloc,
        type,
      ),
    );
  }

  @override
  State<ProductReceiveDetailCreatePage> createState() =>
      _ProductReceiveDetailCreateState();
}

class _ProductReceiveDetailCreateState
    extends State<ProductReceiveDetailCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  final _warehouseController = TextEditingController();
  final _batchController = TextEditingController();
  final _batchExpiredController = TextEditingController();

  Product? _product;
  MaterialUnit? _unit;
  Warehouse? _warehouse;
  late DataAction _action;
  ProductionOrder? _productionOrder;
  PurchaseOrderDetail? _purchaseOrderDetail;
  DateTime? _batchExpired;

  var _createNewBatch = false;

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.productReceiveDetail);
    if (_action.isEdit) {
      _quantityController.text =
          widget.productReceiveDetail!.quantity.toString();
      _productionOrder = widget.productReceiveDetail!.productionOrder;
      _warehouse = widget.productReceiveDetail!.warehouse;
      _product = widget.productReceiveDetail!.product;
      _unit = _product!.unitPacking;
    }
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _warehouseController.dispose();
    _batchController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (_batchExpired != null) {
        if (_productionOrder == null) {
          _productionOrder = ProductionOrder.empty().copyWith(
            expirationDate: _batchExpired!,
            id: _batchController.text,
            product: _product!,
            scale: ProductionProductScale.empty,
          );
        } else {
          _productionOrder = _productionOrder!.copyWith(
            expirationDate: _batchExpired!,
            id: _batchController.text,
            product: _product!,
            scale: ProductionProductScale.empty,
          );
        }
      }
      final productReceiveDetail = ProductReceiveDetail(
        id: 0,
        createdAt: DateTime(0),
        createdById: 0,
        updatedAt: DateTime(0),
        updatedById: 0,
        expiredDate: _productionOrder!.expirationDate,
        quantity: stringToInt(_quantityController.text),
        productReceive: ProductReceive.empty(),
        warehouse: _warehouse!,
        unit: _unit!,
        status: ProductReceiveDetailStatus.quarantine,
        product: _product!,
        productionOrder: _productionOrder!,
      );
      if (_action.isCreate) {
        Navigator.pop(context, productReceiveDetail);
      } else {
        widget.productReceiveBloc.add(
          ProductReceiveEvent.productEdit(
            productReceiveDetail.copyWith(
              id: widget.productReceiveDetail!.id,
              quantity: stringToInt(_quantityController.text),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleFormPanel(
      visibleBackButton: false,
      actions: [
        Button(
          permission: null,
          isSecondary: true,
          action: DataAction.cancel,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(width: 12),
        if (_action.isCreate) _buildCreateButton(),
        if (_action.isEdit) _buildEditButton(),
      ],
      formKey: _formKey,
      action: _action,
      entity: Entity.product,
      children: _action.isCreate
          ? _buildCreateFields(context)
          : _buildEditFields(context),
    );
  }

  Widget _buildCreateButton() {
    return Button(
      permission: null,
      onPressed: () => _submit(context),
      action: _action,
    );
  }

  Widget _buildEditButton() {
    return BlocListener<ProductReceiveBloc, ProductReceiveState>(
      bloc: widget.productReceiveBloc,
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(_action, Entity.productReceive);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: BlocBuilder<ProductReceiveBloc, ProductReceiveState>(
        bloc: widget.productReceiveBloc,
        builder: (context, state) {
          return _buildCreateButton();
        },
      ),
    );
  }

  List<Widget> _buildCreateFields(BuildContext context) {
    final productBatch = Column(
      children: [
        FDropDownSearchProduct(
          onChanged: (product) {
            if (product != null) {
              _product = product;
              _unit = _product!.unitPacking;
              context
                  .read<ProductionOrderQueryBloc>()
                  .add(ProductionOrderQueryEvent.fetch(product: product));
              _productionOrder = null;
              setState(() {});
            }
          },
        ),
        const Gap(24),
        CheckboxWithText(
          initialValue: _createNewBatch,
          text: 'Batch Non Production',
          onChanged: (value) {
            setState(() {
              _createNewBatch = value;
            });
          },
        ),
        const Gap(24),
        if (_createNewBatch)
          RowFields(
            children: [
              FTextFormField(
                labelText: 'Batch',
                controller: _batchController,
                maxLength: 50,
              ),
              FieldDatePicker(
                labelText: 'Expired Date',
                controller: _batchExpiredController,
                minDate: DateTime.now(),
                validator: (value) => _batchController.text == ''
                    ? null
                    : requiredObjectValidator(value),
                onChanged: (value) => _batchExpired = value,
              ),
            ],
          )
        else
          FDropDownSearchProductionOrder(
            key: ValueKey(_product),
            onChanged: (productionOrder) {
              if (productionOrder != null) {
                _productionOrder = productionOrder;
              }
            },
          ),
      ],
    );

    return [
      BlocBuilder<ProductReceiveBloc, ProductReceiveState>(
        bloc: widget.productReceiveBloc,
        builder: (context, state) {
          return state.maybeWhen(
            initial: (productReceiveDetails, productReceiveForm) {
              if (productReceiveForm!.type ==
                  ProductReceiveType.purchaseOrder) {
                return Column(
                  children: [
                    FDropDownSearchPurchaseOrderDetail(
                      onChanged: (value) {
                        if (value != null) {
                          _product = value.product;
                          _unit = value.unitConvert;
                          _productionOrder = value.productionOrder;
                          _purchaseOrderDetail = value;
                          _batchController.text = '';
                          _batchExpired = null;
                          setState(() {});
                        }
                      },
                    ),
                    const Gap(12),
                    RowFields(
                      children: [
                        TileDataVertical(
                          label: 'batch_no'.tr(),
                          child: Text(
                            _purchaseOrderDetail?.productionOrder?.id ?? '-',
                          ),
                        ),
                        TileDataVertical(
                          label: 'quantity'.tr(),
                          child: Text(
                            _purchaseOrderDetail?.quantityPurchaseOrderConverted
                                    .toString() ??
                                '-',
                          ),
                        ),
                        TileDataVertical(
                          label: 'Unit',
                          child: Text(
                            _unit == null ? '-' : _unit!.id,
                          ),
                        ),
                      ],
                    ),
                    if (_purchaseOrderDetail != null &&
                        (!(_purchaseOrderDetail?.hasProductionOrder ?? false)))
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: RowFields(
                          children: [
                            FTextFormField(
                              labelText: 'batch_no'.tr(),
                              controller: _batchController,
                              validator: requiredValidator.call,
                              maxLength: 50,
                            ),
                            FieldDatePicker(
                              labelText: 'expired_date'.tr(),
                              controller: _batchExpiredController,
                              minDate: DateTime.now(),
                              validator: requiredObjectValidator.call,
                              onChanged: (value) => _batchExpired = value,
                            ),
                          ],
                        ),
                      ),
                    const Divider(),
                  ],
                );
              } else if (productReceiveForm.type ==
                  ProductReceiveType.packing) {
                return RowFields(
                  children: [
                    FDropDownSearchProduct(
                      onChanged: (product) {
                        if (product != null) {
                          _product = product;
                          _unit = _product!.unitPacking;
                          context.read<ProductionOrderQueryBloc>().add(
                              ProductionOrderQueryEvent.fetch(
                                  product: product));
                          _productionOrder = null;
                          setState(() {});
                        }
                      },
                    ),
                    FDropDownSearchProductionOrder(
                      key: ValueKey(_product),
                      onChanged: (productionOrder) {
                        if (productionOrder != null) {
                          _productionOrder = productionOrder;
                        }
                      },
                    ),
                  ],
                );
              }
              return productBatch;
            },
            orElse: () => productBatch,
          );
        },
      ),
      const SizedBox(height: 24),
      SelectChipField<Warehouse>(
        label: 'Warehouses',
        getLabel: (type) => type.id,
        controller: _warehouseController,
        options: Warehouse.products,
        validator: requiredObjectValidator.call,
        onChanged: (value) {
          setState(() {
            _warehouse = value;
          });
        },
      ),
      const SizedBox(height: 24),
      RowFields(children: [
        _buildQuantity(),
        FDropDownSearchMaterialUnit(
          label: 'Unit',
          enabled: _warehouse == null
              ? false
              : _warehouse != Warehouse.treatment
                  ? false
                  : true,
          initialValue: _unit,
          onChanged: (value) {
            if (value != null) {
              _unit = value;
            }
          },
        ),
      ]),
    ];
  }

  List<Widget> _buildEditFields(BuildContext context) {
    return [_buildQuantity()];
  }

  FTextFormField _buildQuantity() {
    return FTextFormField(
      labelText: 'Quantity',
      controller: _quantityController,
      validator: requiredValidator.call,
      maxLength: 50,
      inputFormatters: [
        ThousandsFormatter(),
      ],
    );
  }
}
