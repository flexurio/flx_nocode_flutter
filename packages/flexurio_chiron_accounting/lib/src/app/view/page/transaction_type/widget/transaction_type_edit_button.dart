import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_type_query/transaction_type_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_type/widget/transaction_type_create_page.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionTypeEditButton extends StatelessWidget {
  const TransactionTypeEditButton({
    required this.transactionTypes,
    super.key,
  });

  final TransactionType transactionTypes;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionFinance.transactionTypeEdit,
      action: DataAction.edit,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => TransactionTypeCreatePage.prepare(
              transactionTypes: transactionTypes,
            ),
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<TransactionTypeQueryBloc>()
                .add(const TransactionTypeQueryEvent.fetch(name: '', flag: ''));
          }
        });
      },
    );
  }
}
