import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

var menu = <Menu1>[
  Menu1(
    label: 'purchasing',
    menu: [
      menu2Order,
    ],
  ),
];

final menu2Order = Menu2(
  label: 'Orders',
  icon: FontAwesomeIcons.truck,
  menu: [
    Menu3(
      label: 'Purchase Order',
      home: PurchaseOrderPage.prepare(),
      permission: PermissionPurchaseOrder.purchaseOrderViewMenu,
      permissions: [
        PermissionPurchaseOrder.purchaseOrderViewMenu,
        PermissionPurchaseOrder.purchaseOrderConfirm,
        PermissionPurchaseOrder.purchaseOrderConfirmAccounting,
        PermissionPurchaseOrder.purchaseOrderCreate,
        PermissionPurchaseOrder.purchaseOrderDelete,
        PermissionPurchaseOrder.purchaseOrderEdit,
        PermissionPurchaseOrder.purchaseOrderExportExcel,
        PermissionPurchaseOrder.purchaseOrderClose,
        PermissionPurchaseOrder.purchaseOrderRejectExportExcel,
        PermissionPurchaseOrder.purchaseOrderDownPaymentViewMenu,
        PermissionPurchaseOrder.purchaseOrderDownPaymentCreate,
      ],
    ),
  ],
);
