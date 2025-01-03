import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_detail_query/sales_order_detail_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_unit_query/material_unit_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return/product_return_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/sales_order_detail_filter_by_batch_query/sales_order_detail_filter_by_batch_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/sales_order_detail_filter_by_product_query/sales_order_detail_filter_by_product_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_detail.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class ProductReturnDetailCreate extends StatefulWidget {
  const ProductReturnDetailCreate({
    required this.productReturnBloc,
    super.key,
  });

  final ProductReturnBloc productReturnBloc;

  static Widget prepare({
    required ProductReturnBloc productReturnBloc,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(
              ProductQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => ProductionOrderQueryBloc(isExternal: false)
            ..add(
              ProductionOrderQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => MaterialUnitQueryBloc()
            ..add(MaterialUnitQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
        BlocProvider(
          create: (context) => SalesOrderDetailQueryBloc(),
        ),
        BlocProvider(
          create: (context) => SalesOrderDetailFilterByProductQueryBloc(),
        ),
        BlocProvider(
          create: (context) => SalesOrderDetailFilterByBatchQueryBloc(),
        ),
      ],
      child: ProductReturnDetailCreate(
        productReturnBloc: productReturnBloc,
      ),
    );
  }

  @override
  State<ProductReturnDetailCreate> createState() =>
      _ProductReturnDetailCreateState();
}

class _ProductReturnDetailCreateState extends State<ProductReturnDetailCreate> {
  final _formKey = GlobalKey<FormState>();
  final _expiredController = TextEditingController();
  final _qtyRemainingController = TextEditingController();
  final _unitController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();
  final _totalController = TextEditingController();
  final _percentDiscountController = TextEditingController();

  late SalesOrder _salesOrder;
  late Product _product;
  late ProductionOrder _order;
  late MaterialUnit _unit;
  double totalPrice() {
    return stringDecimalToDouble(_priceController.text) *
        stringToInt(_quantityController.text);
  }

  String? qtyValidator(String? value) {
    final qty = int.tryParse(_quantityController.text) ?? 0;
    final qtyRemaining = int.tryParse(_qtyRemainingController.text) ?? 0;
    if (qty > qtyRemaining) {
      return 'Quantity cannot exeed Quantity remaining';
    }
    return null;
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final productReturnDetail = ProductReturnDetail.empty().copyWith(
        product: _product,
        deliveryOrderId: _salesOrder.deliveryOrderId,
        batchNo: _order,
        unit: _unit,
        productPrice: stringDecimalToDouble(_priceController.text),
        quantity: stringToInt(_quantityController.text),
        quantityRemaining: stringToInt(_qtyRemainingController.text),
        totalProductPrice: stringDecimalToDouble(_totalController.text),
        expirationDate: _order.expirationDate,
      );
      Navigator.pop(context, productReturnDetail);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductReturnBloc, ProductReturnState>(
      bloc: widget.productReturnBloc,
      builder: (context, state) {
        state.maybeWhen(
          orElse: () => null,
          initial: (_, customerForm) {
            context.read<SalesOrderDetailQueryBloc>().add(
                SalesOrderDetailQueryEvent.fetch(customerForm!.salesOrder!));
            _salesOrder = customerForm.salesOrder!;
          },
        );
        return SingleFormPanel(
          formKey: _formKey,
          visibleBackButton: false,
          action: DataAction.add,
          entity: Entity.productReturnDetail,
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
            Button(
              permission: null,
              action: DataAction.add,
              isInProgress: state.maybeWhen(
                orElse: () => false,
                loading: () => true,
              ),
              onPressed: () {
                _submit(context);
              },
            ),
          ],
          children: [
            FTextFormField(
              labelText: 'delivery_order'.tr(),
              controller:
                  TextEditingController(text: _salesOrder.deliveryOrderId),
              enabled: false,
            ),
            const Gap(24),
            BlocBuilder<SalesOrderDetailQueryBloc, SalesOrderDetailQueryState>(
              builder: (context, state) {
                return FDropDownSearch<Product>(
                  labelText: 'product'.tr(),
                  itemAsString: (product) => '${product.id} - ${product.name}',
                  items: state.maybeWhen(
                    orElse: () => [],
                    loaded: (sales) {
                      if (sales.isNotEmpty) {
                        return sales.map((e) => e.product!).toSet().toList();
                      } else {
                        return [];
                      }
                    },
                  ),
                  onChanged: (product) {
                    if (product != null) {
                      _product = product;
                      context
                          .read<SalesOrderDetailFilterByProductQueryBloc>()
                          .add(SalesOrderDetailFilterByProductQueryEvent.fetch(
                              _salesOrder, _product.id));
                    }
                    setState(() {});
                  },
                );
              },
            ),
            const Gap(24),
            BlocBuilder<SalesOrderDetailFilterByProductQueryBloc,
                SalesOrderDetailFilterByProductQueryState>(
              builder: (context, state) {
                return FDropDownSearch<ProductionOrder>(
                  labelText: 'batch_no'.tr(),
                  itemAsString: (order) => order.id,
                  items: state.maybeWhen(
                    orElse: () => [],
                    loaded: (sales) {
                      return sales.map((e) => e.batchNo).toSet().toList();
                    },
                  ),
                  onChanged: (order) {
                    if (order != null) {
                      _order = order;
                      _expiredController.text = order.expirationDate.yMMMMd;
                      context
                          .read<SalesOrderDetailFilterByBatchQueryBloc>()
                          .add(SalesOrderDetailFilterByBatchQueryEvent.fetch(
                              _salesOrder, _order.id));
                    }
                  },
                );
              },
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'expired_date'.tr(),
              controller: _expiredController,
              enabled: false,
            ),
            const Gap(24),
            BlocBuilder<SalesOrderDetailFilterByBatchQueryBloc,
                SalesOrderDetailFilterByBatchQueryState>(
              builder: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  loaded: (sales) {
                    if (sales.isNotEmpty) {
                      _unit = sales.first.unit;
                      _priceController.text = sales.first.price!.format();
                      _unitController.text = sales.first.unitId;
                      _qtyRemainingController.text =
                          sales.first.quantity.toString();
                    }
                  },
                );
                return RowFields(
                  children: [
                    FTextFormField(
                      labelText: 'quantity_remaining'.tr(),
                      controller: _qtyRemainingController,
                      enabled: false,
                    ),
                    FTextFormField(
                      labelText: 'unit'.tr(),
                      controller: _unitController,
                      enabled: false,
                    ),
                  ],
                );
              },
            ),
            const Gap(24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'quantity'.tr(),
                  controller: _quantityController,
                  validator: qtyValidator,
                  inputFormatters: [
                    ThousandsFormatter(),
                  ],
                  onChanged: (qty) {
                    _totalController.text = totalPrice().format();
                  },
                ),
                BlocBuilder<SalesOrderDetailQueryBloc,
                    SalesOrderDetailQueryState>(
                  builder: (context, state) {
                    return FTextFormField(
                      labelText: 'unit'.tr(),
                      controller: _unitController,
                      enabled: false,
                    );
                  },
                ),
              ],
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'price'.tr(),
              controller: _priceController,
              enabled: false,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'total'.tr(),
              controller: _totalController,
              enabled: false,
            ),
          ],
        );
      },
    );
  }
}
