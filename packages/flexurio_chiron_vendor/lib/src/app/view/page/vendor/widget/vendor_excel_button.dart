import 'package:flexurio_chiron_vendor/src/app/bloc/vendor_query/vendor_query_bloc.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_vendor/src/app/view/page/vendor/util/excel_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class VendorExportExcelButton extends StatelessWidget {
  const VendorExportExcelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorQueryBloc, VendorQueryState>(
      builder: (context, state) {
        return LightButtonSmall(
          permission: Permission.supplierExportExcel,
          action: DataAction.exportExcel,
          onPressed: () async {
            state.maybeWhen(
              orElse: () {},
              error: (error) => Toast(context).fail(error),
              loaded: (vendor) {
                final bytes = excelVendor(vendor.data);
                final format = DateFormat(DateFormat.YEAR_NUM_MONTH_DAY);
                final date = DateTime.now();
                final dateNow = format.format(date);
                saveFile(
                  bytes,
                  'Manufacturer_$dateNow.xlsx'.replaceAll('/', '-'),
                );
              },
            );
          },
        );
      },
    );
  }
}
