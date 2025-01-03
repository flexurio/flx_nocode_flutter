import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail/request_form_detail_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail_query/request_form_detail_query_bloc.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/request_form_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestFormDetailRejectButton extends StatelessWidget {
  const RequestFormDetailRejectButton._({
    required this.materialRequestDetail,
    required this.bloc,
    required this.queryBloc,
    this.department,
    this.materialGroup,
  });

  static Widget prepare({
    required List<RequestFormDetail> materialRequestDetails,
    required RequestFormDetailBloc bloc,
    required RequestFormDetailQueryBloc queryBloc,
    Department? department,
    MaterialGroup? materialGroup,
  }) {
    return BlocProvider(
      create: (context) => bloc,
      child: RequestFormDetailRejectButton._(
        bloc: bloc,
        materialRequestDetail: materialRequestDetails,
        queryBloc: queryBloc,
        department: department,
        materialGroup: materialGroup,
      ),
    );
  }

  final List<RequestFormDetail> materialRequestDetail;
  final RequestFormDetailBloc bloc;
  final RequestFormDetailQueryBloc queryBloc;
  final Department? department;
  final MaterialGroup? materialGroup;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.reject;

    return Button(
      permission: Permission.requestFormDetailConfirm,
      action: action,
      color: Colors.red,
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
              RequestFormDetailQueryEvent.fetchAll(
                status: PurchaseRequestStatus.input,
                department: department,
                materialGroup: materialGroup,
                pageOptions: PageOptions.emptyNoLimit(ascending: false),
              ),
            );
          }
        }
      },
    );
  }

  Future<bool?> _showReworkDialog({
    required BuildContext context,
    required RequestFormDetailBloc bloc,
    required DataAction action,
  }) {
    final entity = Entity.requestFormDetail;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<RequestFormDetailBloc, RequestFormDetailState>(
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
          child: BlocBuilder<RequestFormDetailBloc, RequestFormDetailState>(
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
                    RequestFormDetailEvent.reject(
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
