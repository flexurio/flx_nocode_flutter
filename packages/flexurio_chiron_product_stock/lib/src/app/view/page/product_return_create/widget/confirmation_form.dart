import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return/product_return_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_create/widget/detail_table.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_create/widget/total_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductReturnConfirmForm extends StatefulWidget {
  const ProductReturnConfirmForm({required this.onPrevious, super.key});

  final void Function() onPrevious;

  @override
  State<ProductReturnConfirmForm> createState() =>
      _ProductReturnConfirmFormState();
}

class _ProductReturnConfirmFormState extends State<ProductReturnConfirmForm> {
  ProductReturnCustomerForm? _customerForm;
  List<ProductReturnDetail>? _products = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductReturnBloc, ProductReturnState>(
      builder: (context, state) {
        state.maybeWhen(
          orElse: () {},
          initial: (products, customerForm) {
            if (customerForm != null) {
              _customerForm = customerForm;
            }
            if (products.isNotEmpty) {
              _products = products;
            }
          },
        );

        if (_customerForm == null) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        return FormAction(
          actions: [
            Button(
              permission: null,
              isSecondary: true,
              action: DataAction.back,
              onPressed: () {
                widget.onPrevious();
              },
            ),
            const Gap(12),
            BlocBuilder<ProductReturnBloc, ProductReturnState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  action: DataAction.create,
                  isInProgress: state.maybeWhen(
                    orElse: () => false,
                    loading: () => true,
                  ),
                  onPressed: () {
                    _submit(context);
                  },
                );
              },
            ),
          ],
          children: [
            RowFields(
              children: [
                TileDataVertical(
                  label: 'Department',
                  child: Text(
                    '${_customerForm!.department!.id} - ${_customerForm!.department!.name}',
                  ),
                ),
                TileDataVertical(
                  label: 'Customer',
                  child: Text(
                    '${_customerForm!.customer!.id} - ${_customerForm!.customer!.name}',
                  ),
                ),
              ],
            ),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'Transaction Type',
                  child: Text(
                    '${_customerForm!.transactionType!.id} - ${_customerForm!.transactionType!.name}',
                  ),
                ),
                TileDataVertical(
                  label: 'currency'.tr(),
                  child: Text(_customerForm!.currency!.id),
                ),
              ],
            ),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'Reference Number',
                  child: Text(_customerForm!.referenceNumber!),
                ),
              ],
            ),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'Percent Discount',
                  child: Text('${_customerForm!.discountPercent!} %'),
                ),
                TileDataVertical(
                  label: 'Percent PPN',
                  child: Text(_customerForm!.ppnPercent!.label),
                ),
              ],
            ),
            const Gap(24),
            const ProductReturnDetailTable(
              isView: true,
            ),
            const Gap(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TotalDetails(
                    products: _products!,
                    customerForm: _customerForm!,
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
    final bloc = context.read<ProductReturnBloc>();
    const action = DataAction.create;
    showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        final totalAmountReal = _products!.fold<double>(
          0,
          (total, product) => total + product.totalProductPrice,
        );

        late double discount;
        late double ppnDiscount;

        discount = _customerForm!.discountPercent ?? 0.0;
        var totalPriceDiscount = discount / 100 * totalAmountReal;

        ppnDiscount = _customerForm!.ppnPercent?.id ?? 0.0;
        var totalAmountAfterDiscount = totalAmountReal - totalPriceDiscount;
        var totalPricePpn = totalAmountAfterDiscount * ppnDiscount / 100;

        return BlocListener<ProductReturnBloc, ProductReturnState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              error: (error) => Toast(context).fail(error),
              success: () {
                Toast(context).dataChanged(
                  action,
                  Entity.productReturn,
                );
                Navigator.pop(context, true);
              },
            );
          },
          child: BlocBuilder<ProductReturnBloc, ProductReturnState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                orElse: () => false,
                loading: () => true,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.productReturn,
                onConfirm: () {
                  bloc.add( ProductReturnEvent.submit(
                    discountValue: totalPriceDiscount,
                    ppnValue: totalPricePpn,
                  ));
                },
              );
            },
          ),
        );
      },
    );
  }
}
