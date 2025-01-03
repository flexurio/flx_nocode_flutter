import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class EntityTax extends EntityY {
  const EntityTax({
    required super.titleX,
    required super.subtitleX,
    required super.iconPath,
  });

  static Entity get salesReportTax => const Entity(
        titleX: 'sales_tax_report',
        subtitleX: 'sales_tax_report',
        iconPath: 'bill',
      );
}
