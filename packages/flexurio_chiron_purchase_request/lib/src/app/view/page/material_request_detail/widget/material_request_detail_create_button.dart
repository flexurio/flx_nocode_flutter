import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_temporary/material_request_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/material_request_detail_create/purchase_request_detail_create_page.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_vendor/src/app/model/vendors.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    required this.materialGroup,
    required this.onVendorChanged,
    required this.vendor,
    required this.type,
    super.key,
  });
  final PurchaseRequestType type;
  final Vendor? vendor;
  final MaterialGroup? materialGroup;
  final void Function(Vendor?) onVendorChanged;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: null,
      action: DataAction.add,
      entity: Entity.material,
      onPressed:
          materialGroup != null ? () => _showCreateDialog(context) : null,
    );
  }

  void _showCreateDialog(BuildContext context) {
    final temporaryBloc = context.read<MaterialRequestDetailTemporaryBloc>();
    showDialog<void>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.transparent,
          children: [
            PurchaseRequestDetailCreatePage.prepare(
              materialGroup: materialGroup!,
              temporaryBloc: temporaryBloc,
              onVendorChanged: onVendorChanged,
              vendor: vendor,
              isOrder: type == PurchaseRequestType.purchaseOrder,
              isExternal: false,
            ),
          ],
        );
      },
    );
  }
}
