import 'package:flexurio_chiron_accounting/src/app/model/permission.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounting_cogs_report/accounting_cogs_report_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounts_payable_payment/accounts_payable_payment_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounts_receivable_payment/accounts_receivable_payment_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/aging_schedule_ap/aging_schedule_ap_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/asset_data/asset_data_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/asset_journal_depreciation/asset_journal_depreciation_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/asset_location/asset_location_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/asset_type/asset_type_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/balance_group/balance_group_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/budget_realization/budget_realization_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/budget_type/budget_type_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/business_debt_report/business_debt_report_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/chart_of_account_group/chart_of_account_group_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/chart_of_account_number/chart_of_account_number_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/cost_report_discount/cost_report_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/debt_card_report_per_supplier/debt_card_report_per_supplier_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/debt_mutation_report/debt_mutation_report_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/ebitda/ebitda_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/general_journal/transaction_journal_accounting_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/invoice_discount/invoice_discount_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/journal_estimation/journal_estimation_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/journal_transaction/journal_transaction_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_stock_rupiah/material_stock_rupiah_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_usage/material_usage_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/medical_treatment_expense_department/medical_treatment_expense_department_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_general_expense/payment_general_expense_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_salary_upload/payment_salary_upload_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/product_stock_rupiah/product_stock_rupiah_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/purchase_summary/purchase_summary_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_journal/transaction_journal_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_non_order/transaction_non_order_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_routine/transaction_routine_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/type_cost/type_cost_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

final menu = <Menu1>[
  Menu1(
    label: 'accounting',
    menu: [
      Menu2(
        label: 'Master',
        icon: FontAwesomeIcons.database,
        menu: [
          Menu3(
            label: 'balance_group',
            home: const BalanceGroupPage(),
            permission: PermissionAccounting.balanceGroupViewMenu,
            permissions: [
              PermissionAccounting.balanceGroupViewMenu,
              PermissionAccounting.balanceGroupCreate,
              PermissionAccounting.balanceGroupDelete,
            ],
          ),
          Menu3(
            label: 'Chart of Account Group',
            home: const ChartOfAccountGroupPage(),
            permission: PermissionAccounting.chartOfAccountGroupViewMenu,
            permissions: [
              PermissionAccounting.chartOfAccountGroupViewMenu,
              PermissionAccounting.chartOfAccountGroupCreate,
              PermissionAccounting.chartOfAccountGroupDelete,
              PermissionAccounting.chartOfAccountGroupEdit,
              PermissionAccounting.chartOfAccountGroupExportPdf,
            ],
          ),
          Menu3(
            label: 'Chart of Account Number',
            home: const ChartOfAccountNumberPage(),
            permission: PermissionAccounting.chartOfAccountViewMenu,
            permissions: [
              PermissionAccounting.chartOfAccountViewMenu,
              PermissionAccounting.chartOfAccountCreate,
              PermissionAccounting.chartOfAccountDelete,
              PermissionAccounting.chartOfAccountEdit,
              PermissionAccounting.chartOfAccountExportExcel,
            ],
          ),
          Menu3(
            label: 'budget_type',
            home: const BudgetTypePage(),
            permission: PermissionAccounting.budgetTypeViewMenu,
            permissions: [
              PermissionAccounting.budgetTypeViewMenu,
              PermissionAccounting.budgetTypeCreate,
              PermissionAccounting.budgetTypeDelete,
              PermissionAccounting.budgetTypeEdit,
            ],
          ),
          Menu3(
            label: 'Journal Estimation Type',
            home: const JournalEstimationPage(),
            permission: Permission.journalEstimationViewMenu,
            permissions: [
              Permission.journalEstimationViewMenu,
              Permission.journalEstimationCreate,
              Permission.journalEstimationDelete,
            ],
          ),
          Menu3(
            label: 'transaction_routine',
            home: const TransactionRoutinePage(),
            permission: Permission.transactionRoutineViewMenu,
            permissions: [
              Permission.transactionRoutineViewMenu,
              Permission.transactionRoutineCreate,
              Permission.transactionRoutineDelete,
              Permission.transactionRoutineEdit,
            ],
          ),
          Menu3(
            label: 'type_cost',
            home: const TypeCostPage(),
            permission: PermissionAccounting.typeCostViewMenu,
            permissions: [
              PermissionAccounting.typeCostViewMenu,
              PermissionAccounting.typeCostCreate,
              PermissionAccounting.typeCostDelete,
            ],
          ),
          Menu3(
            label: 'Asset Data',
            home: const AssetDataPage(),
            permission: Permission.assetDataViewMenu,
            permissions: [
              Permission.assetDataViewMenu,
              Permission.assetDataCreate,
              Permission.assetDataDelete,
              Permission.assetDataEdit,
              Permission.assetDataNonActive,
              Permission.assetDataMoving,
              PermissionAccounting.assetDepreciationExportPdf,
              PermissionAccounting.assetDepreciationExportExcel,
              PermissionAccounting.assetDataExportPdf,
            ],
          ),
          Menu3(
            label: 'Asset Location',
            home: const AssetLocationPage(),
            permission: Permission.assetLocationViewMenu,
            permissions: [
              Permission.assetLocationViewMenu,
              Permission.assetLocationCreate,
              Permission.assetLocationDelete,
            ],
          ),
          Menu3(
            label: 'Asset Type',
            home: const AssetTypePage(),
            permission: Permission.assetTypeViewMenu,
            permissions: [
              Permission.assetTypeViewMenu,
              Permission.assetTypeCreate,
              Permission.assetTypeDelete,
              Permission.assetTypeEdit,
            ],
          ),
        ],
      ),
      Menu2(
        label: 'transaction',
        icon: FontAwesomeIcons.fileInvoice,
        menu: [
          Menu3(
            label: 'transaction_non_order',
            home: const TransactionNonOrderPage(),
            permission: Permission.transactionNonOrderCreate,
            permissions: [
              Permission.transactionNonOrderViewMenu,
              Permission.transactionNonOrderCreate,
              Permission.transactionNonOrderDelete,
              Permission.transactionRoutineCreate,
            ],
          ),
          Menu3(
            label: 'general_journal',
            home: const TransactionJournalAccountingPage(),
            permission:
                PermissionAccounting.transactionJournalAccountingViewMenu,
            permissions: [
              PermissionAccounting.transactionJournalAccountingViewMenu,
              PermissionAccounting.transactionJournalAccountingCreate,
              PermissionAccounting.transactionJournalAccountingDelete,
            ],
          ),
          Menu3(
            label: 'asset_journal_depreciation',
            home: const AssetJournalDepreciationPage(),
            permission: PermissionAccounting.assetJournalDepreciationViewMenu,
            permissions: [
              PermissionAccounting.assetJournalDepreciationViewMenu,
              PermissionAccounting.assetJournalDepreciationCreate,
              PermissionAccounting.assetJournalDepreciationDelete,
            ],
          ),
          Menu3(
            label: 'upload_salary',
            home: PaymentSalaryUploadPage.prepare(),
            permission: Permission.paymentSalaryUpload,
            permissions: [
              Permission.paymentSalaryUpload,
            ],
          ),
          Menu3(
            label: 'Transaction Journal',
            home: TransactionJournalPage.prepare(),
            permission: Permission.paymentViewMenu,
            permissions: [
              Permission.paymentViewMenu,
              Permission.paymentSalesCreate,
              Permission.paymentCreate,
              Permission.paymentExportPdf,
              Permission.paymentBankReceiptPdf,
              PermissionAccounting.transactionJournalEdit,
            ],
          ),
          Menu3(
            label: 'payment_general_expense',
            home: PaymentGeneralExpensePage.prepare(),
            permission: PermissionAccounting.paymentGeneralExpenseViewMenu,
            permissions: [
              PermissionAccounting.paymentGeneralExpenseViewMenu,
            ],
          ),
        ],
      ),
      Menu2(
        label: 'report',
        icon: FontAwesomeIcons.chartBar,
        menu: [
          Menu3(
            label: 'cost_report',
            home: CostReportPage.prepare(),
            permission: PermissionAccounting.costReportViewMenu,
            permissions: [
              PermissionAccounting.costReportViewMenu,
              PermissionAccounting.costReportExportPdf,
              PermissionAccounting.costReportDetailExportPdf,
              PermissionAccounting.costReportDetailWithTotalExportPdf,
            ],
          ),
          Menu3(
            label: 'medical_treatment_expense_per_department',
            home: MedicalTreatmentExpenseDepartmentPage.prepare(),
            permission:
                PermissionAccounting.medicalTreatmentExpenseDepartmentViewMenu,
            permissions: [
              PermissionAccounting.medicalTreatmentExpenseDepartmentViewMenu,
              PermissionAccounting.medicalTreatmentExpenseDepartmentExportExcel,
              PermissionAccounting.medicalTreatmentExpenseDepartmentExportPdf,
              PermissionAccounting.productStockMutationRecapExportPdf,
            ],
          ),
          Menu3(
            label: 'journal_transaction',
            home: JournalTransactionPage.prepare(),
            permission: PermissionAccounting.journalTransactionViewMenu,
            permissions: [
              PermissionAccounting.journalTransactionViewMenu,
              PermissionAccounting.journalTransactionExportExcel,
            ],
          ),
          Menu3(
            label: 'invoice_discount',
            home: InvoiceDiscountPage.prepare(),
            permission: PermissionAccounting.invoiceDiscountExportPdf,
            permissions: [
              PermissionAccounting.invoiceDiscountViewMenu,
              PermissionAccounting.invoiceDiscountExportPdf,
            ],
          ),
          Menu3(
            label: 'EBITDA',
            home: EbitdaPage.prepare(),
            permission: Permission.ebitdaViewMenu,
            permissions: [
              Permission.ebitdaViewMenu,
              Permission.ebitdaPrint,
              Permission.ebitdaUpload,
            ],
          ),
          Menu3(
            label: 'Cost of Goods Sold',
            home: AccountingCogsReportPage.prepare(),
            permission: PermissionAccounting.accountingCogsReportViewMenu,
            permissions: [
              PermissionAccounting.accountingCogsReportViewMenu,
              PermissionAccounting.accountingCogsReportExportExcel,
              PermissionAccounting.accountingCogsReportExportPdf,
            ],
          ),
          Menu3(
            label: Entity.budgetRealization.title,
            home: BudgetRealizationCostPage.prepare(),
            permission: Permission.budgetRealizationViewMenu,
            permissions: [
              Permission.budgetRealizationViewMenu,
              Permission.budgetRealizationExportExcel,
            ],
          ),
          Menu3(
            label: 'purchase_summary',
            home: PurchaseSummaryPage.prepare(),
            permission: PermissionAccounting.purchaseSummaryViewMenu,
            permissions: [
              PermissionAccounting.purchaseSummaryViewMenu,
              PermissionAccounting.purchaseSummaryDetailExportPdf,
              PermissionAccounting.purchaseSummaryGlobalExportPdf,
            ],
          ),
          Menu3(
            label: 'recap_accounts_receivable_payment',
            home: AccountsReceivablePaymentPage.prepare(),
            permission:
                PermissionAccounting.recapAccountsReceivablePaymentViewMenu,
            permissions: [
              PermissionAccounting.recapAccountsReceivablePaymentViewMenu,
              PermissionAccounting
                  .recapAccountsReceivablePaymentDetailExportPdf,
              PermissionAccounting
                  .recapAccountsReceivablePaymentGlobalExportPdf,
              PermissionAccounting.recapAccountsReceivablePaymentValueExportPdf,
            ],
          ),
          Menu3(
            label: 'recap_accounts_payable_payment',
            home: AccountsPayablePaymentPage.prepare(),
            permission:
                PermissionAccounting.recapAccountsPayablePaymentViewMenu,
            permissions: [
              PermissionAccounting.recapAccountsPayablePaymentViewMenu,
              PermissionAccounting.recapAccountsPayablePaymentDetailExportPdf,
              PermissionAccounting.recapAccountsPayablePaymentGlobalExportPdf,
            ],
          ),
          Menu3(
            label: 'material_usage_report_by_type',
            home: MaterialUsagePage.prepare(),
            permission: PermissionAccounting.recapUsageMaterialTypeViewMenu,
            permissions: [
              PermissionAccounting.recapUsageMaterialTypeViewMenu,
              PermissionAccounting.recapUsageMaterialDetailExportPdf,
              PermissionAccounting.recapUsageMaterialGlobalExportPdf,
            ],
          ),
          Menu3(
            label: 'business_debt_report',
            home: BusinessDebtReportPage.prepare(),
            permission: PermissionAccounting.businessDebtReportViewMenu,
            permissions: [
              PermissionAccounting.businessDebtReportViewMenu,
              PermissionAccounting.debtBalanceDetailInvoiceDateExportPdf,
              PermissionAccounting.debtBalanceGlobalInvoiceDateExportPdf,
              PermissionAccounting.debtBalanceDetailDueDateExportPdf,
              PermissionAccounting.debtBalanceGlobalDueDateExportPdf,
            ],
          ),
          Menu3(
            label: 'debt_mutation_report',
            home: DebtMutationReportPage.prepare(),
            permission: PermissionAccounting.debtMutationReportViewMenu,
            permissions: [
              PermissionAccounting.debtMutationReportViewMenu,
              PermissionAccounting.debtMutationReportDueDateExportPdf,
              PermissionAccounting.debtMutationReportInvoiceDateExportPdf,
            ],
          ),
          Menu3(
            label: 'debt_card_report_per_supplier',
            home: DebtCardReportPerSupplierPage.prepare(),
            permission: PermissionAccounting.debtCardReportPerSupplierViewMenu,
            permissions: [
              PermissionAccounting.debtCardReportPerSupplierViewMenu,
              PermissionAccounting.debtCardReportPerSupplierDueDateExportPdf,
              PermissionAccounting
                  .debtCardReportPerSupplierInvoiceDateExportPdf,
              PermissionAccounting
                  .debtCardReportPerSupplierInvoiceDateNewExportPdf,
            ],
          ),
          Menu3(
            label: 'material_stock_in_rupiah',
            home: MaterialStockRupiahPage.prepare(),
            permission: PermissionAccounting.materialStockInRupiahViewMenu,
            permissions: [
              PermissionAccounting.materialStockInRupiahViewMenu,
              PermissionAccounting.materialStockInRupiahExportPdf,
              PermissionAccounting.materialUsageSummaryRupiahExportPdf,
              PermissionAccounting
                  .materialReceiptDetailSummaryByPurchaseOrderExportPdf,
              PermissionAccounting.materialReceiptSummaryRupiahExportPdf,
              PermissionAccounting.materialLoansBorrowingsExportPdf,
              PermissionAccounting.materialMutationRupiahExportPdf,
              PermissionAccounting.materialReturnRupiahExportPdf,
              PermissionAccounting.materialStockCardRupiahExportPdf,
              PermissionAccounting.materialMutationLoansBorrowingsExportPdf,
              PermissionAccounting.materialStatusRupiahExportPdf,
              PermissionAccounting.materialUsageBatchExportPdf,
              PermissionAccounting.materialUsageBatchGlobalExportPdf,
              PermissionAccounting.materialUsageBatchDetailExportPdf
            ],
          ),
          Menu3(
            label: 'Product Stock Rupiah',
            home: ProductStockRupiahPage.prepare(),
            permission: PermissionAccounting.productStockInRupiahViewMenu,
            permissions: [
              PermissionAccounting.materialStockInRupiahViewMenu,
            ],
          ),
          Menu3(
            label: 'Aging Schedule AP',
            home: AgingScheduleAPPage.prepare(),
            permission: PermissionAccounting.agingScheduleAPViewMenu,
            permissions: [
              PermissionAccounting.agingScheduleAPViewMenu,
            ],
          ),
        ],
      ),
    ],
  ),
];
