import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_query/material_request_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form_create/request_form_reject_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RejectButton extends StatelessWidget {
  const RejectButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      permission: Permission.requestFormReject,
      action: DataAction.approval,
      onPressed: () async {
        final queryBloc = context.read<PurchaseRequestQueryBloc>();
        final success = await Navigator.push(
          context,
          RequestFormRejectPage.route(
            status: PurchaseRequestStatus.confirm,
            close: false,
          ),
        );
        if (success ?? false) {
          queryBloc.add(
            PurchaseRequestQueryEvent.fetch(
              status: PurchaseRequestStatus.input,
              isRequestForm: true,
              isOrder: true,
              departments: UserRepositoryApp.instance.departments,
            ),
          );
        }
      },
    );
  }
}
