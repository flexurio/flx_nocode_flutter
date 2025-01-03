import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail/material_request_detail_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_query/material_request_detail_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialRequestDetailRejectForManagerButton extends StatelessWidget {
  const MaterialRequestDetailRejectForManagerButton._({
    required this.materialRequestDetail,
    required this.bloc,
    required this.queryBloc,
  });

  static Widget prepare({
    required List<PurchaseRequestDetail> materialRequestDetails,
    required MaterialRequestDetailBloc bloc,
    required MaterialRequestDetailQueryBloc queryBloc,
  }) {
    return BlocProvider(
      create: (context) => bloc,
      child: MaterialRequestDetailRejectForManagerButton._(
        bloc: bloc,
        materialRequestDetail: materialRequestDetails,
        queryBloc: queryBloc,
      ),
    );
  }

  final List<PurchaseRequestDetail> materialRequestDetail;
  final MaterialRequestDetailBloc bloc;
  final MaterialRequestDetailQueryBloc queryBloc;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.reject;
    final department = UserRepositoryApp.instance.department;
    final isDepartment = department?.id == 'PC';

    return BlocBuilder<MaterialRequestDetailBloc, MaterialRequestDetailState>(
      bloc: bloc,
      builder: (context, state) {
        return Button.small(
          permission: Permission.purchaseRequestDetailRejectForManager,
          action: action,
          color: Colors.red,
          isInProgress: state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          ),
          onPressed: () async {
            if (materialRequestDetail.isEmpty) {
              Toast(context).fail('you must to select the data');
            } else {
              final success = await _showReworkDialog(
                bloc: bloc,
                context: context,
                action: action,
              );
              if (success ?? false) {
                queryBloc.add(
                  MaterialRequestDetailQueryEvent.fetchAll(
                    status: PurchaseRequestStatus.input,
                    department: isDepartment ? null : department,
                  ),
                );
              }
            }
          },
        );
      },
    );
  }

  Future<bool?> _showReworkDialog({
    required BuildContext context,
    required MaterialRequestDetailBloc bloc,
    required DataAction action,
  }) {
    final entity = Entity.purchaseRequestDetail;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<MaterialRequestDetailBloc,
            MaterialRequestDetailState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, entity);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<MaterialRequestDetailBloc,
              MaterialRequestDetailState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmationWithExplanation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                label: '',
                onConfirm: (reason) {
                  bloc.add(
                    MaterialRequestDetailEvent.rejectManager(
                      materialRequestDetail,
                      reason,
                    ),
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
