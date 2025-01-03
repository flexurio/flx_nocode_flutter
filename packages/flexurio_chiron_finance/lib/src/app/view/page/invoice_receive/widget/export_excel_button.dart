import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receive/widget/excel_invoice_receive.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ExcelInvoiceReceiveButton extends StatelessWidget {
  const ExcelInvoiceReceiveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportExcel,
      title: 'invoice_receive'.tr(),
      permission: null,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return ExcelInvoiceReceive.prepare();
          },
        );
      },
    );
  }
}
