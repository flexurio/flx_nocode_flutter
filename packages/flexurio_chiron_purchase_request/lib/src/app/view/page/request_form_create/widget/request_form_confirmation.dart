import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request/material_request_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form/request_form_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail/request_form_detail_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail_temporary/request_form_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/request_form_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RequestFormConfirmation extends StatefulWidget {
  const RequestFormConfirmation._({
    required this.onPrevious,
    required this.materialGroup,
    required this.department,
    required this.description,
  });

  final void Function() onPrevious;
  final MaterialGroup materialGroup;
  final Department department;
  final String description;

  static Widget prepare({
    required void Function() onPrevious,
    required MaterialGroup materialGroup,
    required Department department,
    required String description,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MaterialRequestBloc()),
        BlocProvider(create: (context) => RequestFormBloc()),
        BlocProvider(create: (context) => RequestFormDetailBloc()),
        BlocProvider(create: (context) => RequestFormBloc()),
      ],
      child: RequestFormConfirmation._(
        onPrevious: onPrevious,
        materialGroup: materialGroup,
        department: department,
        description: description,
      ),
    );
  }

  @override
  State<RequestFormConfirmation> createState() =>
      _RequestFormConfirmationState();
}

class _RequestFormConfirmationState extends State<RequestFormConfirmation> {
  List<RequestFormDetail> checkBox = [];
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MaterialRequestBloc, MaterialRequestState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (materialRequest) {
                context.read<RequestFormDetailBloc>().add(
                      RequestFormDetailEvent.confirm(
                        checkBox,
                        widget.materialGroup,
                        materialRequest,
                      ),
                    );
              },
              error: (error) {},
              orElse: () {},
            );
          },
        ),
        BlocListener<RequestFormDetailBloc, RequestFormDetailState>(
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context)
                    .dataChanged(DataAction.update, Entity.requestFormDetail);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
        ),
      ],
      child: FormAction(
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            action: DataAction.back,
            onPressed: () => widget.onPrevious(),
          ),
          const Gap(12),
          _buildSubmitButton(),
        ],
        children: [
          BlocBuilder<RequestFormDetailTemporaryBloc, List<RequestFormDetail>>(
            builder: (context, temporary) {
              checkBox = temporary;
              return YuhuTable<RequestFormDetail>(
                width: 2000,
                data: temporary,
                columns: [
                  TableColumn(
                    width: 200,
                    title: 'ID',
                    builder: (materialRequestDetail, index) {
                      return Text(materialRequestDetail.id.toString())
                          .canCopy();
                    },
                  ),
                  TableColumn(
                    width: 200,
                    title: 'Request Form',
                    builder: (materialRequestDetail, index) {
                      return Text(materialRequestDetail.materialRequest!.id)
                          .canCopy();
                    },
                  ),
                  TableColumn(
                    width: 200,
                    title: 'Department',
                    builder: (materialRequestDetail, index) {
                      return Text(
                        materialRequestDetail.materialRequest == null
                            ? '-'
                            : materialRequestDetail
                                .materialRequest!.department.name,
                      );
                    },
                  ),
                  TableColumn(
                    width: 200,
                    title: 'Material Group',
                    builder: (materialRequestDetail, index) {
                      return Text(
                        materialRequestDetail.materialRequest == null
                            ? '-'
                            : materialRequestDetail
                                .materialRequest!.materialGroup.id,
                      );
                    },
                  ),
                  TableColumn(
                    width: 200,
                    title: 'Material Type',
                    builder: (materialRequestDetail, index) {
                      return Text(
                        materialRequestDetail.materialType == null
                            ? '-'
                            : materialRequestDetail.materialType!.id,
                      );
                    },
                  ),
                  TableColumn(
                    width: 200,
                    title: 'Material',
                    builder: (materialRequestDetail, index) {
                      return Text(materialRequestDetail.material!.name);
                    },
                  ),
                  TableColumn(
                    width: 200,
                    title: 'Quantity',
                    builder: (materialRequestDetail, index) {
                      return Text(materialRequestDetail.quantity.toString());
                    },
                  ),
                  TableColumn(
                    width: 200,
                    title: 'Unit',
                    builder: (materialRequestDetail, index) {
                      return Text(
                        materialRequestDetail.unit == null
                            ? '-'
                            : materialRequestDetail.unit!.id,
                      );
                    },
                  ),
                  TableColumn(
                    width: 200,
                    title: 'Date of Need',
                    builder: (materialRequestDetail, index) {
                      return Text(
                        materialRequestDetail.materialRequest == null
                            ? '-'
                            : materialRequestDetail
                                .materialRequest!.dateOfNeed.yMMMdHm,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  void _submit() {
    final purchaseRequestDetails = context
        .read<RequestFormDetailTemporaryBloc>()
        .convertToPurchaseRequestDetails(checkBox);

    final userDepartment = UserRepositoryApp.instance.department!;
    context.read<MaterialRequestBloc>().add(
          MaterialRequestEvent.create(
            dateOfNeed: DateTime.now().add(const Duration(days: 7)),
            materialGroup: widget.materialGroup,
            departmentBudgetingId: widget.department.id,
            departmentId: userDepartment.id,
            description: widget.description,
            vendor: null,
            materialRequestDetails: purchaseRequestDetails,
            isRequestForm: false,
          ),
        );
  }

  BlocBuilder<MaterialRequestBloc, MaterialRequestState> _buildSubmitButton() {
    return BlocBuilder<MaterialRequestBloc, MaterialRequestState>(
      builder: (context, stateMaterialRequest) {
        return BlocBuilder<RequestFormDetailBloc, RequestFormDetailState>(
          builder: (context, stateRequestFormDetail) {
            final isLoadingMaterialRequest = stateMaterialRequest.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );
            final isLoadingRequestFormDetail = stateRequestFormDetail.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );
            return Button(
              isInProgress:
                  isLoadingMaterialRequest || isLoadingRequestFormDetail,
              permission: Permission.requestFormDetailConfirm,
              action: DataAction.approve,
              onPressed: _submit,
            );
          },
        );
      },
    );
  }
}
