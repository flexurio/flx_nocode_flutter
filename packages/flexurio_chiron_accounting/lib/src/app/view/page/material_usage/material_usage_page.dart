import 'package:flexurio_chiron_accounting/src/app/bloc/material_usage_global_query/material_usage_global_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_usage/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MaterialUsagePage extends StatelessWidget {
  const MaterialUsagePage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialGlobalUsageQueryBloc()..add(
            MaterialUsageGlobalQueryEvent.fetch(
              pageOptions: PageOptions.empty(sortBy: 'material_issue_id'),
            ),
          ),
        ),
      ],
      child: const MaterialUsagePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityAccounting.recapUsageMaterialType),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const MaterialUsageDetailDataTable(),
        ),
      ],
    );
  }
}
