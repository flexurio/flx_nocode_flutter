import 'package:flexurio_chiron_finance/src/app/bloc/form_a1_query/form_a1_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_summary/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class InvoiceSummaryPage extends StatelessWidget {
  const InvoiceSummaryPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FormA1QueryBloc(),
        ),
      ],
      child: const InvoiceSummaryPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.invoiceSummary),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const FormA1DataTable(),
        ),
      ],
    );
  }
}
