import 'package:flexurio_chiron_finance/src/app/bloc/payment_settlement_query/payment_settlement_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/entity.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/payment_settlement/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PaymentSettlementPage extends StatelessWidget {
  const PaymentSettlementPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PaymentSettlementQueryBloc()
            ..add(const PaymentSettlementQueryEvent.fetch()),
        ),
      ],
      child: const PaymentSettlementPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityFinance.paymentSettlement),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const PaymentSettlementDataTable(),
        ),
      ],
    );
  }
}
