import 'package:flexurio_chiron_product_stock/src/app/bloc/recap_product_expenditure_query/recap_product_expenditure_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/entity.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/recap_product_expenditure/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RecapProductExpenditurePage extends StatelessWidget {
  const RecapProductExpenditurePage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecapProductExpenditureQueryBloc(),
            // ..add(const RecapProductExpenditureQueryEvent.fetch()),
        ),
      ],
      child: const RecapProductExpenditurePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityProductReturn.recapProductExpenditure),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const RecapProductExpenditureDataTable(),
        ),
      ],
    );
  }
}
