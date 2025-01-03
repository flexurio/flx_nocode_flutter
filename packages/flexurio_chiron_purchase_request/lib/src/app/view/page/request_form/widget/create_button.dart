import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_query/material_request_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form_create/request_form_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestFormCreateButton extends StatelessWidget {
  const RequestFormCreateButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: Permission.requestFormCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<PurchaseRequestQueryBloc>();
        final success = await Navigator.push(
          context,
          RequestFormCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(
            const PurchaseRequestQueryEvent.fetch(
              status: PurchaseRequestStatus.input,
              isRequestForm: true,
            ),
          );
        }
      },
    );
  }
}
