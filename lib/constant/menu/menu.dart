import 'package:flexurio_chiron_business_trip/src/app/view/page/vehicle_rent/vehicle_rent_page.dart';
import 'package:flexurio_chiron_company/src/app/view/page/department/department_page.dart';
import 'package:flexurio_chiron_business_trip/src/app/view/page/fuel/fuel_page.dart';
import 'package:flexurio_chiron_material/constant/menu.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_retest/material_retest_page.dart';
import 'package:flexurio_chiron_company/src/app/view/page/office/office_page.dart';
import 'package:flexurio_chiron_presence/src/app/view/page/presence_monthly_report/presence_monthly_report_page.dart';
import 'package:flexurio_chiron_presence/src/app/view/page/presence_monthly_report_per_employee/presence_monthly_report_per_employee_page.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form/request_form_page.dart';
import 'package:flexurio_chiron_ticket/src/app/view/page/ticket/ticket_page.dart';
import 'package:flexurio_chiron_business_trip/src/app/view/page/vehicle/vehicle_page.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart'
    as flexurio_chiron_finance;
import 'package:flexurio_chiron_marketing/flexurio_chiron_marketing.dart'
    as flexurio_chiron_marketing;
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart'
    as flexurio_chiron_accounting;
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart'
    as flexurio_chiron_production;
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart'
    as flexurio_chiron_purchase_order;
import 'package:flexurio_chiron_sales_order/flexurio_chiron_sales_order.dart'
    as flexurio_chiron_sales_order;
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_product/constant/menu.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_chiron_purchase_request/flexurio_chiron_purchase_request.dart';
import 'package:flexurio_chiron_tax/flexurio_chiron_tax.dart'
    as flexurio_chiron_tax;
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

part 'menu_human_resource.dart';
part 'menu_ppic.dart';
part 'menu_purchasing.dart';
part 'menu_rnd.dart';

final menu = [
  flexurio_chiron_accounting.menu.first,
  flexurio_chiron_finance.menu.first,
  flexurio_chiron_sales_order.menu.first,
  flexurio_chiron_marketing.menu.first,
  flexurio_chiron_production.menu.first,
  flexurio_chiron_tax.menu.first,
];
