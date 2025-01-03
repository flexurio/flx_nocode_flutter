import 'package:flexurio_erp_core/flexurio_erp_core.dart';

final menu = <Menu1>[
  // Menu1(
  //   label: 'PPIC',
  //   menu: [
  //     Menu2(
  //       label: 'Materials',
  //       icon: FontAwesomeIcons.layerGroup,
  //       menu: menu3MaterialStocks,
  //     )
  //   ],
  // )
];

// final menu3MaterialStocks = <Menu3>[
//   Menu3(
//     label: 'material_stock',
//     home: MaterialStockPage.prepare(isExternal: false),
//     permission:
//         PermissionMaterialStock.materialStockViewMenu(isExternal: false),
//     permissions: [
//       PermissionMaterialStock.materialStockViewMenu(isExternal: false),
//       PermissionMaterialStock.materialStockExportExcel(isExternal: false),
//       PermissionMaterialStock.materialStockReportExportPdf(isExternal: false),
//     ],
//   ),
//   Menu3(
//     label: 'material_stock_external',
//     home: MaterialStockPage.prepare(isExternal: true),
//     permission: PermissionMaterialStock.materialStockViewMenu(isExternal: true),
//     permissions: [
//       PermissionMaterialStock.materialStockViewMenu(isExternal: true),
//       PermissionMaterialStock.materialStockExportExcel(isExternal: true),
//       PermissionMaterialStock.materialStockReportExportPdf(isExternal: true),
//     ],
//   ),
//   Menu3(
//     label: 'material_issue',
//     home: MaterialIssuePage(isExternal: false),
//     permission:
//         PermissionMaterialStock.materialIssueViewMenu(isExternal: false),
//     permissions: [
//       PermissionMaterialStock.materialIssueViewMenu(isExternal: false),
//       PermissionMaterialStock.materialIssueCreate(isExternal: false),
//       PermissionMaterialStock.materialIssueDelete(isExternal: false),
//       PermissionMaterialStock.materialIssueEdit(isExternal: false),
//       PermissionMaterialStock.materialIssuePrint,
//       PermissionMaterialStock.materialIssueReportExportPdf,
//       PermissionMaterialStock.materialIssueComparisonSummaryReportExportPdf,
//     ],
//   ),
//   Menu3(
//     label: 'material_issue_external',
//     home: MaterialIssuePage(isExternal: true),
//     permission: PermissionMaterialStock.materialIssueViewMenu(isExternal: true),
//     permissions: [
//       PermissionMaterialStock.materialIssueViewMenu(isExternal: true),
//       PermissionMaterialStock.materialIssueCreate(isExternal: true),
//       PermissionMaterialStock.materialIssueDelete(isExternal: true),
//       PermissionMaterialStock.materialIssueEdit(isExternal: true),
//       PermissionMaterialStock.materialIssuePrint,
//       PermissionMaterialStock.materialIssueReportExportPdf,
//       PermissionMaterialStock.materialIssueComparisonSummaryReportExportPdf
//     ],
//   ),
//   Menu3(
//     label: 'return_note',
//     home: MaterialReturnNotePage.prepare(),
//     permission: PermissionMaterialStock.materialReturnNoteViewMenu,
//     permissions: [
//       PermissionMaterialStock.materialReturnNoteViewMenu,
//       PermissionMaterialStock.materialReturnNoteExportExcel,
//       PermissionMaterialStock.materialReturnNoteExportPdf,
//     ],
//   ),
//   Menu3(
//     label: 'return',
//     home: const MaterialReturnPage(),
//     permission: PermissionMaterialStock.materialReturnViewMenu,
//     permissions: [
//       PermissionMaterialStock.materialReturnViewMenu,
//       PermissionMaterialStock.materialReturnCreate,
//       PermissionMaterialStock.materialReturnDelete,
//       PermissionMaterialStock.materialReturnDetailCreate,
//       PermissionMaterialStock.materialReturnDetailDelete,
//       PermissionMaterialStock.materialReturnDetailEdit,
//       PermissionMaterialStock.reportAdjustmentMaterialExportPdf,
//     ],
//   ),
//   Menu3(
//     label: 'material_receive',
//     home: MaterialReceivePage(isExternal: false),
//     permission:
//         PermissionMaterialStock.materialReceiveViewMenu(isExternal: false),
//     permissions: [
//       PermissionMaterialStock.materialReceiveViewMenu(isExternal: false),
//       PermissionMaterialStock.materialReceiveCreate(isExternal: false),
//       PermissionMaterialStock.materialReceiveRelease(isExternal: false),
//       PermissionMaterialStock.materialReceiveReject(isExternal: false),
//       PermissionMaterialStock.materialReceiveDelete(isExternal: false),
//       PermissionMaterialStock.materialReceiveDetailDelete(isExternal: false),
//       PermissionMaterialStock.materialReceiveEdit(isExternal: false),
//       PermissionMaterialStock.materialReceiveExportPdf(isExternal: false),
//       PermissionMaterialStock.materialReceiveReportExportPdf(isExternal: false),
//       PermissionMaterialStock.materialReturnReceiptExportPdf,
//       PermissionMaterialStock.packagingMaterialDeliveryLabelExportPdf,
//       PermissionMaterialStock.quarantineLabelExportPdf,
//       PermissionMaterialStock.acceptanceReceiptExportPdf,
//       Permission.materialAnalysis,
//     ],
//   ),
//   Menu3(
//     label: 'material_receive_external',
//     home: MaterialReceivePage(isExternal: true),
//     permission:
//         PermissionMaterialStock.materialReceiveViewMenu(isExternal: true),
//     permissions: [
//       PermissionMaterialStock.materialReceiveViewMenu(isExternal: true),
//       PermissionMaterialStock.materialReceiveCreate(isExternal: true),
//       PermissionMaterialStock.materialReceiveRelease(isExternal: true),
//       PermissionMaterialStock.materialReceiveReject(isExternal: true),
//       PermissionMaterialStock.materialReceiveDelete(isExternal: true),
//       PermissionMaterialStock.materialReceiveDetailDelete(isExternal: true),
//       PermissionMaterialStock.materialReceiveEdit(isExternal: true),
//       PermissionMaterialStock.materialReceiveExportPdf(isExternal: true),
//       PermissionMaterialStock.materialReceiveReportExportPdf(isExternal: true),
//     ],
//   ),
// ];
