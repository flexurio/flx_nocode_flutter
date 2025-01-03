import 'package:flexurio_chiron_accounting/src/app/model/transaction_routine.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';

class ConfirmFormData extends StatelessWidget {
  const ConfirmFormData({
    required this.transactionRoutineHeader,
    super.key,
  });

  final TransactionRoutineHeader? transactionRoutineHeader;

  @override
  Widget build(BuildContext context) {
    late String month;
    if (transactionRoutineHeader!.month! == '1') {
      month = 'January';
    } else if (transactionRoutineHeader!.month! == '2') {
      month = 'February';
    } else if (transactionRoutineHeader!.month! == '3') {
      month = 'March';
    } else if (transactionRoutineHeader!.month! == '4') {
      month = 'April';
    } else if (transactionRoutineHeader!.month! == '5') {
      month = 'May';
    } else if (transactionRoutineHeader!.month! == '6') {
      month = 'June';
    } else if (transactionRoutineHeader!.month! == '7') {
      month = 'July';
    } else if (transactionRoutineHeader!.month! == '8') {
      month = 'August';
    } else if (transactionRoutineHeader!.month! == '9') {
      month = 'September';
    } else if (transactionRoutineHeader!.month! == '10') {
      month = 'October';
    } else if (transactionRoutineHeader!.month! == '11') {
      month = 'November';
    } else if (transactionRoutineHeader!.month! == '12') {
      month = 'December';
    } else {
      month = '';
    }
    return Column(
      children: [
        RowFields(
          children: [
            TileDataVertical(
              label: 'Name',
              child: Text(transactionRoutineHeader!.title!),
            ),
            TileDataVertical(
              label: 'Code',
              child: Text(transactionRoutineHeader!.code!),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'Department',
              child: Text(transactionRoutineHeader!.department!.name),
            ),
            TileDataVertical(
              label: 'Reference',
              child: Text(transactionRoutineHeader!.reference!),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'date'.tr(),
              child: Text(transactionRoutineHeader!.date!),
            ),
            TileDataVertical(
              label: 'Week',
              child: Text(transactionRoutineHeader!.week!),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'Month',
              child: Text(month),
            ),
          ],
        ),
      ],
    );
  }
}
