import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductReturnDetailPage extends StatelessWidget {
  const ProductReturnDetailPage._({required this.productReturn, required this.productReturnDetailQueryBloc});

  final ProductReturn productReturn;
  final ProductReturnDetailQueryBloc productReturnDetailQueryBloc;

  static Route<void> route({
    required ProductReturn productReturn,
    required ProductReturnDetailQueryBloc productReturnDetailQueryBloc,
  }) {
    return MaterialPageRoute(
      builder: (context) => ProductReturnDetailPage._(
        productReturn: productReturn,
        productReturnDetailQueryBloc: productReturnDetailQueryBloc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Row(
            children: [
              BackButton(),
            ],
          ),
          TitlePage(entity: Entity.productReturnDetail),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ProductReturnDetailDataTable.prepare(
              productReturn: productReturn,
              productReturnDetailQueryBloc: productReturnDetailQueryBloc,
            ),
          ),
        ],
      ),
    );
  }
}
