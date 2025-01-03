import 'package:appointment/src/app/util/picker_file.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_tax/flexurio_chiron_tax.dart';
import 'package:flexurio_chiron_tax/src/app/view/page/sales_tax_report/util/excel_sales_tax_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesTaxReportExportExcelButton extends StatelessWidget {
  const SalesTaxReportExportExcelButton({
    required this.dateTimeStart,
    required this.dateTimeEnd,
    super.key,
  });

  final DateTime dateTimeStart;
  final DateTime dateTimeEnd;

  static Widget prepare({
    required DateTime dateTimeStart,
    required DateTime dateTimeEnd,
  }) {
    return BlocProvider(
      create: (context) => SalesTaxReportQueryBloc(),
      child: SalesTaxReportExportExcelButton(
        dateTimeStart: dateTimeStart,
        dateTimeEnd: dateTimeEnd,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SalesTaxReportQueryBloc, SalesTaxReportQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final bytes = excelSalesTaxReport(pageOptions.data);
            saveFile(
              bytes,
              'Sales-Tax-Report.xlsx',
            );
          },
        );
      },
      child: BlocBuilder<SalesTaxReportQueryBloc, SalesTaxReportQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportExcel,
            title: 'sales_tax_report'.tr(),
            permission: PermissionTax.salesTaxReportExportExcel,
            onPressed: () {
              context.read<SalesTaxReportQueryBloc>().add(
                    SalesTaxReportQueryEvent.fetch(
                      pageOptions: PageOptions.emptyNoLimit(
                        sortBy: 'tax_invoice_number',
                      ),
                      dateStart: dateTimeStart,
                      dateEnd: dateTimeEnd,
                    ),
                  );
            },
          );
        },
      ),
    );
  }
}
