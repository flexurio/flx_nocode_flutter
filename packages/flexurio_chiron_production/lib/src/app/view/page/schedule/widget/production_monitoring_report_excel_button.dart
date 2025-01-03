import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_production/src/app/model/permission.dart';
import 'package:flexurio_chiron_production/src/app/view/page/schedule/widget/production_monitoring_report_excel_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductionMonitoringReportExportExcelButton extends StatelessWidget {
  const ProductionMonitoringReportExportExcelButton({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportExcel,
      title: 'production_monitoring_report'.tr(),
      permission: PermissionProduction.productionMonitoringExportExcel,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return ProductionMonitoringReportExportExcelForm.prepare();
          },
        );
      },
    );
  }
}
