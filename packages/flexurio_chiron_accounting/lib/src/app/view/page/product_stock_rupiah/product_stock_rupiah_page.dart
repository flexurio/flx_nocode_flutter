import 'package:flexurio_chiron_accounting/src/app/bloc/product_stock_rupiah_query/product_stock_rupiah_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/product_stock_rupiah/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductStockRupiahPage extends StatelessWidget {
  const ProductStockRupiahPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductStockRupiahQueryBloc()..add(
            ProductStockRupiahQueryEvent.fetch(
              pageOptions: PageOptions.empty(sortBy: 'date'),
            ),
          ),
        ),
      ],
      child: const ProductStockRupiahPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityAccounting.productStockInRupiah),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const ProductStockRupiahDataTable(),
        ),
      ],
    );
  }
}
