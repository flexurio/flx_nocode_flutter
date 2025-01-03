import 'package:flexurio_erp_core/flexurio_erp_core.dart';


class EntityProductReturn extends EntityY {
  const EntityProductReturn({
    required super.titleX,
    required super.subtitleX,
    required super.iconPath,
  });

  static Entity get recapProductExpenditure => const Entity(
        titleX: 'recap_product_expenditure',
        subtitleX: 'recap_product_expenditure',
        iconPath: 'bill',
      );
  static Entity get recapExpiredProduct => const Entity(
        titleX: 'recap_expired_product',
        subtitleX: 'recap_expired_product',
        iconPath: 'bill',
      );    
}
