import 'package:flexurio_chiron_finance/src/app/bloc/invoice_receipt_query/invoice_receipt_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/entity.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receipt/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class InvoiceReceiptPage extends StatelessWidget {
  const InvoiceReceiptPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InvoiceReceiptQueryBloc()
            ..add(const InvoiceReceiptQueryEvent.fetch()),
        ),
      ],
      child: const InvoiceReceiptPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityFinance.invoiceReceipt),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const InvoiceReceiptDataTable(),
        ),
      ],
    );
  }
}
