class PermissionMaterialStock {
  static String materialIssueViewMenu({required bool isExternal}) => isExternal
      ? 'material_issue_external_view_menu'
      : 'material_issue_view_menu';
  static String materialIssueCreate({required bool isExternal}) =>
      isExternal ? 'material_issue_external_create' : 'material_issue_create';
  static String materialIssueDelete({required bool isExternal}) =>
      isExternal ? 'material_issue_external_delete' : 'material_issue_delete';
  static String materialIssueEdit({required bool isExternal}) =>
      isExternal ? 'material_issue_external_edit' : 'material_issue_edit';
  static String materialIssueDetailEdit({required bool isExternal}) =>
      isExternal
          ? 'material_issue_external_detail_edit'
          : 'material_issue_detail_edit';
  static String materialIssueDetailCreate({required bool isExternal}) =>
      isExternal
          ? 'material_issue_external_detail_create'
          : 'material_issue_detail_create';

  static String materialIssuePrint = 'material_issue_print';
  static String materialIssueReportExportPdf =
      'material_issue_report_export_pdf';
  static String materialIssueComparisonSummaryReportExportPdf =
      'material_issue_comparison_summary_report_export_pdf';
  static String packagingMaterialDeliveryLabelExportPdf =
      'packaging_material_delivery_label_export_pdf';
  static String acceptanceReceiptExportPdf = 'acceptance_receipt_export_pdf';
  static String quarantineLabelExportPdf = 'quarantine_label_export_pdf';

  static String materialReturnViewMenu({required bool isExternal}) => isExternal
      ? 'material_external_return_view_menu'
      : 'material_return_view_menu';
  static String materialReturnCreate({required bool isExternal}) =>
      isExternal ? 'material_external_return_create' : 'material_return_create';
  static String materialReturnDelete({required bool isExternal}) =>
      isExternal ? 'material_external_return_delete' : 'material_return_delete';
  static String materialReturnDetailCreate({required bool isExternal}) =>
      isExternal
          ? 'material_external_return_detail_create'
          : 'material_return_detail_create';
  static String materialReturnDetailDelete({required bool isExternal}) =>
      isExternal
          ? 'material_external_return_detail_delete'
          : 'material_return_detail_delete';
  static String materialReturnDetailEdit({required bool isExternal}) =>
      isExternal
          ? 'material_external_return_detail_edit'
          : 'material_return_detail_edit';

  static String reportAdjustmentMaterialExportPdf =
      'report_adjustment_material_export_pdf';

  static String materialReturnNoteViewMenu = 'material_return_note_view_menu';
  static String materialReturnNoteExportExcel =
      'material_return_note_export_excel';
  static String materialReturnNoteExportPdf = 'material_return_note_export_pdf';

  static String materialReceiveViewMenu({required bool isExternal}) =>
      isExternal
          ? 'material_external_receive_view_menu'
          : 'material_receive_view_menu';
  static String materialReceiveCreate({required bool isExternal}) => isExternal
      ? 'material_external_receive_create'
      : 'material_receive_create';
  static String materialReceiveRelease({required bool isExternal}) => isExternal
      ? 'material_receive_external_release'
      : 'material_receive_release';
  static String materialReceiveReject({required bool isExternal}) => isExternal
      ? 'material_external_receive_reject'
      : 'material_receive_reject';
  static String materialReceiveExportPdf({required bool isExternal}) =>
      isExternal
          ? 'material_external_receive_export_pdf'
          : 'material_receive_export_pdf';
  static String materialReceiveDelete({required bool isExternal}) => isExternal
      ? 'material_external_receive_delete'
      : 'material_receive_delete';
  static String materialReceiveDetailDelete({required bool isExternal}) =>
      isExternal
          ? 'material_external_receive_detail_delete'
          : 'material_receive_detail_delete';
  static String materialReceiveEdit({required bool isExternal}) =>
      isExternal ? 'material_external_receive_edit' : 'material_receive_edit';
  static String materialReceiveReportExportPdf({required bool isExternal}) =>
      isExternal
          ? 'material_external_receive_report_export_pdf'
          : 'material_receive_report_export_pdf';
  static String materialReceiveRetestEdit({required bool isExternal}) =>
      isExternal
          ? 'material_external_receive_retest_edit'
          : 'material_receive_retest_edit';

  static String materialReturnReceiptExportPdf =
      'material_return_receipt_export_pdf';

  static String materialStockViewMenu({required bool isExternal}) => isExternal
      ? 'material_external_stock_view_menu'
      : 'material_stock_view_menu';
  static String materialStockExportExcel({required bool isExternal}) =>
      isExternal
          ? 'material_external_stock_export_excel'
          : 'material_stock_export_excel';
  static String materialStockReportExportPdf({required bool isExternal}) =>
      isExternal
          ? 'material_external_stock_report_export_pdf'
          : 'material_stock_report_export_pdf';

  static String materialStockMutationReportExportPdf({required bool isExternal}) =>
      isExternal
          ? 'material_external_stock_mutation_report_export_pdf'
          : 'material_stock_report_mutation_export_pdf';        
}
