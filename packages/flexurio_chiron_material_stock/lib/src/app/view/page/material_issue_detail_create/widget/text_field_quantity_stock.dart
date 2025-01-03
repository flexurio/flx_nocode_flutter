import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class FTextFormFieldQuantityStock extends StatefulWidget {
  const FTextFormFieldQuantityStock({
    required this.quantityStockController,
    required this.materialIssueDetail,
    required this.material,
    super.key,
  });

  final TextEditingController quantityStockController;
  final MaterialIssueDetail materialIssueDetail;
  final model.Material material;

  static Widget prepare({
    required MaterialIssueDetail materialIssueDetail,
    required model.Material material,
    required TextEditingController quantityStockController,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => MaterialStockQueryBloc(
        isExternal: isExternal,
      )..add(
          MaterialStockQueryEvent.fetch(material: material),
        ),
      child: FTextFormFieldQuantityStock(
        material: material,
        materialIssueDetail: materialIssueDetail,
        quantityStockController: quantityStockController,
      ),
    );
  }

  @override
  State<FTextFormFieldQuantityStock> createState() =>
      _FTextFormFieldQuantityStockState();
}

class _FTextFormFieldQuantityStockState
    extends State<FTextFormFieldQuantityStock> {
  @override
  Widget build(BuildContext context) {
    return FTextFormField(
      labelText: 'quantity_stock'.tr(),
      enabled: false,
      controller: widget.quantityStockController,
      inputFormatters: [
        ThousandsFormatter(),
      ],
    );
  }
}
