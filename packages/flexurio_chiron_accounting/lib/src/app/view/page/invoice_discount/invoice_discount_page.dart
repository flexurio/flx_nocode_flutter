import 'package:flexurio_chiron_accounting/src/app/bloc/invoice_discount_query/invoice_discount_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/invoice_discount/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class InvoiceDiscountPage extends StatelessWidget {
  const InvoiceDiscountPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InvoiceDiscountQueryBloc()
            ..add(const InvoiceDiscountQueryEvent.fetch()),
        ),
      ],
      child: const InvoiceDiscountPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityAccounting.invoiceDiscount),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const InvoiceDiscountDataTable(),
        ),
      ],
    );
  }
}
