import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/aging_schedule_ap/widget/aging_schedule_ap_export_pdf_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class AgingScheduleAPExportPdfButton extends StatelessWidget {
  const AgingScheduleAPExportPdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'Aging Schedule AP'.tr(),
      permission: null,
      // TODO: Permission
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return AgingScheduleAPExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
