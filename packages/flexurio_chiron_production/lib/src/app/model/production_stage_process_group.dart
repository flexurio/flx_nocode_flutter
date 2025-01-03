import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_production/src/app/model/production_line.dart';
import 'package:flexurio_chiron_production/src/app/model/production_stage_process.dart';
import 'package:flexurio_chiron_production/src/app/model/production_stage_process_detail.dart';

class ProductionStageProcessGroup {
  ProductionStageProcessGroup({
    required this.product,
    required this.line,
    required this.type,
    required this.items,
  });

  final Product product;
  final ProductionLine line;
  final ProductionStageProcessType type;
  List<ProductionStageProcessDetail> items;
}
