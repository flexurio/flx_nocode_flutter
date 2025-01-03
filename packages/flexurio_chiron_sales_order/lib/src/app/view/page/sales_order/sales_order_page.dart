import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_query/sales_order_query_bloc.dart';
import 'widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SalesOrderPage extends StatelessWidget {
  const SalesOrderPage._(this.isExternal, this.isProductRequestOther);
  final bool isExternal;
  final bool isProductRequestOther;

  static Widget prepare({
    required bool isExternal,
    bool isProductRequestOther = false,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SalesOrderQueryBloc(),
        ),
      ],
      child: SalesOrderPage._(isExternal, isProductRequestOther),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(
          entity: isProductRequestOther
              ? Entity.productRequestOther
              : Entity.salesOrder,
          suffixText: isExternal ? ' External' : null,
        ),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SalesOrderDataTable(
            isExternal: isExternal,
            isProductRequestOther: isProductRequestOther,
          ),
        ),
      ],
    );
  }
}
