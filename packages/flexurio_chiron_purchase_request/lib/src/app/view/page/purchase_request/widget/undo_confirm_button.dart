import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_query/material_request_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/purchase_request_create/purchase_request_undo_confirm_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UndoConfirmButton extends StatelessWidget {
  const UndoConfirmButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      permission: Permission.purchaseRequestDetailUndoConfirm,
      action: DataAction.undoConfirm,
      onPressed: () async {
        final queryBloc = context.read<PurchaseRequestQueryBloc>();
        final success = await Navigator.push(
          context,
          PurchaseRequestUndoConfirmPage.route(
            action: DataAction.undoConfirm,
            status: PurchaseRequestStatus.confirm,
          ),
        );
        if (success ?? false) {
          queryBloc.add(const PurchaseRequestQueryEvent.fetch());
        }
      },
    );
  }
}
