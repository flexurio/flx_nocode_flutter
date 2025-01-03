import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_production/src/app/model/permission.dart';
import 'package:flexurio_chiron_production/src/app/view/page/schedule/widget/report_man_hour_production_export_excel_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ReportManHourProductionExportExcelButton extends StatelessWidget {
  const ReportManHourProductionExportExcelButton({
    required this.isExternal, super.key,
  });
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportExcel,
      title: 'man_hour_production'.tr(),
      permission: PermissionProduction.reportManHourProductionExportExcel(
        isExternal: isExternal,
      ),
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return ReportManHourProductionExportExcelForm.prepare();
          },
        );
      },
    );
  }
}
