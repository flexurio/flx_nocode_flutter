import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_query/material_request_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form_view/request_form_view_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewButton extends StatelessWidget {
  const ViewButton({
    required this.materialRequest,
    required this.status,
    required this.showStatus,
    super.key,
  });

  final MaterialRequest materialRequest;
  final PurchaseRequestStatus? status;
  final bool showStatus;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: null,
      action: DataAction.view,
      onPressed: () async {
        final queryBloc = context.read<PurchaseRequestQueryBloc>();
        final success = await Navigator.push(
          context,
          RequestFormViewPage.route(
            materialRequest: materialRequest,
            status: status,
            showStatus: showStatus,
          ),
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
