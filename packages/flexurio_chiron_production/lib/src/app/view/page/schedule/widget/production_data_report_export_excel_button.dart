import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_production/src/app/model/permission.dart';
import 'package:flexurio_chiron_production/src/app/view/page/schedule/widget/production_data_report_export_excel_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductionDataReportExportExcelButton extends StatelessWidget {
  const ProductionDataReportExportExcelButton({
    required this.isExternal, super.key,
  });
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportExcel,
      title: 'production_data_report'.tr(),
      permission: PermissionProduction.scheduleExportExcel(
        isExternal: isExternal,
      ),
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return ProductionDataReportExportExcelForm.prepare();
          },
        );
      },
    );
  }
}
