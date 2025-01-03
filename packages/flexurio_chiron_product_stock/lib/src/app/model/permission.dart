class PermissionProductStock {
  static String salesOrderAmountViewMenu = 'sales_order_amount_view_menu';
  static String salesOrderAdditionalDiscountEdit =
      'sales_order_additional_discount_edit';
  static String salesOrderDetailUploadDocument =
      'sales_order_detail_upload_document';
  static String salesOrderExportDeliveryOrder =
      'sales_order_export_delivery_order';
  static String salesOrderPrintInvoice = 'sales_order_print_invoice';
  static String salesOrderSummaryExportPdf = 'sales_order_summary_export_pdf';
  static String reportSalesOrderExportPdf =
      'report_sales_order_export_pdf';
  static String reportInventoryControlFormExportPdf =
      'report_inventory_control_form_export_pdf';    
  static String salesOrderMalkSummaryExportPdf =
      'sales_order_malk_summary_export_pdf';
  static String salesOrderLoanRequestsSummaryExportPdf =
      'sales_order_loan_requests_summary_export_pdf';
  static String salesOrderDonationSummaryExportPdf =
      'sales_order_donation_summary_export_pdf';

  static String pendingRequestsRecapViewMenu =
      'pending_requests_recap_view_menu';
  static String pendingRequestsRecapExportPdf =
      'pending_requests_recap_export_pdf';
  static String pendingRequestsUnservedExportPdf =
      'pending_requests_unserved_export_pdf';
  static String pendingRequestsDetailExportPdf =
      'pending_requests_detail_export_pdf';
  static String pendingRequestsRecapGlobalExportPdf =
      'pending_requests_recap_global_export_pdf';

  static String productDistributionExportPdf =
      'product_distribution_export_pdf';

  static String productReceiveViewMenu({required bool isExternal}) => isExternal
      ? 'product_receive_external_view_menu'
      : 'product_receive_view_menu';
  static String productReceiveCreate({required bool isExternal}) =>
      isExternal ? 'product_receive_external_create' : 'product_receive_create';
  static String productReceiveEdit({required bool isExternal}) =>
      isExternal ? 'product_receive_external_edit' : 'product_receive_edit';
  static String productReceiveRelease({required bool isExternal}) => isExternal
      ? 'product_receive_external_release'
      : 'product_receive_release';
  static String productReceiveExportPdf = 'product_receive_export_pdf';

  static String productReturnExportPdf = 'product_return_export_pdf';
  static String productReturnViewMenu = 'product_return_view_menu';
  static String productReturnNoteApprove = 'product_return_note_approve';
  static String productReturnConfirmMarketing =
      'product_return_confirm_marketing';
  static String productReturnConfirmPpic = 'product_return_confirm_ppic';
  static String productReturnCreate = 'product_return_create';
  static String productReturnDelete = 'product_return_delete';
  static String productReturnDetailCreate = 'product_return_detail_create';
  static String productReturnDetailDelete = 'product_return_detail_delete';
  static String productReturnEdit = 'product_return_edit';
  static String productReturnCheckViewMenu = 'product_return_check_view_menu';
  static String productReturnCheckCreate = 'product_return_check_create';
  static String productReturnQualityControlCheck =
      'product_return_quality_control_check';
  static String productReturnCheckDelete = 'product_return_check_delete';
  static String productReturnCheckExportPdf = 'product_return_check_export_pdf';
  static String productReturnSrpExportPdf = 'product_return_srp_export_pdf';
  static String productReturnNoteExportPdf = 'product_return_note_export_pdf';
  static String productReturnReceiveExportExcel =
      'product_return_receive_export_excel';
  static String productReturnReceiveQaCheckExportExcel =
      'product_return_receive_qa_check_export_excel';    
  static String productReturnLeadTimeExportExcel =
      'product_return_{lead_time}_export_excel';
  static String productReturnRecapDispositionExportExcel =
      'product_return_{recap_disposition}_export_excel';
  static String productReturnNoteExportExcel =
      'product_return_{note}_export_excel';
  static String productReturnLeadTimeByStatusExportExcel =
      'product_return_{lead_time_by_status}_export_excel';

  // --
  static String productStockViewMenu = 'product_stock_view_menu';
  static String productStockPrint = 'product_stock_print';
  static String productStockMutationSummaryExportPdf =
      'product_stock_mutation_summary_export_pdf';
  static String productMutationSummaryExportPdf =
      'product_mutation_summary_export_pdf';
  static String productStockRecapViewMenu = 'product_stock_recap_view_menu';
  static String productStockRecapExportExcel =
      'recap_product_stock_export_excel';
  static String productStockWarehouseExportExcel =
      'product_stock_warehouse_export_excel';
  static String productStockWarehouseExportPdf =
      'product_stock_warehouse_export_pdf';
  static String productStockCardBatchExportPdf =
      'product_stock_card_batch_export_pdf';
  static String productStockMutationProductDetailExportPdf =
      'product_stock_mutation_product_detail_export_pdf';
  static String productReturnNoteViewMenu = 'product_return_note_view_menu';
  static String productReturnNoteConfirmMarketing =
      'product_return_note_confirm_marketing';
  static String productReturnNoteCreate = 'product_return_note_create';
  static String productReturnNoteDelete = 'product_return_note_delete';
  static String productReturnNoteEdit = 'product_return_note_edit';
  // Recap Product Expenditure
  static String recapProductExpenditureViewMenu =
      'recap_product_expenditure_view_menu';
  static String recapProductExpenditureExportExcel =
      'recap_product_expenditure_export_excel';
  // Recap Expired Product
  static String recapExpiredProductViewMenu = 'recap_expired_product_view_menu';
  static String recapExpiredProductExportExcel =
      'recap_expired_product_export_excel';

  static String productRequestOtherViewMenu = 'product_request_other_view_menu';
  static String productRequestOtherCreate = 'product_request_other_create';
  static String productRequestOtherConfirm = 'product_request_other_confirm';

  static String salesOrderViewMenu({required bool isExternal}) =>
      isExternal ? 'sales_order_external_view_menu' : 'sales_order_view_menu';
  static String salesOrderEdit({required bool isExternal}) =>
      isExternal ? 'sales_order_external_edit' : 'sales_order_edit';
  static String salesOrderConfirm({required bool isExternal}) =>
      isExternal ? 'sales_order_external_confirm' : 'sales_order_confirm';
  static String salesOrderCreate({required bool isExternal}) =>
      isExternal ? 'sales_order_external_create' : 'sales_order_create';
  static String salesOrderDelete({required bool isExternal}) =>
      isExternal ? 'sales_order_external_delete' : 'sales_order_delete';
}
