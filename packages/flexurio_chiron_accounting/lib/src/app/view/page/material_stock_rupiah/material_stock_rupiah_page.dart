import 'package:flexurio_chiron_accounting/src/app/bloc/material_stock_rupiah_query/material_stock_rupiah_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_stock_rupiah/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MaterialStockRupiahPage extends StatelessWidget {
  const MaterialStockRupiahPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialStockRupiahQueryBloc()..add(
            MaterialStockRupiahQueryEvent.fetch(
              pageOptions: PageOptions.empty(sortBy: 'date'),
            ),
          ),
        ),
      ],
      child: const MaterialStockRupiahPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityAccounting.materialStockInRupiah),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const MaterialStockRupiahDataTable(),
        ),
      ],
    );
  }
}
