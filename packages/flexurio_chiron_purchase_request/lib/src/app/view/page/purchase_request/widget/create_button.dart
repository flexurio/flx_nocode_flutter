import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_query/material_request_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/purchase_request_create/purchase_request_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialRequestCreateButton extends StatelessWidget {
  const MaterialRequestCreateButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: Permission.purchaseRequestCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<PurchaseRequestQueryBloc>();
        final success = await Navigator.push(
          context,
          MaterialRequestCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const PurchaseRequestQueryEvent.fetch());
        }
      },
    );
  }
}
