import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_note_query/product_return_note_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_note.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductReturnNoteFormReviewPage extends StatefulWidget {
  const ProductReturnNoteFormReviewPage._({
    required this.productReturnNote,
    required this.productReturnNoteQueryBloc,
  });

  final ProductReturnNote productReturnNote;
  final ProductReturnNoteQueryBloc productReturnNoteQueryBloc;

  static Widget prepare({
    required ProductReturnNote productReturnNote,
    required ProductReturnNoteQueryBloc productReturnNoteQueryBloc,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => productReturnNoteQueryBloc,
        )
      ],
      child: ProductReturnNoteFormReviewPage._(
          productReturnNote: productReturnNote,
          productReturnNoteQueryBloc: productReturnNoteQueryBloc),
    );
  }

  @override
  State<ProductReturnNoteFormReviewPage> createState() =>
      _ProductReturnNoteFormReviewPageState();
}

class _ProductReturnNoteFormReviewPageState
    extends State<ProductReturnNoteFormReviewPage> {
  @override
  Widget build(BuildContext context) {
    return FormAction(children: [
      RowFields(
        children: [
          Column(
            children: [
              TileDataVertical(
                label: 'return_number'.tr(),
                child: Text(widget.productReturnNote.id),
              ),
              TileDataVertical(
                label: 'department'.tr(),
                child: Text(widget.productReturnNote.department.name),
              ),
              TileDataVertical(
                label: 'transaction_type'.tr(),
                child: Text(
                  widget.productReturnNote.transactionType.name.isEmpty
                      ? '-'
                      : widget.productReturnNote.transactionType.name,
                ),
              ),
              TileDataVertical(
                label: 'currency'.tr(),
                child: Text(
                  widget.productReturnNote.currency.id,
                ),
              ),
              TileDataVertical(
                label: 'return_date'.tr(),
                child: Text(
                  widget.productReturnNote.returnDate.yMMMdHm,
                ),
              ),
              TileDataVertical(
                label: 'shipping_address'.tr(),
                child: Text(
                  '${widget.productReturnNote.shippingAddress} - ${widget.productReturnNote.addressName}',
                ),
              ),
              TileDataVertical(
                label: 'Subtotal',
                child: Text(
                  widget.productReturnNote.subtotal.format(),
                ),
              ),
              TileDataVertical(
                label: 'percent_ppn'.tr(),
                child: Text(
                  widget.productReturnNote.ppnPercent.label,
                ),
              ),
              TileDataVertical(
                label: 'description'.tr(),
                child: Text(
                  widget.productReturnNote.remark,
                ),
              ),
            ],
          ),
          Column(
            children: [
              if (widget.productReturnNote.approvedById != 0)
                const TileDataVertical(
                  label: 'Status',
                  child: ChipType(ProductReturnNoteStatus.approve),
                ),
              if (widget.productReturnNote.approvedById == 0)
                const TileDataVertical(
                  label: 'Status',
                  child: ChipType(ProductReturnNoteStatus.input),
                ),
              TileDataVertical(
                label: 'customer'.tr(),
                child: Text(
                    '${widget.productReturnNote.customer.id} - ${widget.productReturnNote.customer.name}'),
              ),
              TileDataVertical(
                label: 'purchase_order'.tr(),
                child: Text(widget.productReturnNote.purchaseOrderId),
              ),
              TileDataVertical(
                label: 'rate'.tr(),
                child: Text(widget.productReturnNote.rate.toString()),
              ),
              TileDataVertical(
                label: 'delivery_note_date'.tr(),
                child: Text(
                  widget.productReturnNote.deliveryNoteDate.yMMMdHm,
                ),
              ),
              TileDataVertical(
                label: 'term_of_payment'.tr(),
                child: Text(widget.productReturnNote.termOfPayment.toString()),
              ),
              TileDataVertical(
                label: 'percent_discount'.tr(),
                child: Text(
                  '${widget.productReturnNote.discountPercent} %',
                ),
              ),
              TileDataVertical(
                label: 'Total',
                child: Text(
                  widget.productReturnNote.total.format(),
                ),
              ),
            ],
          ),
        ],
      ),
      Gap(12),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ProductReturnNoteDetailDataTable.prepare(
            productReturnNote: widget.productReturnNote,
          ),
        ),
      ),
    ]);
  }
}
