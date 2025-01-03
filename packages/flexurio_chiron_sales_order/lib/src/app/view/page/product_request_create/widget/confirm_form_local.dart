import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request/product_request_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request_detail.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'colum_product_stock.dart';
import 'total_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductRequestCreateConfirmFormLocal extends StatefulWidget {
  const ProductRequestCreateConfirmFormLocal({
    super.key,
    this.onPrevious,
  });

  final void Function()? onPrevious;

  @override
  State<ProductRequestCreateConfirmFormLocal> createState() =>
      _ProductRequestCreateConfirmFormLocalState();
}

class _ProductRequestCreateConfirmFormLocalState
    extends State<ProductRequestCreateConfirmFormLocal> {
  ProductRequestFormPurchaseOrder? _productRequestFormPurchaseOrder;
  List<ProductRequestDetail>? _products;
  final _formKey = GlobalKey<FormState>();
  late String? _purchaseOrderDistributor;
  late Customer? _customer;
  late Department? _department;
  late Customer? _deliveryAddress;
  late int? _termOfPayment;
  late double? _priceDiscount;
  late TransactionType? _transactionType;
  late TransactionType? _orderType;
  late String? _typeProduct;
  late double? _specialDiscount;
  late Currency? _currency;
  late double? _rate;
  late double? _ppn;
  late double? _pph;
  late String? _note;
  late double? _bankFee;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductRequestBloc, ProductRequestState>(
      builder: (context, state) {
        state.maybeWhen(
          initial: (products, productRequestFormPurchaseOrder) {
            if (productRequestFormPurchaseOrder != null) {
              _productRequestFormPurchaseOrder =
                  productRequestFormPurchaseOrder;
              _purchaseOrderDistributor =
                  productRequestFormPurchaseOrder.purchaseOrderDistributor;
              _customer = productRequestFormPurchaseOrder.customer;
              _department = productRequestFormPurchaseOrder.department;
              _deliveryAddress = productRequestFormPurchaseOrder.address;
              _termOfPayment = productRequestFormPurchaseOrder.termOfPayment;
              _priceDiscount =
                  productRequestFormPurchaseOrder.priceDiscountPercent;
              _transactionType =
                  productRequestFormPurchaseOrder.transactionType;
              _orderType = productRequestFormPurchaseOrder.orderType;
              _typeProduct = productRequestFormPurchaseOrder.productType;
              _specialDiscount =
                  productRequestFormPurchaseOrder.specialDiscountPercent;
              _currency = productRequestFormPurchaseOrder.currency;
              _rate = productRequestFormPurchaseOrder.rate;
              _ppn = productRequestFormPurchaseOrder.ppnPercent;
              _pph = productRequestFormPurchaseOrder.pph22Percent;
              _note = productRequestFormPurchaseOrder.note;
              _bankFee = productRequestFormPurchaseOrder.bankFee;
            }
            _products = products;
          },
          orElse: () => const Center(
            child: CupertinoActivityIndicator(),
          ),
        );

        if (_productRequestFormPurchaseOrder == null || _products == null) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        final actions = <Widget>[
          Button(
            permission: null,
            isSecondary: true,
            action: DataAction.back,
            onPressed: () {
              widget.onPrevious!();
            },
          ),
          const SizedBox(width: 12),
          Button(
            permission: null,
            isInProgress: isLoading,
            action: DataAction.finish,
            onPressed: () {
              _submit(context);
            },
          ),
        ];

        return FormAction(
          actions: actions,
          key: _formKey,
          children: [
            RowFields(
              children: [
                TileDataVertical(
                  label: 'Purchase Order Distributor',
                  child: Text(_purchaseOrderDistributor!),
                ),
                TileDataVertical(
                  label: 'Department',
                  child: Text(_department!.name),
                ),
              ],
            ),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'Customer',
                  child: Text(_customer!.name),
                ),
                TileDataVertical(
                  label: 'Delivery Address',
                  child: Text(_deliveryAddress!.address),
                ),
              ],
            ),
            const Gap(5),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'Term of Payment',
                  child: Text(_termOfPayment!.toString()),
                ),
                TileDataVertical(
                  label: 'Order Type',
                  child: Text(_orderType!.name),
                ),
              ],
            ),
            const Gap(5),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'Transaction Type',
                  child: Text(_transactionType!.name),
                ),
                TileDataVertical(
                  label: 'Special Discount',
                  child: Text('${_specialDiscount!} %'),
                ),
              ],
            ),
            const Gap(5),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'Product Type',
                  child: Text(_typeProduct!),
                ),
                TileDataVertical(
                  label: 'Rate',
                  child: Text(_rate!.toString()),
                ),
              ],
            ),
            const Gap(5),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'currency'.tr(),
                  child: Text(_currency!.id),
                ),
                TileDataVertical(
                  label: 'Bank Fee',
                  child: Text(_bankFee!.idr),
                ),
              ],
            ),
            const Gap(5),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'PPN',
                  child: Text('${_ppn!} %'),
                ),
                TileDataVertical(
                  label: 'PPh',
                  child: Text('${_pph!} %'),
                ),
              ],
            ),
            const Gap(10),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'Note',
                  child: Text(_note!),
                ),
              ],
            ),
            const Gap(40),
            SimpleTable<ProductRequestDetail>(
              width: 1400,
              columns: [
                TableColumnX(
                  title: 'Product',
                  width: 300,
                  builder: (productRequestDetail, _) {
                    final isProduct = productRequestDetail.product!.name != '';
                    return Text(
                      isProduct ? productRequestDetail.product!.name : '',
                    );
                  },
                ),
                TableColumnX(
                  title: 'Quantity Purchase Order',
                  width: 200,
                  builder: (productRequestDetail, _) {
                    final isQtyPurchaseOrder =
                        productRequestDetail.quantity != 0;
                    return Text(
                      isQtyPurchaseOrder
                          ? productRequestDetail.quantity.toString()
                          : 0.toString(),
                    );
                  },
                ),
                TableColumnX(
                  title: 'Quantity Stock',
                  width: 150,
                  builder: (productRequestDetail, _) {
                    return ProductRequestColumProductStock.prepare(
                      product: productRequestDetail.product,
                      endingBalance: 1,
                      warehouse: [
                        Warehouse.finishedProduct,
                        Warehouse.alkes,
                      ],
                    );
                  },
                ),
                TableColumnX(
                  title: 'Unit',
                  width: 80,
                  builder: (productRequestDetail, _) {
                    return Text(productRequestDetail.unit);
                  },
                ),
                TableColumnX(
                  title: 'price'.tr(),
                  width: 200,
                  alignment: Alignment.centerRight,
                  builder: (productRequestDetail, _) {
                    return Text(productRequestDetail.price!.idr);
                  },
                ),
                TableColumnX(
                  title: 'Price Discount',
                  width: 150,
                  alignment: Alignment.centerRight,
                  builder: (productRequestDetail, _) {
                    return Text('${_priceDiscount!} %');
                  },
                ),
                TableColumnX(
                  title: 'subtotal'.tr(),
                  width: 200,
                  alignment: Alignment.centerRight,
                  builder: (productRequestDetail, index) {
                    return Text(productRequestDetail.subtotal!.idr);
                  },
                ),
              ],
              data: _products!,
            ),
            const Gap(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: ProductRequestTotalDetails(
                    products: _products!,
                    productRequestHeader: _productRequestFormPurchaseOrder!,
                    isLocal: true,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _submit(BuildContext context) {
    final bloc = context.read<ProductRequestBloc>();
    const action = DataAction.create;
    showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<ProductRequestBloc, ProductRequestState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: (_) {
                Toast(context).dataChanged(
                  action,
                  Entity.productRequest,
                );
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<ProductRequestBloc, ProductRequestState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.productRequest,
                label:
                    _productRequestFormPurchaseOrder!.purchaseOrderDistributor,
                onConfirm: () {
                  bloc.add(
                    const ProductRequestEvent.submit(),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
