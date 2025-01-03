import 'package:flexurio_chiron_accounting/src/app/bloc/accounts_receivable_payment_detail_query/accounts_receivable_payment_detail_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounts_receivable_payment/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AccountsReceivablePaymentPage extends StatelessWidget {
  const AccountsReceivablePaymentPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AccountsReceivablePaymentDetailQueryBloc()..add(
            const AccountsReceivablePaymentDetailQueryEvent.fetch(),
          ),
        ),
      ],
      child: const AccountsReceivablePaymentPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityAccounting.recapAccountsReceivablePayment),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const AccountsReceivablePaymentDetailDataTable(),
        ),
      ],
    );
  }
}
