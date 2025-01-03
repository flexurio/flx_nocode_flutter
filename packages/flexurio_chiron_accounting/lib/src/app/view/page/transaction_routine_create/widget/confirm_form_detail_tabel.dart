import 'package:flexurio_chiron_accounting/src/app/model/transaction_routine.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ConfirmFormDetailTable extends StatelessWidget {
  const ConfirmFormDetailTable({
    required List<TransactionRoutineDetail>? transactionRoutineDetails,
    super.key,
  }) : _transactionRoutineDetails = transactionRoutineDetails;

  final List<TransactionRoutineDetail>? _transactionRoutineDetails;

  @override
  Widget build(BuildContext context) {
    return YuhuTable<TransactionRoutineDetail>(
      rowHeight: 80,
      columns: [
        TableColumn(
          title: 'Chart of Account',
          builder: (transactionRoutineDetail, _) {
            return Text(
              transactionRoutineDetail.chartOfAccountNo!,
            );
          },
        ),
        TableColumn(
          title: 'Unique',
          builder: (transactionRoutineDetail, _) {
            return Text(
              transactionRoutineDetail.unique!,
            );
          },
        ),
        TableColumn(
          title: 'Value',
          builder: (transactionRoutineDetail, _) {
            return Text(
              transactionRoutineDetail.value!.idr,
            );
          },
        ),
        TableColumn(
          title: 'Category',
          alignment: Alignment.centerRight,
          builder: (transactionRoutineDetail, _) {
            return ChipType(transactionRoutineDetail.category!);
          },
        ),
        TableColumn(
          title: 'Cost',
          builder: (transactionRoutineDetail, _) {
            return Text(
              transactionRoutineDetail.material ?? '',
            );
          },
        ),
        TableColumn(
          title: 'Description',
          builder: (transactionRoutineDetail, _) {
            return Text(
              transactionRoutineDetail.description ?? '',
            );
          },
        ),
      ],
      data: _transactionRoutineDetails!,
    );
  }
}
