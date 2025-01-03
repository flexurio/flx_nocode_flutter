import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_query/material_request_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail/request_form_detail_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/request_form_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestFormDeleteButton extends StatelessWidget {
  const RequestFormDeleteButton._({
    required this.materialRequestDetail,
  });

  static Widget prepare({
    required RequestFormDetail materialRequestDetail,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PurchaseRequestQueryBloc(),
        ),
        BlocProvider(
          create: (context) => RequestFormDetailBloc(),
        ),
      ],
      child: RequestFormDeleteButton._(
        materialRequestDetail: materialRequestDetail,
      ),
    );
  }

  final RequestFormDetail materialRequestDetail;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.requestFormDetailDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<RequestFormDetailBloc>();
        final queryBloc = context.read<PurchaseRequestQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
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

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    RequestFormDetailBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<RequestFormDetailBloc, RequestFormDetailState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).success(Message.successDeleted(Entity.supplier));
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<RequestFormDetailBloc, RequestFormDetailState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.supplier,
                label: materialRequestDetail.id.toString(),
                onConfirm: () {
                  bloc.add(
                    RequestFormDetailEvent.delete(materialRequestDetail),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
