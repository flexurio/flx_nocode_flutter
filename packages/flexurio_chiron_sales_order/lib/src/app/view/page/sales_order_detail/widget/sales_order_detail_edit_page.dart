import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_detail/sales_order_detail_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_query/sales_order_query_bloc.dart';
import 'dropdown_batch.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_detail.dart';
import 'sales_order_detail_delete_button.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class SalesOrderDetailEditPage extends StatefulWidget {
  const SalesOrderDetailEditPage({
    required this.bloc,
    required this.salesOrder,
    required this.salesOrderDetailBloc,
    required this.salesOrderDetail,
    super.key,
    required this.isExternal,
  });
  final bool isExternal;

  final SalesOrderQueryBloc bloc;
  final SalesOrder salesOrder;
  final SalesOrderDetail salesOrderDetail;
  final SalesOrderDetailBloc salesOrderDetailBloc;

  static Route<bool?> route({
    required SalesOrderQueryBloc bloc,
    required SalesOrder salesOrder,
    required SalesOrderDetailBloc salesOrderDetailBloc,
    required SalesOrderDetail salesOrderDetail,
    required bool isExternal,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SalesOrderDetailBloc()
              ..add(SalesOrderDetailEvent.fetchById(
                  salesOrderDetail: salesOrderDetail)),
          ),
        ],
        child: SalesOrderDetailEditPage(
          bloc: bloc,
          salesOrder: salesOrder,
          salesOrderDetail: salesOrderDetail,
          salesOrderDetailBloc: salesOrderDetailBloc,
          isExternal: isExternal,
        ),
      ),
    );
  }

  @override
  State<SalesOrderDetailEditPage> createState() =>
      _SalesOrderDetailEditPageState();
}

class _SalesOrderDetailEditPageState extends State<SalesOrderDetailEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _qtyController = TextEditingController();
  final _batchNoController = TextEditingController();

  void _submit() {
    if (_qtyController.text != '' && _qtyController.text != '0') {
      context.read<SalesOrderDetailBloc>().add(
            SalesOrderDetailEvent.updateSalesOrderDetail(
              salesOrderDetail: SalesOrderDetail(
                discountValue: 0,
                priceAfterDiscount: 0,
                id: widget.salesOrderDetail.id,
                productId: widget.salesOrderDetail.productId,
                quantity: int.parse(
                  _qtyController.text,
                ),
                qtyDelivery: int.parse(
                  _qtyController.text,
                ),
                unitId: widget.salesOrderDetail.unitId,
                discountPercent: widget.salesOrderDetail.discountPercent,
                warehouse: '',
                salesOrderId: widget.salesOrderDetail.salesOrderId,
                batchNoId: widget.salesOrderDetail.batchNoId,
                subtotal: 0,
                price: 0,
                product: widget.salesOrderDetail.product,
                batchNo: widget.salesOrderDetail.batchNo,
                unit: widget.salesOrderDetail.unit,
              ),
              batchNo: _batchNoController.text,
            ),
          );
    } else {
      Toast(context).fail('Please input quantity sales order');
    }
  }

  @override
  void initState() {
    super.initState();
    _batchNoController.text = widget.salesOrderDetail.batchNo.id;
    context.read<SalesOrderDetailBloc>().add(
          SalesOrderDetailEvent.updateProductStock(
            salesOrderDetail: widget.salesOrderDetail,
            batchNo: _batchNoController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocListener<SalesOrderDetailBloc, SalesOrderDetailState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (isTrue) {
              if (isTrue == true) {
                Toast(context).dataChanged(
                  DataAction.edit,
                  Entity.salesOrderDetail,
                );
                Navigator.pop(context, true);
              }
            },
            error: (error) => Toast(context).fail(error),
            orElse: () {},
          );
        },
        child: BlocBuilder<SalesOrderDetailBloc, SalesOrderDetailState>(
          builder: (context, state) {
            return SingleFormPanel(
              formKey: _formKey,
              action: DataAction.edit,
              entity: Entity.salesOrder,
              size: SingleFormPanelSize.extraLarge,
              actions: [
                Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                  action: DataAction.edit,
                ),
              ],
              children: [
                state.maybeWhen(
                  initial: (history, salesOrderDetails) {
                    return Column(
                      children: [
                        const SizedBox(height: 20),
                        SimpleTable<MapEntry<SalesOrderDetail, ProductStock?>>(
                          width: 1400,
                          rowHeight: 80,
                          columns: [
                            TableColumnX(
                              width: 200,
                              title: 'Product',
                              builder: (salesOrderDetail, _) {
                                final isProduct =
                                    salesOrderDetail.key.product!.name != '';
                                return Text(
                                  isProduct
                                      ? salesOrderDetail.key.product!.name
                                      : '',
                                );
                              },
                            ),
                            TableColumnX(
                              title: 'Unit',
                              alignment: Alignment.centerRight,
                              builder: (salesOrderDetail, _) {
                                return Text(salesOrderDetail.key.unitId);
                              },
                            ),
                            TableColumnX(
                              width: 200,
                              title: 'Batch',
                              builder: (salesOrderDetail, index) {
                                return DropdownBatch.prepare(
                                    productId: salesOrderDetail.key.productId,
                                    salesOrderDetail: salesOrderDetail.key,
                                    bloc: context.read<SalesOrderDetailBloc>(),
                                    batchNo: _batchNoController.text,
                                    onChanged: (productStock) {
                                      setState(() {
                                        _batchNoController.text =
                                            productStock!.batch.id;
                                      });
                                    });
                              },
                            ),
                            TableColumnX(
                              title: 'Quantity Purchase Order',
                              width: 200,
                              builder: (salesOrderDetail, _) {
                                final isQtyPurchaseOrder =
                                    salesOrderDetail.key.quantity != 0;
                                return Text(
                                  isQtyPurchaseOrder
                                      ? salesOrderDetail.key.quantity.toString()
                                      : 0.toString(),
                                );
                              },
                            ),
                            TableColumnX(
                              title: 'Quantity Stock',
                              width: 200,
                              builder: (salesOrderDetail, _) {
                                return Text(
                                  '${salesOrderDetail.value?.endingBalanceMarketing ?? 0}',
                                );
                              },
                            ),
                            TableColumnX(
                              title: 'Price',
                              width: 200,
                              alignment: Alignment.centerRight,
                              builder: (salesOrderDetail, _) {
                                return Text(salesOrderDetail.key.price!.idr);
                              },
                            ),
                            TableColumnX(
                              width: 200,
                              title: 'Quantity Sales Order',
                              builder: (salesOrderDetail, index) {
                                return FTextFormField(
                                  controller: _qtyController,
                                  maxLength: 6,
                                  onChanged: (value) {
                                    _qtyController.text = value;
                                  },
                                );
                              },
                            ),
                            TableColumnX(
                              title: 'Action',
                              builder: (salesOrderDetail, _) {
                                return Row(
                                  children: [
                                    SalesOrderDetailDeleteButton(
                                      salesOrderDetail: salesOrderDetail.key,
                                      bloc:
                                          context.read<SalesOrderDetailBloc>(),
                                      isExternal: widget.isExternal,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                          data: salesOrderDetails?.entries.toList() ?? [],
                        ),
                      ],
                    );
                  },
                  orElse: () =>
                      const Center(child: CupertinoActivityIndicator()),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
