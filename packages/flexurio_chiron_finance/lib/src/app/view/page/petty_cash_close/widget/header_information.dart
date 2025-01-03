
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';

class HeaderInformation extends StatelessWidget {
  const HeaderInformation({
    required this.pettyCash,
  });

  final PettyCash pettyCash;

  @override
  Widget build(BuildContext context) {
    return RowFields(
      children: [
        TileDataVertical(
          label: 'petty_cash'.tr(),
          bordered: true,
          child: Text(pettyCash.id).canCopy(),
        ),
        TileDataVertical(
          label: 'Realization No.',
          bordered: true,
          child: Text(pettyCash.realizationNo ?? '-').canCopy(),
        ),
        TileDataVertical(
          label: 'Recipient',
          bordered: true,
          child: Text(pettyCash.recipient),
        ),
        TileDataVertical(
          label: 'created_by'.tr(),
          bordered: true,
          child: GetNameUser(userId: pettyCash.createdById),
        ),
      ],
    );
  }
}
