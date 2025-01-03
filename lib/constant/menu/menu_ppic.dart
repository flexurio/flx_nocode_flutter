part of 'menu.dart';

final menuPpic = Menu1(
  label: 'PPIC',
  menu: [
    Menu2(
      label: 'Materials',
      icon: FontAwesomeIcons.layerGroup,
      menu: [
        ...menu3Materials,
        Menu3(
          label: 'material_stock',
          home: MaterialStockPage.prepare(isExternal: false),
          permission:
              PermissionMaterialStock.materialStockViewMenu(isExternal: false),
          permissions: [
            PermissionMaterialStock.materialStockViewMenu(isExternal: false),
            PermissionMaterialStock.materialStockExportExcel(isExternal: false),
            PermissionMaterialStock.materialStockReportExportPdf(
                isExternal: false),
          ],
        ),
        Menu3(
          label: 'material_stock_external',
          home: MaterialStockPage.prepare(isExternal: true),
          permission:
              PermissionMaterialStock.materialStockViewMenu(isExternal: true),
          permissions: [
            PermissionMaterialStock.materialStockViewMenu(isExternal: true),
            PermissionMaterialStock.materialStockExportExcel(isExternal: true),
            PermissionMaterialStock.materialStockReportExportPdf(
                isExternal: true),
          ],
        ),
        Menu3(
          label: 'material_issue',
          home: MaterialIssuePage(isExternal: false),
          permission:
              PermissionMaterialStock.materialIssueViewMenu(isExternal: false),
          permissions: [
            PermissionMaterialStock.materialIssueViewMenu(isExternal: false),
            PermissionMaterialStock.materialIssueCreate(isExternal: false),
            PermissionMaterialStock.materialIssueDelete(isExternal: false),
            PermissionMaterialStock.materialIssueEdit(isExternal: false),
            PermissionMaterialStock.materialIssueDetailEdit(isExternal: false),
            PermissionMaterialStock.materialIssueDetailCreate(
                isExternal: false),
            PermissionMaterialStock.materialIssuePrint,
            PermissionMaterialStock.materialIssueReportExportPdf,
            PermissionMaterialStock
                .materialIssueComparisonSummaryReportExportPdf,
          ],
        ),
        Menu3(
          label: 'material_issue_external',
          home: MaterialIssuePage(isExternal: true),
          permission:
              PermissionMaterialStock.materialIssueViewMenu(isExternal: true),
          permissions: [
            PermissionMaterialStock.materialIssueViewMenu(isExternal: true),
            PermissionMaterialStock.materialIssueCreate(isExternal: true),
            PermissionMaterialStock.materialIssueDelete(isExternal: true),
            PermissionMaterialStock.materialIssueEdit(isExternal: true),
            PermissionMaterialStock.materialIssueDetailEdit(isExternal: true),
            PermissionMaterialStock.materialIssueDetailCreate(isExternal: true),
            PermissionMaterialStock.materialIssuePrint,
            PermissionMaterialStock.materialIssueReportExportPdf,
            PermissionMaterialStock
                .materialIssueComparisonSummaryReportExportPdf
          ],
        ),
        Menu3(
          label: 'return_note',
          home: MaterialReturnNotePage.prepare(),
          permission: PermissionMaterialStock.materialReturnNoteViewMenu,
          permissions: [
            PermissionMaterialStock.materialReturnNoteViewMenu,
            PermissionMaterialStock.materialReturnNoteExportExcel,
            PermissionMaterialStock.materialReturnNoteExportPdf,
          ],
        ),
        Menu3(
          label: 'return',
          home: const MaterialReturnPage(isExternal: false),
          permission: PermissionMaterialStock.materialReturnViewMenu(isExternal: false),
          permissions: [
            PermissionMaterialStock.materialReturnViewMenu(isExternal: false),
            PermissionMaterialStock.materialReturnCreate(isExternal: false),
            PermissionMaterialStock.materialReturnDelete(isExternal: false),
            PermissionMaterialStock.materialReturnDetailCreate(isExternal: false),
            PermissionMaterialStock.materialReturnDetailDelete(isExternal: false),
            PermissionMaterialStock.materialReturnDetailEdit(isExternal: false),
            PermissionMaterialStock.reportAdjustmentMaterialExportPdf,
          ],
        ),
        Menu3(
          label: 'return_external',
          home: const MaterialReturnPage(isExternal: true),
          permission: PermissionMaterialStock.materialReturnViewMenu(isExternal: true),
          permissions: [
            PermissionMaterialStock.materialReturnViewMenu(isExternal: true),
            PermissionMaterialStock.materialReturnCreate(isExternal: true),
            PermissionMaterialStock.materialReturnDelete(isExternal: true),
            PermissionMaterialStock.materialReturnDetailCreate(isExternal: true),
            PermissionMaterialStock.materialReturnDetailDelete(isExternal: true),
            PermissionMaterialStock.materialReturnDetailEdit(isExternal: true),
            PermissionMaterialStock.reportAdjustmentMaterialExportPdf,
          ],
        ),
        Menu3(
          label: 'material_receive',
          home: MaterialReceivePage(isExternal: false),
          permission: PermissionMaterialStock.materialReceiveViewMenu(
              isExternal: false),
          permissions: [
            PermissionMaterialStock.materialReceiveViewMenu(isExternal: false),
            PermissionMaterialStock.materialReceiveCreate(isExternal: false),
            PermissionMaterialStock.materialReceiveRelease(isExternal: false),
            PermissionMaterialStock.materialReceiveReject(isExternal: false),
            PermissionMaterialStock.materialReceiveRetestEdit(
                isExternal: false),
            PermissionMaterialStock.materialReceiveDelete(isExternal: false),
            PermissionMaterialStock.materialReceiveDetailDelete(
                isExternal: false),
            PermissionMaterialStock.materialReceiveEdit(isExternal: false),
            PermissionMaterialStock.materialReceiveExportPdf(isExternal: false),
            PermissionMaterialStock.materialReceiveReportExportPdf(
                isExternal: false),
            PermissionMaterialStock.materialReturnReceiptExportPdf,
            PermissionMaterialStock.packagingMaterialDeliveryLabelExportPdf,
            PermissionMaterialStock.quarantineLabelExportPdf,
            PermissionMaterialStock.acceptanceReceiptExportPdf,
            Permission.materialAnalysis,
          ],
        ),
        Menu3(
          label: 'material_receive_external',
          home: MaterialReceivePage(isExternal: true),
          permission:
              PermissionMaterialStock.materialReceiveViewMenu(isExternal: true),
          permissions: [
            PermissionMaterialStock.materialReceiveViewMenu(isExternal: true),
            PermissionMaterialStock.materialReceiveCreate(isExternal: true),
            PermissionMaterialStock.materialReceiveRelease(isExternal: true),
            PermissionMaterialStock.materialReceiveReject(isExternal: true),
            PermissionMaterialStock.materialReceiveRetestEdit(isExternal: true),
            PermissionMaterialStock.materialReceiveDelete(isExternal: true),
            PermissionMaterialStock.materialReceiveDetailDelete(
                isExternal: true),
            PermissionMaterialStock.materialReceiveEdit(isExternal: true),
            PermissionMaterialStock.materialReceiveExportPdf(isExternal: true),
            PermissionMaterialStock.materialReceiveReportExportPdf(
                isExternal: true),
          ],
        ),
        Menu3(
          label: 'retest',
          home: MaterialRetestPage.prepare(),
          permission: Permission.materialRetestViewMenu,
          permissions: [
            Permission.materialRetestViewMenu,
            Permission.materialRetestCreate,
            Permission.materialRetestEdit,
          ],
        ),
      ],
    ),
    Menu2(
      label: 'Products',
      icon: FontAwesomeIcons.tablets,
      menu: [
        ...menu3Products,
        Menu3(
          label: 'product_receive',
          home: ProductReceivePage.prepare(isExternal: false),
          permission:
              PermissionProductStock.productReceiveViewMenu(isExternal: false),
          permissions: [
            PermissionProductStock.productReceiveViewMenu(isExternal: false),
            PermissionProductStock.productReceiveCreate(isExternal: false),
            PermissionProductStock.productReceiveEdit(isExternal: false),
            PermissionProductStock.productReceiveRelease(isExternal: false),
          ],
        ),
        Menu3(
          label: 'product_receive_external',
          home: ProductReceivePage.prepare(isExternal: true),
          permission:
              PermissionProductStock.productReceiveViewMenu(isExternal: true),
          permissions: [
            PermissionProductStock.productReceiveViewMenu(isExternal: true),
            PermissionProductStock.productReceiveCreate(isExternal: true),
            PermissionProductStock.productReceiveEdit(isExternal: true),
            PermissionProductStock.productReceiveRelease(isExternal: true),
          ],
        ),
        Menu3(
          label: 'Issue',
          home: const ProductIssuePage(),
          permission: Permission.productIssueViewMenu,
          permissions: [
            Permission.productIssueViewMenu,
            Permission.productIssueDeliveryCreate,
            Permission.productIssueGlobalExportPdf,
          ],
        ),
        Menu3(
          label: 'Product Stock',
          home: ProductStockPage.prepare(),
          permission: PermissionProductStock.productStockViewMenu,
          permissions: [
            PermissionProductStock.productStockViewMenu,
            PermissionProductStock.productStockPrint,
            PermissionProductStock.productStockWarehouseExportExcel,
            PermissionProductStock.productStockWarehouseExportPdf,
            PermissionProductStock.productDistributionExportPdf,
            PermissionProductStock.productStockWarehouseExportPdf,
            PermissionProductStock.productDistributionExportPdf,
            PermissionProductStock.productStockMutationProductDetailExportPdf,
            PermissionProductStock.productStockMutationSummaryExportPdf,
            PermissionProductStock.productMutationSummaryExportPdf,
            PermissionProductStock.productStockWarehouseExportExcel,
            PermissionProductStock.productStockCardBatchExportPdf,
          ],
        ),
        Menu3(
          label: 'Recap Product Stock',
          home: RecapProductStockPage.prepare(),
          permission: PermissionProductStock.productStockRecapViewMenu,
          permissions: [
            PermissionProductStock.productStockRecapViewMenu,
            PermissionProductStock.productStockRecapExportExcel,
          ],
        ),
        Menu3(
          label: 'Recap Product Expenditure',
          home: RecapProductExpenditurePage.prepare(),
          permission: PermissionProductStock.recapProductExpenditureViewMenu,
          permissions: [
            PermissionProductStock.recapProductExpenditureViewMenu,
            PermissionProductStock.recapProductExpenditureExportExcel,
          ],
        ),
        Menu3(
          label: 'Recap Expired Product',
          home: RecapExpiredProductPage.prepare(),
          permission: PermissionProductStock.recapExpiredProductViewMenu,
          permissions: [
            PermissionProductStock.recapExpiredProductViewMenu,
            PermissionProductStock.recapExpiredProductExportExcel,
          ],
        ),
        Menu3(
          label: 'return',
          home: const ProductReturnPage(),
          permission: PermissionProductStock.productReturnViewMenu,
          permissions: [
            PermissionProductStock.productReturnViewMenu,
            PermissionProductStock.productReturnConfirmMarketing,
            PermissionProductStock.productReturnConfirmPpic,
            PermissionProductStock.productReturnCreate,
            PermissionProductStock.productReturnDelete,
            PermissionProductStock.productReturnDetailCreate,
            PermissionProductStock.productReturnDetailDelete,
            PermissionProductStock.productReturnEdit,
            PermissionProductStock.productReturnCheckViewMenu,
            PermissionProductStock.productReturnCheckCreate,
            PermissionProductStock.productReturnQualityControlCheck,
            PermissionProductStock.productReturnCheckDelete,
            PermissionProductStock.productReturnCheckExportPdf,
            PermissionProductStock.productReturnNoteExportPdf,
            PermissionProductStock.productReturnSrpExportPdf,
            PermissionProductStock.productReturnReceiveExportExcel,
            PermissionProductStock.productReturnLeadTimeExportExcel,
            PermissionProductStock.productReturnRecapDispositionExportExcel,
            PermissionProductStock.productReturnNoteExportExcel,
            PermissionProductStock.productReturnLeadTimeByStatusExportExcel,
          ],
        ),
        Menu3(
          label: 'return_note',
          home: const ProductReturnNotePage(),
          permission: PermissionProductStock.productReturnNoteViewMenu,
          permissions: [
            PermissionProductStock.productReturnNoteApprove,
            PermissionProductStock.productReturnNoteViewMenu,
            PermissionProductStock.productReturnNoteConfirmMarketing,
            PermissionProductStock.productReturnNoteCreate,
            PermissionProductStock.productReturnNoteDelete,
            PermissionProductStock.productReturnNoteEdit,
          ],
        ),
      ],
    ),
  ],
);
