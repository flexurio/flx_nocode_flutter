import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_type_query/transaction_type_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/transaction_type.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownOnlySelling extends StatelessWidget {
  const DropDownOnlySelling._({
    required this.transactionType,
    required this.onChanged,
  });

  static Widget prepare({
    required void Function(TransactionType?) onChanged,
    TransactionType? transactionType,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TransactionTypeQueryBloc()
            ..add(
              TransactionTypeQueryEvent.fetch(
                name: 'PENJUALAN',
                flag: 'FPJK',
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: DropDownOnlySelling._(
        transactionType: transactionType,
        onChanged: onChanged,
      ),
    );
  }

  final TransactionType? transactionType;
  final void Function(TransactionType?) onChanged;

  @override
  Widget build(BuildContext context) {
    return FDropDownSearchTransactionType(
      isRequired: false,
      initialValue: transactionType,
      label: 'Transaction Type',
      onChanged: onChanged,
    );
  }
}
