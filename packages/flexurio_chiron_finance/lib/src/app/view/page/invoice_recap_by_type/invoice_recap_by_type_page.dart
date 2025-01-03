import 'package:flexurio_chiron_finance/src/app/bloc/invoice_recap_by_sales_global_query/invoice_recap_by_sales_global_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/entity.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_recap_by_type/widget/invoice_recap_by_sales_global_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class InvoiceRecapByTypePage extends StatelessWidget {
  const InvoiceRecapByTypePage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InvoiceRecapBySalesGlobalQueryBloc()
            ..add(const InvoiceRecapBySalesGlobalQueryEvent.fetch()),
        ),
      ],
      child: const InvoiceRecapByTypePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityFinance.invoiceRecapByType),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const InvoiceRecapBySalesGlobalDataTable(),
        ),
      ],
    );
  }
}
