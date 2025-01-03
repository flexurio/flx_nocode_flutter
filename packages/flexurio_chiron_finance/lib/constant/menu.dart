import 'package:flexurio_chiron_finance/src/app/view/page/cash_flow/cash_flow_page.dart';
import 'package:flexurio_chiron_customer/src/app/view/page/customer/customer_page.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/finance_return_note/finance_return_note_page.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/rate/rate_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_type/transaction_type_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

final menu = [
  Menu1(
    label: 'FINANCE',
    menu: [
      Menu2(
        label: 'Master',
        icon: FontAwesomeIcons.database,
        menu: [
          Menu3(
            label: 'rate',
            home: const RatePage(),
            permission: PermissionFinance.rateViewMenu,
            permissions: [
              PermissionFinance.rateViewMenu,
              PermissionFinance.rateCreate,
              PermissionFinance.rateDelete,
            ],
          ),
          Menu3(
            label: 'currency',
            home: const CurrencyPages(),
            permission: PermissionFinance.currencyViewMenu,
            permissions: [
              PermissionFinance.currencyViewMenu,
              PermissionFinance.currencyCreate,
              PermissionFinance.currencyDelete,
            ],
          ),
          Menu3(
            label: 'Transaction Type',
            home: const TransactionTypePage(),
            permission: PermissionFinance.transactionTypeViewMenu,
            permissions: [
              PermissionFinance.transactionTypeViewMenu,
              PermissionFinance.transactionTypeCreate,
              PermissionFinance.transactionTypeDelete,
              PermissionFinance.transactionTypeEdit,
            ],
          ),
          Menu3(
            label: 'customer',
            home: const CustomerPage(),
            permission: Permission.customerViewMenu,
            permissions: [
              Permission.customerViewMenu,
              Permission.customerCreate,
              Permission.customerDelete,
              Permission.customerEdit,
              Permission.customerDiscountViewMenu,
              Permission.customerDiscountCreate,
              Permission.customerDiscountDelete,
            ],
          ),
        ],
      ),
      Menu2(
        label: 'transaction',
        icon: FontAwesomeIcons.moneyBill,
        menu: [
          Menu3(
            label: 'petty_cash',
            home: PettyCashPage.prepare(),
            permission: PermissionFinance.pettyCashViewMenu,
            permissions: [
              PermissionFinance.pettyCashViewMenu,
              PermissionFinance.pettyCashCreate,
              PermissionFinance.pettyCashApproveManager,
              PermissionFinance.pettyCashApproveAccounting,
              PermissionFinance.pettyCashApproveFinance,
              PermissionFinance.pettyCashRealization,
              PermissionFinance.pettyCashClose,
              PermissionFinance.pettyCashExportExcel,
              PermissionFinance.pettyCashCompletedExportExcel,
              PermissionFinance.pettyCashDocumentReceive,
            ],
          ),
        ],
      ),
      Menu2(
        label: 'report',
        icon: FontAwesomeIcons.chartBar,
        menu: [
          Menu3(
            label: 'payment_settlement',
            home: PaymentSettlementPage.prepare(),
            permission: PermissionFinance.paymentSettlementViewMenu,
            permissions: [
              PermissionFinance.paymentSettlementViewMenu,
              PermissionFinance.paymentSettlementExportPdf,
              PermissionFinance.paymentSettlementReturnExportPdf,
              PermissionFinance.paymentSettlementNewExportPdf,
            ],
          ),
          Menu3(
            label: 'invoice_recap_by_type',
            home: InvoiceRecapByTypePage.prepare(),
            permission: PermissionFinance.invoiceRecapByTypeViewMenu,
            permissions: [
              PermissionFinance.invoiceRecapByTypeViewMenu,
              PermissionFinance.invoiceRecapBySalesGlobalExportPdf,
              PermissionFinance.invoiceRecapBySalesGlobalSpecialExportPdf,
              PermissionFinance.invoiceRecapBySalesGlobalSpecialAllExportPdf,
              PermissionFinance.invoiceRecapBySalesDetailExportPdf,
              PermissionFinance.invoiceRecapBySalesDetailSpecialExportPdf,
              PermissionFinance.invoiceRecapByTypeReprocess,
            ],
          ),
          Menu3(
            label: 'return_note',
            home: FinanceReturnNotePage.prepare(),
            permission: Permission.financeReturnNoteViewMenu,
            permissions: [
              Permission.financeReturnNoteViewMenu,
              Permission.financeReturnNoteExportExcel,
              Permission.financeReturnNoteExportPdf,
            ],
          ),
          Menu3(
            label: 'cash_flow',
            home: CashFlowPage.prepare(),
            permission: Permission.cashFlowViewMenu,
            permissions: [
              Permission.cashFlowViewMenu,
              Permission.cashFlowApprove,
              Permission.cashFlowCreate,
              Permission.cashFlowEdit,
            ],
          ),
          Menu3(
            label: 'invoice_receipt',
            home: InvoiceReceiptPage.prepare(),
            permission: PermissionFinance.invoiceReceiptViewMenu,
            permissions: [
              PermissionFinance.invoiceReceiptViewMenu,
              PermissionFinance.invoiceReceiptExportPdf,
              PermissionFinance.invoiceReceiptExportExcel,
            ],
          ),
          Menu3(
            label: 'invoice_receive',
            home: const InvoiceReceivePage(),
            permission: Permission.invoiceReceiveViewMenu,
            permissions: [
              Permission.invoiceReceiveViewMenu,
              Permission.invoiceReceiveCreate,
              Permission.invoiceReceiveEdit,
              Permission.invoiceReceiveDelete,
              Permission.invoiceReceiveConfirmFinance,
              Permission.invoiceReceiveApproveHeadAccounting,
            ],
          ),
          Menu3(
            label: 'invoice_summary'.tr(),
            home: InvoiceSummaryPage.prepare(),
            permission: PermissionFinance.invoiceSummaryViewMenu,
            permissions: [
              PermissionFinance.invoiceSummaryViewMenu,
              PermissionFinance.invoiceSummaryExportPdf,
              PermissionFinance.deliveryNoteInvoiceExportExcel,
            ],
          ),
        ],
      ),
    ],
  ),
];
