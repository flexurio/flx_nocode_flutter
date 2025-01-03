import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_chiron_sales_order/src/app/view/page/product_request/product_request_page.dart';
import 'package:flexurio_chiron_sales_order/src/app/view/page/sales_order/sales_order_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

final menu = <Menu1>[
  Menu1(
    label: 'marketing',
    menu: [
      Menu2(
        label: 'sales_order',
        icon: FontAwesomeIcons.shoppingCart,
        menu: [
          Menu3(
            label: 'product_request',
            home: const ProductRequestPage(),
            permission: Permission.productRequestViewMenu,
            permissions: [
              Permission.productRequestViewMenu,
              Permission.productRequestCreate,
              Permission.productRequestDelete,
              Permission.productRequestEdit,
            ],
          ),
          Menu3(
            label: 'product_request_other',
            home: SalesOrderPage.prepare(
              isExternal: false,
              isProductRequestOther: true,
            ),
            permission: PermissionProductStock.productRequestOtherViewMenu,
            permissions: [
              PermissionProductStock.productRequestOtherViewMenu,
              PermissionProductStock.productRequestOtherCreate,
              PermissionProductStock.productRequestOtherConfirm,
            ],
          ),
          Menu3(
            label: 'Sales Order',
            home: SalesOrderPage.prepare(isExternal: false),
            permission:
                PermissionProductStock.salesOrderViewMenu(isExternal: false),
            permissions: [
              PermissionProductStock.salesOrderViewMenu(isExternal: false),
              PermissionProductStock.salesOrderConfirm(isExternal: false),
              PermissionProductStock.salesOrderCreate(isExternal: false),
              PermissionProductStock.salesOrderDelete(isExternal: false),
              PermissionProductStock.salesOrderEdit(isExternal: false),
              PermissionProductStock.salesOrderDetailUploadDocument,
              PermissionProductStock.salesOrderExportDeliveryOrder,
              PermissionProductStock.salesOrderPrintInvoice,
              PermissionProductStock.salesOrderSummaryExportPdf,
              PermissionProductStock.salesOrderMalkSummaryExportPdf,
              PermissionProductStock.salesOrderLoanRequestsSummaryExportPdf,
              PermissionProductStock.salesOrderSummaryExportPdf,
              PermissionProductStock.reportSalesOrderExportPdf,
              PermissionProductStock.reportInventoryControlFormExportPdf,
              PermissionProductStock.salesOrderAdditionalDiscountEdit,
            ],
          ),
          Menu3(
            label: 'sales_order_external',
            home: SalesOrderPage.prepare(isExternal: true),
            permission:
                PermissionProductStock.salesOrderViewMenu(isExternal: true),
            permissions: [
              PermissionProductStock.salesOrderViewMenu(isExternal: true),
              PermissionProductStock.salesOrderConfirm(isExternal: true),
              PermissionProductStock.salesOrderCreate(isExternal: true),
              PermissionProductStock.salesOrderDelete(isExternal: true),
              PermissionProductStock.salesOrderEdit(isExternal: true),
            ],
          ),
        ],
      ),
      Menu2(
        label: 'report',
        icon: FontAwesomeIcons.chartBar,
        menu: [
          Menu3(
            label: 'Pending Requests Recap',
            home: PendingRequestsRecapPage.prepare(),
            permission: PermissionProductStock.pendingRequestsRecapViewMenu,
            permissions: [
              PermissionProductStock.pendingRequestsRecapViewMenu,
              PermissionProductStock.pendingRequestsRecapExportPdf,
              PermissionProductStock.pendingRequestsUnservedExportPdf,
              PermissionProductStock.pendingRequestsDetailExportPdf,
              PermissionProductStock.pendingRequestsRecapGlobalExportPdf,
            ],
          ),
        ],
      ),
    ],
  )
];

