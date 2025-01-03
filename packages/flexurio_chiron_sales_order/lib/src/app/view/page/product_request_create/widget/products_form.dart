import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request/product_request_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import '../../product_request/widget/create_button_product.dart';
import '../../product_request/widget/delete_button_product_local.dart';
import 'colum_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductRequestCreateProductForm extends StatefulWidget {
  const ProductRequestCreateProductForm({
    required this.onNext,
    required this.onPrevious,
    super.key,
    this.productRequest,
  });

  final void Function() onNext;
  final void Function() onPrevious;
  final ProductRequest? productRequest;

  @override
  State<ProductRequestCreateProductForm> createState() =>
      _ProductRequestCreateProductFormState();
}

class _ProductRequestCreateProductFormState
    extends State<ProductRequestCreateProductForm> {
  final _formKey = GlobalKey<FormState>();
  late List<ProductRequestDetail>? _products;
  ProductRequestFormPurchaseOrder? _formPurchaseOrder;

  void _submit(BuildContext context) {
    if (_products!.isNotEmpty) {
      widget.onNext();
    } else {
      Toast(context).fail('Please input at least one product');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductRequestBloc, ProductRequestState>(
      builder: (context, state) {
        state.maybeWhen(
          initial: (productRequestDetails, productRequestFormPurchaseOrder) => {
            _products = productRequestDetails,
            _formPurchaseOrder = productRequestFormPurchaseOrder,
          },
          orElse: () => const Center(
            child: CupertinoActivityIndicator(),
          ),
        );
        if (_products == null) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        return FormAction(
          formKey: _formKey,
          actions: [
            Button(
              permission: null,
              isSecondary: true,
              action: DataAction.back,
              onPressed: () {
                widget.onPrevious();
              },
            ),
            const SizedBox(width: 12),
            Button(
              permission: null,
              action: DataAction.next,
              onPressed: () => _submit(context),
            ),
          ],
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (_formPurchaseOrder != null)
                      ProductRequestCreateProductButton(
                        productRequestBloc: context.read<ProductRequestBloc>(),
                        productRequestFormPurchaseOrder: _formPurchaseOrder!,
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                SimpleTable<ProductRequestDetail>(
                  width: 1500,
                  columns: [
                    TableColumnX(
                      title: 'product'.tr(),
                      builder: (productRequestDetail, _) {
                        final isProduct =
                            productRequestDetail.product!.name != '';
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
                      builder: (productRequestDetail, index) {
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
                      alignment: Alignment.centerRight,
                      builder: (productRequestDetail, _) {
                        return Text(productRequestDetail.unit);
                      },
                    ),
                    TableColumnX(
                      title: 'Price',
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
                        return Text(
                          productRequestDetail.discountPercent.toString(),
                        );
                      },
                    ),
                    TableColumnX(
                      title: 'Sub Total',
                      width: 200,
                      alignment: Alignment.centerRight,
                      builder: (productRequestDetail, index) {
                        return Text(
                          productRequestDetail.subtotal!.idr,
                        );
                      },
                    ),
                    TableColumnX(
                      width: 80,
                      title: 'Action',
                      builder: (productRequestDetail, index) {
                        return Row(
                          children: [
                            ProductRequestDetailFromLocalDeleteButton(
                              detail: productRequestDetail,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                  data: _products!,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
