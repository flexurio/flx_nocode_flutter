import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail_temporary/request_form_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/request_form_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialRequestDetailTemporaryDeleteButton extends StatelessWidget {
  const MaterialRequestDetailTemporaryDeleteButton({
    required this.materialRequestDetail,
    super.key,
  });

  final RequestFormDetail materialRequestDetail;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.requestFormDetailDelete,
      action: DataAction.delete,
      onPressed: () => _showConfirmationDialog(context),
    );
  }

  Future<bool?> _showConfirmationDialog(BuildContext context) {
    final bloc = context.read<RequestFormDetailTemporaryBloc>();
    final event = RequestFormDetailTemporaryEvent.remove(
      materialRequestDetail.id.toString(),
    );
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return CardConfirmation(
          isProgress: false,
          action: action,
          data: Entity.material,
          label: materialRequestDetail.itemName,
          onConfirm: () {
            bloc.add(event);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
