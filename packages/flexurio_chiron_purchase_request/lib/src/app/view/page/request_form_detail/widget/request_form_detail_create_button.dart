import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail_temporary/request_form_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form_detail_create/request_form_detail_create_page.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    required this.materialGroup,
    required this.onVendorChanged,
    required this.vendor,
    super.key,
  });
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
    final temporaryBloc = context.read<RequestFormDetailTemporaryBloc>();
    showDialog<void>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.transparent,
          children: [
            RequestFormDetailCreatePage.prepare(
              materialGroup: materialGroup!,
              temporaryBloc: temporaryBloc,
              onVendorChanged: onVendorChanged,
              vendor: vendor,
            ),
          ],
        );
      },
    );
  }
}
