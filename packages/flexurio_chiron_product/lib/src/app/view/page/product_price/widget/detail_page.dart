import 'package:flexurio_chiron_product/src/app/model/product_price.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductPriceDetailPage extends StatefulWidget {
  const ProductPriceDetailPage({
    required this.productPrice,
    super.key,
  });

  final ProductPrice productPrice;

  @override
  State<ProductPriceDetailPage> createState() => _ProductPriceDetailPageState();
}

class _ProductPriceDetailPageState extends State<ProductPriceDetailPage> {
  @override
  Widget build(BuildContext context) {
    final entity = Entity.productPrice;
    const action = DataAction.view;
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 150),
          SingleFormPanel(
            action: action,
            entity: entity,
            children: [
              RowFields(
                children: [
                  Column(
                    children: [
                      TileDataVertical(
                        label: 'Price',
                        child: Text(widget.productPrice.price.format()),
                      ),
                      TileDataVertical(
                        label: 'Start Date',
                        child: Text(widget.productPrice.startDate.yMMMMd),
                      ),
                      TileDataVertical(
                        label: 'Primary Price',
                        child: Text(widget.productPrice.primaryPrice.format()),
                      ),
                      TileDataVertical(
                        label: 'Strip Price',
                        child: Text(widget.productPrice.stripPrice.format()),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TileDataVertical(
                        label: 'currency'.tr(),
                        child: Text(widget.productPrice.currency.id),
                      ),
                      TileDataVertical(
                        label: 'Strip HPP',
                        child: Text(widget.productPrice.stripHpp.format()),
                      ),
                      TileDataVertical(
                        label: 'Bonus Price',
                        child: Text(widget.productPrice.bonusPrice.format()),
                      ),
                      TileDataVertical(
                        label: 'Tablet Price',
                        child: Text(widget.productPrice.tabletPrice.format()),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
