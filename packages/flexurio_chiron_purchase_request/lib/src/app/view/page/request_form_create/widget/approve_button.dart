import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail/request_form_detail_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail_query/request_form_detail_query_bloc.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/request_form_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestFormDetailApproveButton extends StatelessWidget {
  const RequestFormDetailApproveButton({
    required this.requestFormDetails,
    required this.bloc,
    required this.queryBloc,
    super.key,
    this.department,
    this.materialGroup,
  });

  final List<RequestFormDetail> requestFormDetails;
  final RequestFormDetailBloc bloc;
  final RequestFormDetailQueryBloc queryBloc;
  final Department? department;
  final MaterialGroup? materialGroup;

  static Widget prepare({
    required List<RequestFormDetail> requestFormDetails,
    required RequestFormDetailBloc bloc,
    required RequestFormDetailQueryBloc queryBloc,
    Department? department,
    MaterialGroup? materialGroup,
  }) {
    return RequestFormDetailApproveButton(
      bloc: bloc,
      requestFormDetails: requestFormDetails,
      queryBloc: queryBloc,
      department: department,
      materialGroup: materialGroup,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Button(
      action: DataAction.approve,
      permission: Permission.purchaseRequestDetailConfirm,
      onPressed: () async {
        if (requestFormDetails.isEmpty) {
          Toast(context).fail('You must select the data');
        } else {
          final success = await _showApproveDialog(
            context: context,
            bloc: bloc,
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

  Future<bool?> _showApproveDialog({
    required BuildContext context,
    required RequestFormDetailBloc bloc,
  }) {
    final entity = Entity.requestForm;
    return showDialog<bool?>(
      context: context,
      builder: (context) {
        return BlocListener<RequestFormDetailBloc, RequestFormDetailState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(DataAction.approve, entity);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<RequestFormDetailBloc, RequestFormDetailState>(
            bloc: bloc,
            builder: (context, state) {
              final isProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isProgress,
                action: DataAction.approve,
                data: entity,
                onConfirm: () {
                  bloc.add(
                    RequestFormDetailEvent.approveManager(requestFormDetails),
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
