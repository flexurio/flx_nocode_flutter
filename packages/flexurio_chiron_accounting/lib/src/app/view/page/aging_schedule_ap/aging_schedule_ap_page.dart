import 'package:flexurio_chiron_accounting/src/app/bloc/aging_schedule_ap_query/aging_schedule_ap_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/aging_schedule_ap/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AgingScheduleAPPage extends StatelessWidget {
  const AgingScheduleAPPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AgingScheduleAPQueryBloc()..add(
            AgingScheduleAPQueryEvent.fetch(
              pageOptions: PageOptions.empty(sortBy: ''),
            ),
          ),
        ),
      ],
      child: const AgingScheduleAPPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityAccounting.agingScheduleAP),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const AgingScheduleAPDataTable(),
        ),
      ],
    );
  }
}
