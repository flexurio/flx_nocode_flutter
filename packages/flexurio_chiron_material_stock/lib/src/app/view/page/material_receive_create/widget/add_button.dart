import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_detail/create_page.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart'
    as material;
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialReceiveAddButton extends StatelessWidget {
  const MaterialReceiveAddButton({
    required this.createType,
    required this.showMaterialDesign,
    required this.onAddDetail,
    super.key,
    this.materialOptions,
    required this.isExternal,  
  });

  final bool isExternal;
  final MaterialReceiveType createType;
  final bool showMaterialDesign;
  final void Function(PurchaseOrderDetail) onAddDetail;
  final List<material.Material>? materialOptions;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: null,
      action: DataAction.add,
      entity: Entity.material,
      onPressed: () async => await _showCreateDialog(context),
    );
  }

  Future<void> _showCreateDialog(
    BuildContext context,
  ) async {
    final purchaseOrderDetail = await showDialog<PurchaseOrderDetail?>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.transparent,
          children: [
            MaterialReceiveDetailCreatePage.prepare(
              createType: createType,
              showMaterialDesignDropdown: showMaterialDesign,
              materialOptions: materialOptions,
              isExternal: isExternal,
            ),
          ],
        );
      },
    );
    if (purchaseOrderDetail != null) {
      onAddDetail.call(purchaseOrderDetail);
    }
  }
}
