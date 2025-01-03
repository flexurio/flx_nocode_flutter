import 'package:flexurio_chiron_accounting/src/app/bloc/payment_general_expense_query/payment_general_expense_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_general_expense/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PaymentGeneralExpensePage extends StatelessWidget {
  const PaymentGeneralExpensePage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PaymentGeneralExpenseQueryBloc()
            ..add(const PaymentGeneralExpenseQueryEvent.fetch()),
        ),
      ],
      child: const PaymentGeneralExpensePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityAccounting.paymentGeneralExpense),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: PaymentGeneralExpenseDataTable(),
        ),
      ],
    );
  }
}
