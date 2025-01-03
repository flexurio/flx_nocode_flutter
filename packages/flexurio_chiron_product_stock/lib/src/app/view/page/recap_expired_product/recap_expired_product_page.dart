import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/recap_expired_product_query/recap_expired_product_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/entity.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/recap_expired_product/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RecapExpiredProductPage extends StatelessWidget {
  const RecapExpiredProductPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecapExpiredProductQueryBloc(),
          // ..add(const RecapExpiredProductQueryEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(
              ProductQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const RecapExpiredProductPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityProductReturn.recapExpiredProduct),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const RecapExpiredProductDataTable(),
        ),
      ],
    );
  }
}
