import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive/product_receive_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/permission.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive_create/widget/detail_table.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive_edit_transaction/product_receive_edit_transaction_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductReceiveCreateReviewForm extends StatefulWidget {
  const ProductReceiveCreateReviewForm({
    required this.onPrevious,
    super.key,
    this.productReceive,
    required this.isExternal,
  });
  final bool isExternal;

  final void Function() onPrevious;
  final ProductReceive? productReceive;

  @override
  State<ProductReceiveCreateReviewForm> createState() =>
      _ProductReceiveCreateReviewFormState();
}

class _ProductReceiveCreateReviewFormState
    extends State<ProductReceiveCreateReviewForm> {
  ProductReceiveFormTransaction? _productReceiveFormTransaction;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductReceiveBloc, ProductReceiveState>(
      builder: (context, state) {
        state.maybeWhen(
          initial: (products, purchaseOrderFormSupplier) {
            if (purchaseOrderFormSupplier != null) {
              _productReceiveFormTransaction = purchaseOrderFormSupplier;
            }
          },
          orElse: () {},
        );

        if (_productReceiveFormTransaction == null) {
          return const Center(child: CupertinoActivityIndicator());
        }

        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        final actions = <Widget>[];
        if (widget.productReceive == null) {
          actions.addAll([
            Button(
              permission: null,
              isSecondary: true,
              isInProgress: isLoading,
              action: DataAction.back,
              onPressed: () => widget.onPrevious(),
            ),
            const Gap(12),
            Button(
              permission: null,
              isInProgress: isLoading,
              action: DataAction.finish,
              onPressed: () => _submit(context),
            ),
          ]);
        }

        final type = _productReceiveFormTransaction!.type;
        return FormAction(
          actions: actions,
          children: [
            TileDataVertical(
              label: 'type'.tr(),
              child: ChipType(type),
            ),
            //
            TileDataVertical(
              label: 'transaction_type'.tr(),
              child: Text(type == ProductReceiveType.purchaseOrder
                  ? '2A - TRANSAKSI PILIHAN PRODUCT BY PO'
                  : _productReceiveFormTransaction?.transactionType?.name ??
                      '-'),
            ),
            if (widget.productReceive != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: RowFields(
                  children: [
                    TileDataVertical(
                      label: 'Product Receive ID',
                      child: Text(widget.productReceive!.id),
                    ),
                    TileDataVertical(
                      label: 'Status',
                      child: ChipType(widget.productReceive!.status),
                    ),
                  ],
                ),
              ),
            RowFields(
              children: [
                if (type.id == ProductReceiveType.nonPurchaseOrder.id)
                  TileDataVertical(
                    label: 'Supplier',
                    child: Text(
                        _productReceiveFormTransaction?.supplier?.name ?? ''),
                  ),
                if (type.id == ProductReceiveType.purchaseOrder.id)
                  TileDataVertical(
                    label: 'Purchase Order ID',
                    child: Text(
                        _productReceiveFormTransaction?.purchaseOrder?.id ??
                            ''),
                  ),
              ],
            ),

            if ([
              ProductReceiveType.nonPurchaseOrder.id,
              ProductReceiveType.purchaseOrder.id
            ].contains(type.id))
              Column(
                children: [
                  if (widget.productReceive != null &&
                      widget.productReceive!.status ==
                          ProductReceiveStatus.input)
                    Align(
                      alignment: Alignment.centerRight,
                      child: _EditTransactionButton(
                          widget.productReceive!, widget.isExternal),
                    ),
                  RowFields(
                    children: [
                      TileDataVertical(
                        label: 'Delivery Order ID',
                        child: Text(
                          _productReceiveFormTransaction!.deliveryOrderId!,
                        ),
                      ),
                      TileDataVertical(
                        label: 'Deliver Order Date',
                        child: Text(
                          _productReceiveFormTransaction!
                              .deliveryOrderDate!.yMMMMd,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            TileDataVertical(
              label: 'description'.tr(),
              child: Text(
                _productReceiveFormTransaction!.description,
              ),
            ),
            const Gap(24),
            const ProductReceiveDetailTable(),
            const Gap(24),
          ],
        );
      },
    );
  }

  void _submit(BuildContext context) {
    final bloc = context.read<ProductReceiveBloc>();
    const action = DataAction.create;
    showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<ProductReceiveBloc, ProductReceiveState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(
                  action,
                  Entity.purchaseOrder,
                );
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<ProductReceiveBloc, ProductReceiveState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.productReceive,
                onConfirm: () {
                  bloc.add(const ProductReceiveEvent.submit());
                },
              );
            },
          ),
        );
      },
    );
  }
}

class _EditTransactionButton extends StatelessWidget {
  const _EditTransactionButton(
    this.productReceive,
    this.isExternal,
  );
  final bool isExternal;

  final ProductReceive productReceive;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission:
          PermissionProductStock.productReceiveEdit(isExternal: isExternal),
      onPressed: () {
        Navigator.push(
          context,
          ProductReceiveEditTransactionPage.route(
            productReceive: productReceive,
            isExternal: isExternal,
          ),
        ).then((success) {
          if (success ?? false) {
            context.read<ProductReceiveBloc>().add(
                  ProductReceiveEvent.initialize(productReceive),
                );
          }
        });
      },
      action: DataAction.edit,
    );
  }
}
