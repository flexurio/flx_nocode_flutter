import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail/request_form_detail_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail_query/request_form_detail_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/request_form_detail.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form_create/widget/approve_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form_create/widget/closes_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form_create/widget/detail_reject_button.dart';

import 'package:appointment/src/app/view/widget/data_table_set.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class RequestFormRejectPage extends StatefulWidget {
  const RequestFormRejectPage._({
    required this.status,
    this.close,
  });

  final PurchaseRequestStatus status;
  final bool? close;

  static Route<bool?> route({
    required PurchaseRequestStatus status,
    bool? close,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RequestFormDetailQueryBloc(),
          ),
          BlocProvider(
            create: (context) => RequestFormDetailBloc(),
          ),
        ],
        child: RequestFormRejectPage._(
          status: status,
          close: close,
        ),
      ),
    );
  }

  @override
  State<RequestFormRejectPage> createState() => _RequestFormRejectPageState();
}

class _RequestFormRejectPageState extends State<RequestFormRejectPage> {
  List<RequestFormDetail> checkBox = [];
  List<RequestFormDetail> checkBoxAll = [];

  @override
  void initState() {
    late PurchaseRequestStatus purchaseRequestStatus;
    if (widget.close != null) {
      if (widget.close == true) {
        purchaseRequestStatus = PurchaseRequestStatus.confirm;
      } else {
        purchaseRequestStatus = PurchaseRequestStatus.input;
      }
    } else {
      purchaseRequestStatus = PurchaseRequestStatus.input;
    }
    context.read<RequestFormDetailQueryBloc>()
      ..add(
        RequestFormDetailQueryEvent.fetchAll(
          status: purchaseRequestStatus,
          // department: UserRepositoryApp.instance.department,
          departments: UserRepositoryApp.instance.departments,
          isRequestForm: true,
          pageOptions: PageOptions.emptyNoLimit(ascending: false),
        ),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final action =
        widget.close == true ? DataAction.close : DataAction.approval;
    final entity = Entity.requestForm;
    return BlocListener<RequestFormDetailBloc, RequestFormDetailState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(action, Entity.purchaseRequestDetail);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child:
          BlocListener<RequestFormDetailQueryBloc, RequestFormDetailQueryState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () => <RequestFormDetail>[],
            loaded: (details) {
              checkBoxAll.addAll(details.data);
              setState(() {});
            },
          );
        },
        child: BlocBuilder<RequestFormDetailQueryBloc,
            RequestFormDetailQueryState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleFormPanel(
                action: action,
                entity: entity,
                size: SingleFormPanelSize.extraLarge,
                children: [
                  DataTableSetJanganDipakaiLagi<RequestFormDetail>(
                    isError: state.maybeWhen(
                      error: (_) => true,
                      orElse: () => false,
                    ),
                    onRefresh: () => {
                      context.read<RequestFormDetailQueryBloc>().add(
                            RequestFormDetailQueryEvent.fetchAll(
                              status: widget.close == true
                                  ? PurchaseRequestStatus.confirm
                                  : PurchaseRequestStatus.input,
                              department: UserRepositoryApp.instance.department,
                              isRequestForm: true,
                              pageOptions:
                                  PageOptions.emptyNoLimit(ascending: false),
                            ),
                          ),
                      checkBox = [],
                    },
                    key: ValueKey(state.hashCode),
                    isProgress: state.maybeWhen(
                      loading: (l) => true,
                      orElse: () => false,
                    ),
                    data: state.maybeWhen(
                      loaded: (requestFormDetail) {
                        return requestFormDetail.data;
                      },
                      orElse: () => [],
                    ),
                    title: Entity.requestForm.title,
                    search: (requestFormDetail) => [
                      requestFormDetail.id.toString(),
                      requestFormDetail.materialRequest?.id ?? '',
                      requestFormDetail.materialRequest?.materialGroup.id ?? '',
                      requestFormDetail.material?.name ?? '',
                      requestFormDetail.materialType?.id ?? '',
                      requestFormDetail.material?.name ?? '',
                      requestFormDetail.quantity.toString(),
                      requestFormDetail.unit?.id ?? '',
                      requestFormDetail.materialRequest?.dateOfNeed.yMMMdHm ??
                          '',
                    ],
                    actionRight: [
                      if (widget.status == PurchaseRequestStatus.confirm &&
                          widget.close == false)
                        RequestFormDetailRejectButton.prepare(
                          materialRequestDetails: checkBox,
                          bloc: context.read<RequestFormDetailBloc>(),
                          queryBloc: context.read<RequestFormDetailQueryBloc>(),
                          department: UserRepositoryApp.instance.department,
                          materialGroup: MaterialGroup.empty(),
                        ),
                      if (widget.status == PurchaseRequestStatus.confirm &&
                          widget.close == false)
                        RequestFormDetailApproveButton.prepare(
                          requestFormDetails: checkBox,
                          bloc: context.read<RequestFormDetailBloc>(),
                          queryBloc: context.read<RequestFormDetailQueryBloc>(),
                          department: UserRepositoryApp.instance.department,
                          materialGroup: MaterialGroup.empty(),
                        ),
                      if (widget.close == true)
                        RequestFormDetailClosesButton.prepare(
                          requestFormDetails: checkBox,
                          bloc: context.read<RequestFormDetailBloc>(),
                          queryBloc: context.read<RequestFormDetailQueryBloc>(),
                          department: UserRepositoryApp.instance.department,
                          materialGroup: MaterialGroup.empty(),
                        ),
                    ],
                    columns: [
                      DTColumnX(
                        head: DTHeadX(
                          label: SizedBox(
                            width: 50,
                            height: 50,
                            child: CheckboxWithText(
                              text: '',
                              initialValue: false,
                              isProgress: state.maybeWhen(
                                orElse: () => false,
                                loading: (l) => true,
                              ),
                              onChanged: (value) {
                                if (value) {
                                  checkBox = List.from(checkBoxAll);
                                  setState(() {});
                                } else {
                                  checkBox.clear();
                                  setState(() {});
                                }
                              },
                            ),
                          ),
                        ),
                        body: (requestFormDetail) => DataCell(
                          CheckboxWithText(
                            value: checkBox.contains(requestFormDetail),
                            initialValue: false,
                            text: '',
                            onChanged: (value) {
                              if (value == true) {
                                checkBox.add(requestFormDetail);
                                setState(() {});
                              } else {
                                final newState =
                                    List<RequestFormDetail>.from(checkBox)
                                      ..removeWhere(
                                        (element) =>
                                            element == requestFormDetail,
                                      );
                                checkBox = newState;
                                setState(() {});
                              }
                            },
                          ),
                        ),
                      ),
                      DTColumnX(
                        head: DTHeadX(
                          label: const Text('ID'),
                          sortString: (requestFormDetail) =>
                              requestFormDetail.id.toString(),
                        ),
                        body: (requestFormDetail) => DataCell(
                          Text(requestFormDetail.id.toString()),
                        ),
                      ),
                      DTColumnX(
                        head: DTHeadX(
                          label: const Text('Purchase Request Form'),
                          sortString: (requestFormDetail) =>
                              requestFormDetail.materialRequest!.id,
                        ),
                        body: (requestFormDetail) => DataCell(
                          Text(requestFormDetail.materialRequest!.id),
                        ),
                      ),
                      DTColumnX(
                        head: DTHeadX(
                          label: const Text('Department'),
                          sortString: (requestFormDetail) =>
                              requestFormDetail
                                  .materialRequest?.department.name ??
                              '-',
                        ),
                        body: (requestFormDetail) => DataCell(
                          Text(
                            requestFormDetail
                                    .materialRequest?.department.name ??
                                '-',
                          ),
                        ),
                      ),
                      DTColumnX(
                        head: DTHeadX(
                          label: const Text('Material Group'),
                          sortString: (requestFormDetail) =>
                              requestFormDetail
                                  .materialRequest?.materialGroup.id ??
                              '-',
                        ),
                        body: (requestFormDetail) => DataCell(
                          Text(
                            requestFormDetail
                                    .materialRequest?.materialGroup.id ??
                                '-',
                          ),
                        ),
                      ),
                      DTColumnX(
                        head: DTHeadX(
                          label: const Text('Material'),
                          sortString: (requestFormDetail) =>
                              requestFormDetail.material?.name ?? '-',
                        ),
                        body: (requestFormDetail) => DataCell(
                          Text(requestFormDetail.material?.name ?? '-'),
                        ),
                      ),
                      DTColumnX(
                        head: DTHeadX(
                          label: const Text('Material Type'),
                          sortString: (requestFormDetail) =>
                              requestFormDetail.materialType?.id ?? '-',
                        ),
                        body: (requestFormDetail) => DataCell(
                          Text(requestFormDetail.materialType?.id ?? '-'),
                        ),
                      ),
                      DTColumnX(
                        head: DTHeadX(
                          label: const Text('Quantity'),
                          sortString: (requestFormDetail) =>
                              requestFormDetail.quantity.toString(),
                        ),
                        body: (requestFormDetail) => DataCell(
                          Text(requestFormDetail.quantity.toString()),
                        ),
                      ),
                      DTColumnX(
                        head: DTHeadX(
                          label: const Text('Unit'),
                          sortString: (requestFormDetail) =>
                              requestFormDetail.unit!.id,
                        ),
                        body: (requestFormDetail) => DataCell(
                          Text(
                            requestFormDetail.unit?.id ?? '-',
                          ),
                        ),
                      ),
                      DTColumnX(
                        head: DTHeadX(
                          label: const Text('Date of Need'),
                          sortNum: (requestFormDetail) => requestFormDetail
                              .materialRequest!
                              .dateOfNeed
                              .millisecondsSinceEpoch,
                        ),
                        body: (requestFormDetail) => DataCell(
                          Text(
                            requestFormDetail
                                    .materialRequest?.dateOfNeed.yMMMdHm ??
                                '-',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
