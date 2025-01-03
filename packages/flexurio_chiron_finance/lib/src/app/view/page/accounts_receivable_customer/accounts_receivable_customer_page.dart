import 'package:flexurio_chiron_finance/src/app/bloc/accounts_receivable_customer_query/accounts_receivable_customer_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/accounts_receivable_customer/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AccountsReceivableCustomerPage extends StatelessWidget {
  const AccountsReceivableCustomerPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AccountsReceivableCustomerQueryBloc(),
        ),
      ],
      child: const AccountsReceivableCustomerPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.accountsReceivableCustomer),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const AccountsReceivableCustomerDataTable(),
        ),
      ],
    );
  }
}
