import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class EntityFinance extends EntityY {
  const EntityFinance({
    required super.titleX,
    required super.subtitleX,
    required super.iconPath,
  });

  static Entity get invoiceReceipt => const Entity(
        titleX: 'invoice_receipt',
        subtitleX: 'invoice_receipt',
        iconPath: 'bill',
      );

  static Entity get invoiceRecapByType => const Entity(
        titleX: 'invoice_recap_by_type',
        subtitleX: 'invoice_recap_by_type',
        iconPath: 'bill',
      );

  static Entity get paymentSettlement => const Entity(
        titleX: 'payment_settlement',
        subtitleX: 'payment_settlement',
        iconPath: 'bill',
      );
}
