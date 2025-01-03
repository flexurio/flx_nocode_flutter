import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PendingRequestsRecapPage extends StatelessWidget {
  const PendingRequestsRecapPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PendingRequestsRecapQueryBloc()..add(
            PendingRequestsRecapQueryEvent.fetch(
              pageOptions: PageOptions.empty(sortBy: 'product_name'),
            ),
          ),
        ),
      ],
      child: const PendingRequestsRecapPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.pendingRequestsRecap),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const PendingRequestsRecapDataTable(),
        ),
      ],
    );
  }
}
