import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class EntityAccounting extends EntityY {
  const EntityAccounting({
    required super.titleX,
    required super.subtitleX,
    required super.iconPath,
  });

  static Entity get assetData => const Entity(
        titleX: 'asset_data',
        subtitleX: '',
        iconPath: 'asset-data',
      );

  static Entity get cost => const Entity(
        titleX: 'cost_report',
        subtitleX: 'cost_report',
        iconPath: 'bill',
      );

  static Entity get journalTransaction => const Entity(
        titleX: 'journal_transaction',
        subtitleX: 'journal_transaction',
        iconPath: 'bill',
      );

  static Entity get invoiceDiscount => const Entity(
        titleX: 'invoice_discount',
        subtitleX: 'invoice_discount',
        iconPath: 'bill',
      );

  static Entity get purchaseSummary => const Entity(
        titleX: 'purchase_summary',
        subtitleX: 'purchase_summary',
        iconPath: 'bill',
      );

  static Entity get payment => const Entity(
        titleX: 'payment',
        subtitleX: 'payment',
        iconPath: 'credit-card',
      );

  static Entity get paymentSalary => const Entity(
        titleX: 'payment_salary',
        subtitleX: 'payment_salary',
        iconPath: 'pay-day',
      );

  static Entity get transactionJournal => const Entity(
        titleX: 'Transaction Journal',
        subtitleX: 'Transaction Journal',
        iconPath: 'credit-card',
      );

  static Entity get paymentGeneralExpense => const Entity(
        titleX: 'payment_general_expense',
        subtitleX: 'payment_general_expense',
        iconPath: 'bill',
      );

  static Entity get materialStockInRupiah => const Entity(
        titleX: 'material_stock_in_rupiah',
        subtitleX: 'material_stock_in_rupiah',
        iconPath: 'bill',
      );

  static Entity get productStockInRupiah => const Entity(
        titleX: 'product_stock_in_rupiah',
        subtitleX: 'product_stock_in_rupiah',
        iconPath: 'bill',
      );

  static Entity get agingScheduleAP => const Entity(
        titleX: 'aging_schedule_ap',
        subtitleX: 'aging_schedule_ap',
        iconPath: 'bill',
      );

  static Entity get recapAccountsReceivablePayment => const Entity(
        titleX: 'recap_accounts_receivable_payment',
        subtitleX: 'recap_accounts_receivable_payment',
        iconPath: 'bill',
      );

  static Entity get recapApPayment => const Entity(
        titleX: 'recap_accounts_payable_payment',
        subtitleX: 'recap_accounts_payable_payment',
        iconPath: 'bill',
      );
  static Entity get assetJournalDepreciation => const Entity(
        titleX: 'asset_journal_depreciation',
        subtitleX: 'asset_journal_depreciation',
        iconPath: 'asset-data',
      );

  static Entity get recapUsageMaterialType => const Entity(
        titleX: 'material_usage_report_by_type',
        subtitleX: 'material_usage_report_by_type',
        iconPath: 'bill',
      );

  static Entity get businessDebtReport => const Entity(
        titleX: 'business_debt_report',
        subtitleX: 'business_debt_report',
        iconPath: 'bill',
      );

  static Entity get debtMutationReport => const Entity(
        titleX: 'debt_mutation_report',
        subtitleX: 'debt_mutation_report',
        iconPath: 'bill',
      );

  static Entity get debtCardReportPerSupplier => const Entity(
        titleX: 'debt_card_report_per_supplier',
        subtitleX: 'debt_card_report_per_supplier',
        iconPath: 'bill',
      );

  static Entity get medicalTreatmentExpenseDepartment => const Entity(
        titleX: 'medical_treatment_expense_per_department',
        subtitleX: 'medical_treatment_expense_per_department',
        iconPath: 'bill',
      );
  static Entity get accountsPayablePayment => const Entity(
        titleX: 'recap_accounts_payable_payment',
        subtitleX: 'recap_accounts_payable_payment',
        iconPath: 'bill',
      );
}
