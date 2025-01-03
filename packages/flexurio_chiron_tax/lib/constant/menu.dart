import 'package:flexurio_chiron_tax/src/app/view/page/tax_invoice_number/tax_invoice_number_page.dart';
import 'package:flexurio_chiron_tax/flexurio_chiron_tax.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

final menu = [
  Menu1(
    label: 'TAX',
    menu: [
      Menu2(
        label: 'Master',
        icon: FontAwesomeIcons.database,
        menu: [
          Menu3(
            label: 'tax_invoice_number',
            home: const TaxInvoiceNumberPage(),
            permission: Permission.taxInvoiceNumberViewMenu,
            permissions: [
              Permission.taxInvoiceNumberViewMenu,
              Permission.taxInvoiceNumberCreate,
              Permission.taxInvoiceNumberDelete,
            ],
          ),
        ],
      ),
      Menu2(
        label: 'report',
        icon: FontAwesomeIcons.chartBar,
        menu: [
          Menu3(
            label: 'sales_tax_report',
            home: SalesTaxReportPage.prepare(),
            permission: PermissionTax.salesTaxReportViewMenu,
            permissions: [
              PermissionTax.salesTaxReportViewMenu,
              PermissionTax.salesTaxReportExportExcel,
            ],
          ),
        ],
      ),
    ],
  ),
];
