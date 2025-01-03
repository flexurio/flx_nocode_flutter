import 'package:flexurio_chiron_accounting/src/app/bloc/purchase_summary_detail_query/purchase_summary_detail_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/purchase_summary/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PurchaseSummaryPage extends StatelessWidget {
  const PurchaseSummaryPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PurchaseSummaryDetailQueryBloc()..add(
            PurchaseSummaryDetailQueryEvent.fetch(
              pageOptions: PageOptions.empty(sortBy: 'transaction_date'),
            ),
          ),
        ),
      ],
      child: const PurchaseSummaryPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityAccounting.purchaseSummary),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const PurchaseSummaryDetailDataTable(),
        ),
      ],
    );
  }
}
