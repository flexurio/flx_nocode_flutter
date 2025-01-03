import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail/material_request_detail_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_query/material_request_detail_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchaseRequestDetailUndoConfirmButton extends StatelessWidget {
  const PurchaseRequestDetailUndoConfirmButton._({
    required this.materialRequestDetail,
    required this.bloc,
    required this.queryBloc,
    this.isDepartment,
  });

  static Widget prepare({
    required List<PurchaseRequestDetail> materialRequestDetails,
    required MaterialRequestDetailBloc bloc,
    required MaterialRequestDetailQueryBloc queryBloc,
    bool? isDepartment,
  }) {
    return BlocProvider(
      create: (context) => bloc,
      child: PurchaseRequestDetailUndoConfirmButton._(
        bloc: bloc,
        materialRequestDetail: materialRequestDetails,
        queryBloc: queryBloc,
        isDepartment: isDepartment,
      ),
    );
  }

  final List<PurchaseRequestDetail> materialRequestDetail;
  final MaterialRequestDetailBloc bloc;
  final MaterialRequestDetailQueryBloc queryBloc;
  final bool? isDepartment;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.undoConfirm;
    final department = UserRepositoryApp.instance.department;

    return Button.small(
      permission: null,
      action: action,
      color: Colors.blue,
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
                status: PurchaseRequestStatus.confirm,
                department: isDepartment! ? null : department,
              ),
            );
          }
        }
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
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                label: '',
                onConfirm: () {
                  bloc.add(
                    MaterialRequestDetailEvent.undoConfirm(
                        materialRequestDetail),
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
