import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnReviewForm extends StatefulWidget {
  const ProductReturnReviewForm({
    required this.productReturn,
    required this.productReturnDetailQueryBloc,
    super.key,
  });

  final ProductReturn productReturn;
  final ProductReturnDetailQueryBloc productReturnDetailQueryBloc;

  static Widget prepare({
    required ProductReturn productReturn,
    required ProductReturnDetailQueryBloc productReturnDetailQueryBloc,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => productReturnDetailQueryBloc,
        ),
      ],
      child: ProductReturnReviewForm(
        productReturn: productReturn,
        productReturnDetailQueryBloc: productReturnDetailQueryBloc,
      ),
    );
  }

  @override
  State<ProductReturnReviewForm> createState() =>
      _ProductReturnReviewFormState();
}

class _ProductReturnReviewFormState extends State<ProductReturnReviewForm> {
  @override
  Widget build(BuildContext context) {
    return FormAction(
      children: [
        RowFields(
          children: [
            TileDataVertical(
              label: 'Product Return',
              child: Text(widget.productReturn.id),
            ),
            TileDataVertical(
              label: 'Status',
              child: ChipType(widget.productReturn.status),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'Department',
              child: Text(widget.productReturn.department.name),
            ),
            TileDataVertical(
              label: 'Customer',
              child: Text(widget.productReturn.customer.name),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'Transaction Type',
              child: Text(
                widget.productReturn.transactionType.name.isEmpty
                    ? '-'
                    : widget.productReturn.transactionType.name,
              ),
            ),
            TileDataVertical(
              label: 'currency'.tr(),
              child: Text(widget.productReturn.currency.id),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'Reference Number',
              child: Text(widget.productReturn.referenceNo),
            ),
            TileDataVertical(
              label: 'Subtotal',
              child: Text(widget.productReturn.subtotal.format()),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'Discount Percent',
              child: Text(
                '${widget.productReturn.discountPercent} %',
              ),
            ),
            TileDataVertical(
              label: 'Discount Value',
              child: Text(
                widget.productReturn.discountValue.format(),
              ),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'Subtotal After Discount',
              child: Text(
                widget.productReturn.subtotalAfterDiscount.format(),
              ),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'Percent PPN',
              child: Text(
                widget.productReturn.ppnPercent.label,
              ),
            ),
            TileDataVertical(
              label: 'Value PPN',
              child: Text(widget.productReturn.ppnValue.format()),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'Subtotal After PPN',
              child: Text(
                widget.productReturn.subtotalAfterPpn.format(),
              ),
            ),
            TileDataVertical(
              label: 'Subtotal',
              child: Text(widget.productReturn.subtotal.format()),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'Description',
              child: Text(widget.productReturn.description),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ProductReturnDetailDataTable.prepare(
            productReturn: widget.productReturn,
            productReturnDetailQueryBloc:
                widget.productReturnDetailQueryBloc,
          ),
        ),
      ],
    );
  }
}
