import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_query/material_request_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form_create/request_form_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestFormEditButton extends StatelessWidget {
  const RequestFormEditButton({
    required this.materialRequest,
    super.key,
  });

  final MaterialRequest materialRequest;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.requestFormEdit,
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = context.read<PurchaseRequestQueryBloc>();
        await Navigator.push(
          context,
          RequestFormCreatePage.route(materialRequest: materialRequest),
        );
        queryBloc.add(
          PurchaseRequestQueryEvent.fetch(
            status: PurchaseRequestStatus.input,
            isRequestForm: true,
            departments: UserRepositoryApp.instance.departments,
          ),
        );
      },
    );
  }
}
