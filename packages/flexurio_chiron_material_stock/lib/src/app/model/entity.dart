import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class EntityMaterialStock extends EntityY {
  const EntityMaterialStock({
    required super.titleX,
    required super.subtitleX,
    required super.iconPath,
  });
  static Entity get material => const Entity(
        titleX: 'Material',
        subtitleX: 'material',
        iconPath: 'material',
      );
  static Entity get materialIssue => const Entity(
        titleX: 'Material Issue',
        subtitleX: 'material_issue',
        iconPath: 'material-issue',
      );
  static Entity get materialIssueDetail => const Entity(
        titleX: 'material_issue_detail',
        subtitleX: '',
        iconPath: 'material-issue',
      );
  static Entity get materialReceive => const Entity(
        titleX: 'Material Receive',
        subtitleX: 'material_receive',
        iconPath: 'material-receive',
      );
  static Entity get materialAnalysis => const Entity(
        titleX: 'Material Analysis',
        subtitleX: 'material_analysis',
        iconPath: 'material-receive',
      );
  static Entity get materialStock => const Entity(
        titleX: 'material_stock',
        subtitleX: 'material_stock',
        iconPath: 'layers',
      );
  static Entity get materialStockMutation => const Entity(
        titleX: 'material_stock_mutation',
        subtitleX: 'material_stock_mutation',
        iconPath: 'layers',
      );

}
