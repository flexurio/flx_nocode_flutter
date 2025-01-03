import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail/material_request_detail_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialRequestDetailApproveButton extends StatelessWidget {
  const MaterialRequestDetailApproveButton({
    required this.onPressed,
    super.key,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialRequestDetailBloc, MaterialRequestDetailState>(
      builder: (context, state) {
        return Button.small(
          permission: Permission.purchaseRequestDetailConfirm,
          action: DataAction.approve,
          onPressed: onPressed,
          isInProgress: state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          ),
        );
      },
    );
  }
}
