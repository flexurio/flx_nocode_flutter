import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MaterialIssueDetailPage extends StatelessWidget {
  const MaterialIssueDetailPage._({
    required this.materialIssue,
    required this.action,
    this.product,
    required this.isExternal,
  });
  final bool isExternal;
  final MaterialIssue materialIssue;
  final Product? product;
  final DataAction action;

  static Route<void> route({
    required MaterialIssue materialIssue,
    required DataAction action,
    Product? product,
    required bool isExternal,
  }) {
    return MaterialPageRoute(
      builder: (context) => MaterialIssueDetailPage._(
        materialIssue: materialIssue,
        product: product,
        action: action,
        isExternal: isExternal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        children: [
          const Row(
            children: [BackButton()],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitlePage(entity: EntityMaterialStock.materialIssueDetail),
                    const Gap(12),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: MaterialIssueDetailDataTable.prepare(
                        product: product,
                        materialIssue: materialIssue,
                        action: action,
                        isExternal: isExternal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
