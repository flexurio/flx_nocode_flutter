import 'package:flexurio_chiron_tax/src/app/bloc/sales_tax_report_query/sales_tax_report_query_bloc.dart';
import 'package:flexurio_chiron_tax/src/app/model/entity.dart';
import 'package:flexurio_chiron_tax/src/app/view/page/sales_tax_report/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SalesTaxReportPage extends StatelessWidget {
  const SalesTaxReportPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SalesTaxReportQueryBloc(),
            // ..add(const SalesTaxReportQueryEvent.fetch()),
        ),
      ],
      child: const SalesTaxReportPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityTax.salesReportTax),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const SalesTaxReportDataTable(),
        ),
      ],
    );
  }
}
