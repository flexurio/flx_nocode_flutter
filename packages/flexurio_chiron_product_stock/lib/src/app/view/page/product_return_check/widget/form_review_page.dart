import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_check_query/product_return_check_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_query/product_return_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_check.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnCheckReviewFormPage extends StatefulWidget {
  const ProductReturnCheckReviewFormPage._({
    required this.productReturnCheck,
    required this.productReturnDetail,
  });

  final ProductReturnCheck productReturnCheck;
  final ProductReturnDetail productReturnDetail;

  static Widget prepare({
    required ProductReturnCheck productReturnCheck,
    required ProductReturnDetail productReturnDetail,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductReturnCheckQueryBloc()
            ..add(
              ProductReturnCheckQueryEvent.fetch(
                productReturnId: productReturnCheck.productReturnId.id,
                productId: productReturnDetail.product.id,
                batchId: productReturnDetail.batchNo.id,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => ProductReturnQueryBloc()
            ..add(const ProductReturnQueryEvent.fetch()),
        ),
      ],
      child: ProductReturnCheckReviewFormPage._(
        productReturnCheck: productReturnCheck,
        productReturnDetail: productReturnDetail,
      ),
    );
  }

  @override
  State<ProductReturnCheckReviewFormPage> createState() =>
      _ProductReturnCheckReviewFormPageState();
}

class _ProductReturnCheckReviewFormPageState
    extends State<ProductReturnCheckReviewFormPage> {
  @override
  Widget build(BuildContext context) {
    return RowFields(
      children: [
        Column(
          children: [
            TileDataVertical(
              label: 'Product Return',
              child: Text(widget.productReturnCheck.productReturnId.id),
            ),
            TileDataVertical(
              label: 'Batch Number',
              child: Text(widget.productReturnCheck.batch.id),
            ),
            TileDataVertical(
              label: 'Quantity Warehouse Return',
              child: Text('${widget.productReturnCheck.qtyWarehouseReturn}'),
            ),
            TileDataVertical(
              label: 'Quantity Out Return',
              child: Text('${widget.productReturnCheck.qtyOutReturn}'),
            ),
            TileDataVertical(
              label: 'Quantity',
              child: Text('${widget.productReturnCheck.quantity}'),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.only(right: 130, bottom: 8),
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TileDataVertical(
              label: 'Description',
              child: Text(widget.productReturnCheck.description),
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
              label: 'Unit',
              child: Text(widget.productReturnCheck.unitId.id),
            ),
            TileDataVertical(
              label: 'Quantity Warehouse Remaining',
              child: Text(
                '${widget.productReturnCheck.qtyWarehouseRemaining}',
              ),
            ),
            TileDataVertical(
              label: 'Quantity Out Remaining',
              child: Text('${widget.productReturnCheck.qtyOutRemaining}'),
            ),
          ],
        ),
      ],
    );
  }
}
