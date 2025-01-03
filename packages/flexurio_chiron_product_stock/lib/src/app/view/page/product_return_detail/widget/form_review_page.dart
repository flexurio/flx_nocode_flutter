import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_detail_query/product_return_detail_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_query/product_return_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnDetailReviewFormPage extends StatefulWidget {
  const ProductReturnDetailReviewFormPage({
    required this.productReturnDetail,
    super.key,
  });

  static Widget prepare({
    required ProductReturnDetail productReturnDetail,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductReturnDetailQueryBloc()
            ..add(
              ProductReturnDetailQueryEvent.fetch(
                productReturnId: productReturnDetail.productReturn.id,
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => ProductReturnQueryBloc()
            ..add(const ProductReturnQueryEvent.fetch()),
        ),
      ],
      child: ProductReturnDetailReviewFormPage(
        productReturnDetail: productReturnDetail,
      ),
    );
  }

  final ProductReturnDetail productReturnDetail;

  @override
  State<ProductReturnDetailReviewFormPage> createState() =>
      _ProductReturnDetailReviewFormPageState();
}

class _ProductReturnDetailReviewFormPageState
    extends State<ProductReturnDetailReviewFormPage> {
  @override
  Widget build(BuildContext context) {
    return RowFields(
      children: [
        Column(
          children: [
            TileDataVertical(
              label: 'Product Return',
              child: Text(widget.productReturnDetail.productReturn.id),
            ),
            TileDataVertical(
              label: 'Delivery Order',
              child: Text(widget.productReturnDetail.deliveryOrderId),
            ),
            TileDataVertical(
              label: 'Quantity Remaining',
              child: Text(
                widget.productReturnDetail.quantityRemaining.toString(),
              ),
            ),
            TileDataVertical(
              label: 'Quantity Check',
              child: Text(
                widget.productReturnDetail.quantityCheck.toString(),
              ),
            ),
            TileDataVertical(
              label: 'Quantity',
              child: Text(widget.productReturnDetail.quantity.toString()),
            ),
            TileDataVertical(
              label: 'Total',
              child: Text(
                widget.productReturnDetail.totalProductPrice.format(),
              ),
            ),
          ],
        ),
        Column(
          children: [
            TileDataVertical(
              label: 'Product',
              child: Text(widget.productReturnDetail.product.name),
            ),
            TileDataVertical(
              label: 'Batch Number',
              child: Text(widget.productReturnDetail.batchNo.id),
            ),
            TileDataVertical(
              label: 'Expired Date',
              child: Text(widget.productReturnDetail.expirationDate.yMMMMd),
            ),
            TileDataVertical(
              label: 'Unit',
              child: Text(widget.productReturnDetail.unit.id),
            ),
            TileDataVertical(
              label: 'Price',
              child: Text(
                widget.productReturnDetail.productPrice.format(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
