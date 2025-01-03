import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request/product_request_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request_detail.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_detail.dart';
import 'colum_product_stock.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';

class ProductRequestCreateSalesOrderForm extends StatefulWidget {
  const ProductRequestCreateSalesOrderForm({
    required this.bloc,
    required this.onRefresh,
    super.key,
    this.productRequest,
    this.productRequestDetail,
  });
  final ProductRequestFormPurchaseOrder? productRequest;
  final void Function() onRefresh;
  final List<ProductRequestDetail>? productRequestDetail;
  final ProductRequestBloc bloc;

  @override
  State<ProductRequestCreateSalesOrderForm> createState() =>
      _ProductRequestCreateSalesOrderFormState();

  static Route<bool?> route({
    required ProductRequestBloc bloc,
    required void Function() onRefresh,
    ProductRequestFormPurchaseOrder? productRequest,
    List<ProductRequestDetail>? productRequestDetail,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductRequestBloc()
              ..add(ProductRequestEvent.initialize(productRequest!)),
          ),
        ],
        child: ProductRequestCreateSalesOrderForm(
          productRequest: productRequest,
          productRequestDetail: productRequestDetail,
          bloc: bloc,
          onRefresh: onRefresh,
        ),
      ),
    );
  }
}

class _ProductRequestCreateSalesOrderFormState
    extends State<ProductRequestCreateSalesOrderForm> {
  final _formKey = GlobalKey<FormState>();
  late List<ProductRequestDetail>? _products;
  final _salesOrders = <int, SalesOrderDetail>{};
  final _listController = <TextEditingController>[];
  late ProductRequest setProductRequest;
  Map<int, int> _productStock = {};
  Map<int, int> _quantityRemaining = {};
  Map<String, DateTime?> _expirationDate = {};
  Map<String, int> _productNameIndex = {};

  void initState() {
    super.initState();
    for (final detailProduct in widget.productRequestDetail!) {
      late String text;
      text = detailProduct.quantity!.toString();
      text = 0.toString();
      _listController.add(TextEditingController(text: text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductRequestBloc, ProductRequestState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (message) {
            Toast(context).dataChanged(DataAction.create, Entity.salesOrder);
            showDialog<bool?>(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                const action = DataAction.create;
                return CardSuccessInfo(
                  isProgress: false,
                  action: action,
                  data: Entity.salesOrder,
                  label: message,
                );
              },
            ).then((success) {
              Navigator.pop(context, true);
              widget.onRefresh();
            });
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          formKey: _formKey,
          action: DataAction.create,
          entity: Entity.salesOrder,
          size: SingleFormPanelSize.large,
          actions: [
            _buildButtonSubmit(),
          ],
          children: [
            BlocBuilder<ProductRequestBloc, ProductRequestState>(
              builder: (context, state) {
                state.maybeWhen(
                  initial: (productRequestDetails, _) =>
                      _products = productRequestDetails,
                  orElse: () => const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                );
                if (_products == null) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    _buildTable(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTable() {
    return YuhuTable<ProductRequestDetail>(
      width: 850,
      rowHeight: 80,
      bodyHeight: 450,
      columns: [
        TableColumn(
          title: 'product'.tr(),
          builder: (productRequestDetail, index) {
            final productName = productRequestDetail.product!.name;
            final isProduct = productName != '';
            _productNameIndex[productName] = index;
            return Text(
              isProduct ? productName : '',
            );
          },
        ),
        TableColumn(
          title: 'quantity_purchase_order'.tr(),
          width: 190,
          builder: (productRequestDetail, _) {
            final isQtyPurchaseOrder = productRequestDetail.quantity != 0;
            return Text(
              isQtyPurchaseOrder
                  ? productRequestDetail.quantity.toString()
                  : 0.toString(),
            );
          },
        ),
        TableColumn(
          width: 170,
          title: 'Quantity Remaining',
          builder: (productRequestDetail, index) {
            final isQtyRemaining = productRequestDetail.quantityRemaining != 0;
            _quantityRemaining[index] =
                productRequestDetail.quantityRemaining ?? 0;
            return Text(
              isQtyRemaining
                  ? productRequestDetail.quantityRemaining.toString()
                  : 0.toString(),
            );
          },
        ),
        TableColumn(
          width: 170,
          title: 'quantity_stock'.tr(),
          builder: (productRequestDetail, index) {
            return ProductRequestColumProductStock.prepare(
              product: productRequestDetail.product,
              unitId: productRequestDetail.unit,
              endingBalance: 1,
              warehouse: [
                Warehouse.finishedProduct,
                Warehouse.alkes,
              ],
              onQuantityChanged: (quantity, expiredDate) {
                _productStock[index] = quantity;
                _expirationDate[productRequestDetail.product!.name] =
                    expiredDate;
              },
            );
          },
        ),
        TableColumn(
          width: 200,
          title: 'Quantity Sales Order',
          builder: (productRequestDetail, index) {
            if (productRequestDetail.quantityRemaining == 0) {
              return FTextFormField(
                controller: _listController[index],
                maxLength: 6,
                enabled: false,
                onChanged: (value) {
                  final quantity = stringToInt(value);
                  if (quantity > 0) {
                    _salesOrders[index] = SalesOrderDetail(
                      discountValue: 0,
                      id: 0,
                      priceAfterDiscount: 0,
                      productId: productRequestDetail.product!.id,
                      quantity: int.parse('0'),
                      qtyDelivery: int.parse('0'),
                      unitId: productRequestDetail.unit,
                      discountPercent: 0,
                      warehouse: '',
                      salesOrderId: '',
                      batchNoId: '',
                      subtotal: 0,
                      price: 0,
                      batchNo: ProductionOrder.empty(),
                      unit: MaterialUnit.empty(),
                    );
                  } else {
                    _salesOrders.remove(index);
                  }
                  setState(() {});
                },
              );
            } else {
              return FTextFormField(
                controller: _listController[index],
                maxLength: 6,
                onChanged: (value) {
                  final quantity = stringToInt(value);
                  if (quantity > 0) {
                    _salesOrders[index] = SalesOrderDetail(
                      priceAfterDiscount: 0,
                      discountValue: 0,
                      id: 0,
                      productId: productRequestDetail.product!.id,
                      quantity: int.parse(
                        _listController[index].text,
                      ),
                      qtyDelivery: int.parse(
                        _listController[index].text,
                      ),
                      unitId: productRequestDetail.unit,
                      discountPercent: 0,
                      warehouse: '',
                      salesOrderId: '',
                      batchNoId: '',
                      subtotal: 0,
                      price: 0,
                      batchNo: ProductionOrder.empty(),
                      unit: MaterialUnit.empty(),
                    );
                  } else {
                    _salesOrders.remove(index);
                  }
                  setState(() {});
                },
              );
            }
          },
        ),
      ],
      data: _products!,
    );
  }

  Widget _buildButtonSubmit() {
    return BlocBuilder<ProductRequestBloc, ProductRequestState>(
      builder: (context, state) {
        return Button(
          permission: null,
          isInProgress: state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          ),
          onPressed: () => _submit(context),
          action: DataAction.create,
        );
      },
    );
  }

  bool _checkExpirationDateIsNoNull() {
    for (final entry in _productNameIndex.entries) {
      final productIndex = entry.value;
      final productName = entry.key;

      if (_expirationDate[productName] == null &&
          (_salesOrders[productIndex]?.quantity ?? 0) > 0) {
        Toast(context).fail('Expired date at row ${productIndex + 1} is empty');
        return false;
      }
    }

    return true;
  }

  Future<bool?> _showConfirmationDialogExpired(
      Map<String, DateTime> date) async {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CardConfirmation(
          danger: true,
          isProgress: false,
          action: DataAction.create,
          data: Entity.productRequest,
          label:
              'with ${date.entries.map((e) => '${e.key} (${e.value.formatMMMyy})').join(', ')}',
          onConfirm: () {
            Navigator.pop(context, true);
          },
        );
      },
    );
  }

  Future<bool> _alertNearExpiryDate() async {
    final Map<String, DateTime> expirationDate = {};
    final keys = _expirationDate.keys;

    for (int i = 0; i < keys.length; i++) {
      final productName = keys.toList()[i];
      if (_expirationDate[productName] != null) {
        final isExpiredNear =
            _expirationDate[productName]!.difference(DateTime.now()).inDays <=
                365 * 10;
        final quantity =
            _salesOrders[_productNameIndex[productName]]?.quantity ?? 0;
        if (quantity > 0 && isExpiredNear) {
          expirationDate[keys.toList()[i]] = _expirationDate[keys.toList()[i]]!;
        }
      }
    }

    if (expirationDate.isNotEmpty) {
      return (await _showConfirmationDialogExpired(expirationDate)) ?? false;
    }
    return true;
  }

  void _submit(BuildContext context) async {
    if (!_checkExpirationDateIsNoNull()) {
      return;
    }

    final nearExpiryDate = await _alertNearExpiryDate();
    if (!nearExpiryDate) {
      return;
    }

    if (_salesOrders.isNotEmpty) {
      for (int i = 0; i < _salesOrders.length; i++) {
        final orderQuantity = _salesOrders[i]?.quantity ?? 0;
        final productStockQuantity =
            _productStock.containsKey(i) ? _productStock[i]! : 0;
        final remainingQuantity =
            _quantityRemaining.containsKey(i) ? _quantityRemaining[i]! : 0;

        if (orderQuantity > productStockQuantity) {
          Toast(context).fail(
              'Quantity order is greater than product stock at row ${i + 1}');
          return;
        }

        if (orderQuantity > remainingQuantity) {
          Toast(context).fail(
              'Quantity order is greater than remaining quantity at row ${i + 1}');
          return;
        }
      }

      context.read<ProductRequestBloc>().add(
            ProductRequestEvent.submitSalesOrder(
              salesOrderDetail: _salesOrders.values.toList(),
              productRequest: ProductRequest(
                purchaseOrderDistributorDate: DateTime.now(),
                purchaseOrderDistributorDateReceive: DateTime.now(),
                createdById: 0,
                createdAt: DateTime.now(),
                updatedById: 0,
                updatedAt: DateTime.now(),
                subtotal: 0,
                subtotalAfterDiscount: 0,
                total: 0,
                exchangeValue: 0,
                confirmBy: 0,
                confirmAt: DateTime.now(),
                id: widget.productRequest!.id!,
                rate: 0,
                termOfPayment: 0,
                typeProduct: '',
                purchaseOrderDistributor: '',
                discountPercent: widget.productRequest!.specialDiscountPercent!,
                discountValue: 0,
                ppnPercent: widget.productRequest!.ppnPercent!,
                ppnValue: 0,
                status: ProductRequestStatus.confirm,
                pph22Percent: widget.productRequest!.pph22Percent!,
                pph22Value: 0,
                description: widget.productRequest!.note!,
                transactionType: widget.productRequest!.transactionType!,
                currency: widget.productRequest!.currency!,
                customer: widget.productRequest!.customer!,
                deliveryAddress: widget.productRequest!.address!,
                orderType: widget.productRequest!.orderType!,
                department: widget.productRequest!.department!,
                bankFee: widget.productRequest!.bankFee!,
              ),
            ),
          );
    } else {
      Toast(context).fail('Please complete the required data');
    }
  }
}
