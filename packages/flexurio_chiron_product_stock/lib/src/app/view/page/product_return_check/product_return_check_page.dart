import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_check/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductReturnCheckPage extends StatelessWidget {
  const ProductReturnCheckPage._({
    required this.productReturn,
    required this.productReturnDetail,
    required this.productReturnDetailQueryBloc,
  });

  final ProductReturn productReturn;
  final ProductReturnDetail productReturnDetail;
  final ProductReturnDetailQueryBloc productReturnDetailQueryBloc;

  static Route<void> route({
    required ProductReturn productReturn,
    required ProductReturnDetail productReturnDetail,
    required ProductReturnDetailQueryBloc productReturnDetailQueryBloc,
  }) {
    return MaterialPageRoute(
      builder: (context) => ProductReturnCheckPage._(
        productReturn: productReturn,
        productReturnDetail: productReturnDetail,
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
          TitlePage(entity: Entity.productReturnCheck),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ProductReturnCheckDataTable.prepare(
              productReturn: productReturn,
              productReturnDetail: productReturnDetail,
              productReturnDetailQueryBloc: productReturnDetailQueryBloc,
            ),
          ),
        ],
      ),
    );
  }
}
