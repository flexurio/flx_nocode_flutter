import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request/product_request_bloc.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import '../../product_request/widget/add_product_button.dart';
import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request_detail.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import '../../product_request/widget/create_button_sales_order.dart';
import '../../product_request/widget/delete_button_detail_product_request.dart';
import '../../product_request/widget/edit_button.dart';
import '../../product_request/widget/edit_button_product.dart';
import '../../product_request_view/widget/product_request_detail_table.dart';
import '../../product_request_view/widget/product_request_information.dart';
import 'colum_product_stock.dart';
import 'total_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductRequestCreateConfirmForm extends StatefulWidget {
  const ProductRequestCreateConfirmForm._({
    this.onPrevious,
    this.productRequest,
  });

  final void Function()? onPrevious;
  final ProductRequest? productRequest;

  static Widget prepare({
    ProductRequest? productRequest,
    void Function()? onPrevious,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductRequestBloc()
            ..add(
              ProductRequestEvent.initialize(
                ProductRequestFormPurchaseOrder(
                  purchaseOrderDate:
                      productRequest!.purchaseOrderDistributorDate ??
                          DateTime(0),
                  receiveDate:
                      productRequest.purchaseOrderDistributorDateReceive ??
                          DateTime(0),
                  rate: productRequest.rate,
                  termOfPayment: productRequest.termOfPayment,
                  productType: productRequest.typeProduct,
                  purchaseOrderDistributor:
                      productRequest.purchaseOrderDistributor,
                  specialDiscountPercent: productRequest.discountPercent,
                  ppnPercent: productRequest.ppnPercent,
                  pph22Percent: productRequest.pph22Percent,
                  department: productRequest.department,
                  customer: productRequest.customer,
                  transactionType: productRequest.transactionType,
                  orderType: productRequest.orderType,
                  currency: productRequest.currency,
                  note: productRequest.description,
                  address: productRequest.deliveryAddress,
                  priceDiscountPercent: 0,
                  bankFee: productRequest.bankFee,
                  id: productRequest.id,
                  status: productRequest.status,
                ),
              ),
            ),
        ),
      ],
      child: ProductRequestCreateConfirmForm._(
        productRequest: productRequest,
        onPrevious: onPrevious,
      ),
    );
  }

  @override
  State<ProductRequestCreateConfirmForm> createState() =>
      _ProductRequestCreateConfirmFormState();
}

class _ProductRequestCreateConfirmFormState
    extends State<ProductRequestCreateConfirmForm> {
  ProductRequestFormPurchaseOrder? _productRequestFormPurchaseOrder;
  List<ProductRequestDetail>? _products;
  final _formKey = GlobalKey<FormState>();
  late String? _purchaseOrderDistributor;
  late Customer? _customer;
  late Department? _department;
  late Customer? _deliveryAddress;
  late int? _termOfPayment;
  late TransactionType? _transactionType;
  late TransactionType? _orderType;
  late String? _typeProduct;
  late Currency? _currency;
  late double? _rate;
  late double? _ppn;
  late double? _pph;
  late String? _note;
  late double? _bankFee;
  late double? _subTotalAfterDiscount;
  late int isCreateSo = 0;

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
              _transactionType =
                  productRequestFormPurchaseOrder.transactionType;
              _orderType = productRequestFormPurchaseOrder.orderType;
              _typeProduct = productRequestFormPurchaseOrder.productType;
              _currency = productRequestFormPurchaseOrder.currency;
              _rate = productRequestFormPurchaseOrder.rate;
              _ppn = productRequestFormPurchaseOrder.ppnPercent;
              _pph = productRequestFormPurchaseOrder.pph22Percent;
              _note = productRequestFormPurchaseOrder.note;
              _bankFee = productRequestFormPurchaseOrder.bankFee;
              _subTotalAfterDiscount =
                  productRequestFormPurchaseOrder.subTotalAfterDiscount;
            }
            _products = products;
            isCreateSo = _products
                    ?.where((p) =>
                        p.quantityRemaining != null && p.quantityRemaining! > 0)
                    .length ??
                0;
          },
          orElse: () {},
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

        final bloc = context.read<ProductRequestBloc>();

        final status = _productRequestFormPurchaseOrder?.status;
        final isStatusConfirm = status?.isConfirm ?? false;
        final isStatusPending = status?.isPending ?? false;
        final isStatusInput = status?.isInput ?? false;

        final actions = <Widget>[];

        if (_products!.isNotEmpty) {
          if (_productRequestFormPurchaseOrder == null) {
            actions.addAll([
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
            ]);
          } else if (isStatusInput) {
            actions.addAll([
              Button(
                permission: null,
                isInProgress: isLoading,
                action: DataAction.confirm,
                onPressed: () {
                  _confirm(context, bloc);
                },
              ),
            ]);
          } else if (isStatusConfirm || isStatusPending) {
            if (isCreateSo > 0) {
              actions.addAll([
                ProductRequestCreateSalesOrderButton(
                  productRequest: _productRequestFormPurchaseOrder,
                  productRequestDetail: _products,
                  bloc: bloc,
                  onRefresh: () => _refreshData(bloc),
                ),
              ]);
            }
          } else if (isStatusPending) {
            actions.addAll([
              Button(
                permission: null,
                isInProgress: isLoading,
                action: DataAction.cancel,
                onPressed: () {
                  _cancel(context, bloc);
                },
              ),
            ]);
          }
        } else {
          actions.clear();
        }

        return FormAction(
          actions: actions,
          key: _formKey,
          children: [
            if (_productRequestFormPurchaseOrder != null && isStatusInput)
              Align(
                alignment: Alignment.centerRight,
                child: ProductRequestEditButton(
                  productRequest: _productRequestFormPurchaseOrder!,
                  bloc: bloc,
                ),
              ),
            ProductRequestInformation(
              bankFee: _bankFee!,
              bloc: bloc,
              currencyId: _currency!.id,
              customerName: _customer!.name,
              customerId: _customer!.id,
              deliveryAddressAddress: _deliveryAddress!.address,
              deliveryAddressAddressId: _deliveryAddress!.id,
              departmentName: _department!.name,
              note: _note!,
              orderTypeName: _orderType!.name,
              pph: _pph!,
              ppn: _ppn!,
              productRequestFormPurchaseOrder: _productRequestFormPurchaseOrder,
              purchaseOrderDistributor: _purchaseOrderDistributor!,
              rate: _rate!,
              subTotalAfterDiscount: _subTotalAfterDiscount!,
              termOfPayment: _termOfPayment!,
              transactionTypeName: _transactionType!.name,
              typeProduct: _typeProduct!,
            ),
            const Gap(40),
            if (_productRequestFormPurchaseOrder != null)
              if (_productRequestFormPurchaseOrder!.status ==
                      ProductRequestStatus.input ||
                  _productRequestFormPurchaseOrder!.status ==
                      ProductRequestStatus.confirm)
                Column(
                  children: [
                    ProductRequestAddDetailButton.prepare(
                      productRequest: _productRequestFormPurchaseOrder!,
                      bloc: bloc,
                      initialProducts: _products,
                    ).pullRight(),
                    const Gap(20),
                  ],
                ),
            ProductRequestDetailTable(
              data: _products!,
              bloc: bloc,
              productRequestFormPurchaseOrder: _productRequestFormPurchaseOrder,
            ),
            const Gap(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: ProductRequestTotalDetails(
                    products: _products!,
                    productRequestHeader: _productRequestFormPurchaseOrder!,
                    isLocal: false,
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

  void _refreshData(ProductRequestBloc bloc) {
    bloc.add(
      ProductRequestEvent.initialize(
        _productRequestFormPurchaseOrder!,
      ),
    );
  }

//di comment sementara
  void _confirm(BuildContext context, ProductRequestBloc bloc) {
    const action = DataAction.confirm;
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
                bloc.add(
                  ProductRequestEvent.initialize(
                    _productRequestFormPurchaseOrder!,
                  ),
                );
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
                    ProductRequestEvent.confirm(
                      productRequest: _productRequestFormPurchaseOrder!,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  void _cancel(BuildContext context, ProductRequestBloc bloc) {
    const action = DataAction.cancelConfirm;
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
                bloc.add(
                  ProductRequestEvent.initialize(
                    _productRequestFormPurchaseOrder!,
                  ),
                );
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
                    ProductRequestEvent.cancelConfirm(
                      productRequest: _productRequestFormPurchaseOrder!,
                    ),
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
