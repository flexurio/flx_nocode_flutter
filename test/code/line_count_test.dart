import 'dart:io';
import 'package:test/test.dart';

void main() {
  group('File Line Count Check', () {
    const int maxLines = 400;

    const List<String> ignoredFiles = [
      './lib/src/app/resource/accounting_repository.dart',
      './lib/src/app/resource/purchasing_repository.dart',
      './lib/src/app/resource/material_repository.dart',
      './lib/src/app/resource/product_repository.dart',
      './lib/src/app/resource/material_request_repository.dart',
      './lib/src/app/resource/company_repository.dart',
      './packages/flexurio_chiron_finance/lib/src/app/resource/finance_repository.dart',
      './packages/flexurio_chiron_production/lib/src/app/resource/production_repository.dart',

      // other
      './packages/flexurio_chiron_accounting/lib/src/app/view/page/ebitda/widget/ebitda_expansion_tile_coa_group.dart',
      './packages/flexurio_chiron_accounting/lib/src/app/view/page/ebitda/widget/ebitda_expansion_tile_marketing_area.dart',
      './lib/constant/finance_customer.dart',
      './packages/flexurio_chiron_accounting/lib/src/app/view/page/accounting_cogs_report/widget/accounting_cogs_report_data.dart',
      './packages/flexurio_chiron_accounting/lib/src/app/view/page/accounting_cogs_report/widget/accounting_cogs_report_data_detail.dart',
      './packages/flexurio_chiron_accounting/lib/src/app/view/page/budget_type/widget/budget_type_data_table.dart',
      './packages/flexurio_chiron_accounting/lib/src/app/view/page/ebitda/ebitda_page.dart',
      './packages/flexurio_chiron_accounting/lib/src/app/view/page/payment_create/widget/step_2_payment_form.dart',
      './packages/flexurio_chiron_business_trip/lib/src/app/view/page/vehicle_rent_calendar_view/widget/calendar.dart',
      './packages/flexurio_chiron_business_trip/lib/src/app/view/page/vehicle_rent_view/vehicle_rent_view_page.dart',
      './packages/flexurio_chiron_finance/lib/src/app/bloc/petty_cash/petty_cash_bloc.dart',
      './packages/flexurio_chiron_finance/lib/src/app/view/page/invoice_receive_create/invoice_receive_create_page.dart',
      './packages/flexurio_chiron_finance/lib/src/app/view/page/invoice_receive_with_qr_code_create/invoice_receive_with_qr_code_create_page.dart',
      './packages/flexurio_chiron_finance/lib/src/app/view/page/petty_cash/util/petty_cash_report_form.dart',
      './packages/flexurio_chiron_finance/lib/src/app/view/page/petty_cash/util/petty_cash_report_general_expense.dart',
      './packages/flexurio_chiron_finance/lib/src/app/view/page/petty_cash_close/petty_cash_close_page.dart',
      './packages/flexurio_chiron_marketing/lib/src/app/bloc/field_force_summary_detail_query/field_force_summary_detail_query_bloc.dart',
      './packages/flexurio_chiron_marketing/lib/src/app/view/page/marketing_field_force_summary/widget/dimension_chart.dart',
      './packages/flexurio_chiron_marketing/lib/src/app/view/page/marketing_field_force_summary/widget/summary_field_force_report_data.dart',
      './packages/flexurio_chiron_marketing/lib/src/app/view/page/marketing_field_force_summary/widget/summary_field_force_report_data_ebitda.dart',
      './packages/flexurio_chiron_marketing/lib/src/app/view/page/marketing_field_force_summary/widget/summary_field_force_year_report_data.dart',
      './packages/flexurio_chiron_material_stock/lib/src/app/resource/material_issue.dart',
      './packages/flexurio_chiron_material_stock/lib/src/app/view/page/material_issue/util/pdf_material_issue_detail.dart',
      './packages/flexurio_chiron_material_stock/lib/src/app/view/page/material_issue/util/pdf_packaging_material_delivery.dart',
      './packages/flexurio_chiron_material_stock/lib/src/app/view/page/material_receive/widget/data_table.dart',
      './packages/flexurio_chiron_material_stock/lib/src/app/view/page/material_receive/widget/material_receive_detail_reject_release_page.dart',
      './packages/flexurio_chiron_material_stock/lib/src/app/view/page/material_receive/widget/pdf_karantina_material_receive.dart',
      './packages/flexurio_chiron_material_stock/lib/src/app/view/page/material_receive/widget/pdf_material_receive.dart',
      './packages/flexurio_chiron_material_stock/lib/src/app/view/page/material_receive_create/widget/purchase_form.dart',
      './packages/flexurio_chiron_material_stock/lib/src/app/view/page/material_receive_detail/material_analysis_detail_form.dart',
      './packages/flexurio_chiron_material_stock/lib/src/app/view/page/material_return/util/pdf_adjustment_material.dart',
      './packages/flexurio_chiron_material_stock/lib/src/app/view/page/material_return/util/pdf_material_return_detail.dart',
      './packages/flexurio_chiron_material_stock/lib/src/app/view/page/material_return_detail_create/material_return_detail_create_page.dart',
      './packages/flexurio_chiron_material_stock/lib/src/app/view/page/material_return_note_detail/widget/report_pdf_detail_return_note.dart',
      './packages/flexurio_chiron_material_stock/lib/src/app/view/page/material_stock/widget/material_stock_data_table.dart',
      './packages/flexurio_chiron_product/lib/src/app/view/page/product_create/product_create_page.dart',
      './packages/flexurio_chiron_product/lib/src/app/view/page/product_formulation_create/product_formulation_create_page.dart',
      './packages/flexurio_chiron_product_stock/lib/src/app/resource/product_receive.dart',
      './packages/flexurio_chiron_product_stock/lib/src/app/view/page/product_receive/widget/pdf_product_receive.dart',
      './packages/flexurio_chiron_product_stock/lib/src/app/view/page/product_return/util/pdf_report_product_return_delivery.dart',
      './packages/flexurio_chiron_product_stock/lib/src/app/view/page/product_return/widget/product_return_outstanding_report_export_form.dart',
      './packages/flexurio_chiron_product_stock/lib/src/app/view/page/product_return/widget/product_return_receive_report_export_form.dart',
      './packages/flexurio_chiron_product_stock/lib/src/app/view/page/product_return_check_create/product_return_check_create_page.dart',
      './packages/flexurio_chiron_product_stock/lib/src/app/view/page/product_return_detail/util/pdf_product_return_detail.dart',
      './packages/flexurio_chiron_product_stock/lib/src/app/view/page/product_return_note_create/product_return_note_create_page.dart',
      './packages/flexurio_chiron_product_stock/lib/src/app/view/page/product_return_note_detail_create/product_return_note_detail_create_page.dart',
      './packages/flexurio_chiron_product_stock/lib/src/app/view/page/product_stock/widget/product_stock_export_button.dart',
      './packages/flexurio_chiron_production/lib/src/app/view/page/production_order/util/report_jobsheet.dart',
      './packages/flexurio_chiron_production/lib/src/app/view/page/production_stage_process/widget/data_table_set_3.dart',
      './packages/flexurio_chiron_production/lib/src/app/view/page/production_stage_process_detail_create/production_stage_process_detail_create_page.dart',
      './packages/flexurio_chiron_production/lib/src/app/view/page/schedule_detail/widget/schedule_detail_create_page.dart',
      './packages/flexurio_chiron_purchase_order/lib/src/app/bloc/purchase_order/purchase_order_bloc.dart',
      './packages/flexurio_chiron_purchase_order/lib/src/app/view/page/purchase_order/util/pdf_purchase_order.dart',
      './packages/flexurio_chiron_purchase_request/lib/src/app/view/page/material_request_detail_create/purchase_request_detail_create_page.dart',
      './packages/flexurio_chiron_purchase_request/lib/src/app/view/page/purchase_request/util/pdf_material_request.dart',
      './packages/flexurio_chiron_purchase_request/lib/src/app/view/page/purchase_request_create/purchase_request_approve_page.dart',
      './packages/flexurio_chiron_sales_order/lib/src/app/resource/sales_order.dart',
      './packages/flexurio_chiron_sales_order/lib/src/app/view/page/product_request_create/widget/confirm_form.dart',
      './packages/flexurio_chiron_sales_order/lib/src/app/view/page/product_request_create/widget/purchase_order_form.dart',
      './packages/flexurio_chiron_sales_order/lib/src/app/view/page/sales_order/util/pdf_report_inventory_control_form.dart',
      './packages/flexurio_chiron_sales_order/lib/src/app/view/page/sales_order/util/pdf_report_sales_order.dart',
      './packages/flexurio_chiron_sales_order/lib/src/app/view/page/sales_order/util/pdf_sales_order_summary_hna.dart',
      './packages/flexurio_chiron_sales_order/lib/src/app/view/page/sales_order/util/sales_order_invoice_pdf.dart',
      './packages/flexurio_chiron_sales_order/lib/src/app/view/page/sales_order_create/sales_order_create_page.dart',
    ];

    const List<String> ignoredPatterns = [
      '.freezed.dart',
      '.g.dart',
    ];

    test(
        'No file should have more than $maxLines lines (excluding ignored files)',
        () {
      final directories = [
        Directory('./lib'),
        Directory('./packages/flexurio_chiron_accounting/lib'),
        Directory('./packages/flexurio_chiron_business_trip/lib'),
        Directory('./packages/flexurio_chiron_company/lib'),
        Directory('./packages/flexurio_chiron_customer/lib'),
        Directory('./packages/flexurio_chiron_finance/lib'),
        Directory('./packages/flexurio_chiron_marketing/lib'),
        Directory('./packages/flexurio_chiron_material/lib'),
        Directory('./packages/flexurio_chiron_material_stock/lib'),
        Directory('./packages/flexurio_chiron_presence/lib'),
        Directory('./packages/flexurio_chiron_product/lib'),
        Directory('./packages/flexurio_chiron_product_stock/lib'),
        Directory('./packages/flexurio_chiron_production/lib'),
        Directory('./packages/flexurio_chiron_purchase_order/lib'),
        Directory('./packages/flexurio_chiron_purchase_request/lib'),
        Directory('./packages/flexurio_chiron_sales_order/lib'),
        Directory('./packages/flexurio_chiron_tax/lib'),
        Directory('./packages/flexurio_chiron_ticket/lib'),
        Directory('./packages/flexurio_chiron_vendor/lib'),
      ];

      final dartFiles = directories.expand((directory) {
        if (!directory.existsSync()) return [];
        return directory.listSync(recursive: true).where((file) {
          if (file is! File || !file.path.endsWith('.dart')) {
            return false;
          }
          final path = file.path.replaceAll('\\', '/');
          return !ignoredFiles.contains(path) &&
              !ignoredPatterns.any((pattern) => path.endsWith(pattern));
        }).cast<File>();
      }).toList();

      for (var file in dartFiles) {
        final lines = file.readAsLinesSync();
        expect(
          lines.length,
          lessThanOrEqualTo(maxLines),
          reason:
              'File ${file.path} has ${lines.length} lines, which exceeds the limit of $maxLines.',
        );
      }
    });
  });
}
