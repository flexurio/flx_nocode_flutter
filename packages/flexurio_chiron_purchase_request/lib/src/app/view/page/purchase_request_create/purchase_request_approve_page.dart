import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail/material_request_detail_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_query/material_request_detail_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/purchase_request_create/widget/detail_approve_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/purchase_request_create/widget/detail_reject_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/purchase_request_create/widget/detail_reject_manager_button.dart';

import 'package:appointment/src/app/view/widget/data_table_set_2.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';

class PurchaseRequestApproveRejectPage extends StatefulWidget {
  const PurchaseRequestApproveRejectPage._({
    required this.status,
    required this.action,
  });

  static Route<bool?> route({
    required PurchaseRequestStatus status,
    required DataAction action,
  }) {
    final department = UserRepositoryApp.instance.department;
    final isDepartment =
        department?.id == 'PC' || status == PurchaseRequestStatus.confirm;

    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MaterialRequestDetailQueryBloc()
              ..add(
                MaterialRequestDetailQueryEvent.fetchAll(
                  status: status,
                  departmentIdIn: isDepartment
                      ? [Department.empty()]
                      : UserRepositoryApp.instance.departments,
                  // department: isDepartment ? null : department,
                ),
              ),
          ),
          BlocProvider(create: (context) => MaterialRequestDetailBloc()),
        ],
        child: PurchaseRequestApproveRejectPage._(
          action: action,
          status: status,
        ),
      ),
    );
  }

  final PurchaseRequestStatus status;
  final DataAction action;

  @override
  State<PurchaseRequestApproveRejectPage> createState() =>
      _PurchaseRequestApproveRejectPageState();
}

class _PurchaseRequestApproveRejectPageState
    extends State<PurchaseRequestApproveRejectPage> {
  final _formKey = GlobalKey<FormState>();

  List<PurchaseRequestDetail> checkBox = [];
  late DataAction _action;
  List<PurchaseRequestDetail> checkBoxAll = [];

  void _approve() {
    if (_formKey.currentState!.validate()) {
      _action = DataAction.approval;
      context.read<MaterialRequestDetailBloc>().add(
            MaterialRequestDetailEvent.confirm(checkBox, null),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.purchaseRequest;
    final department = UserRepositoryApp.instance.department;
    final isDepartment = department?.id == 'PC' ||
        widget.status == PurchaseRequestStatus.confirm;
    return BlocListener<MaterialRequestDetailBloc, MaterialRequestDetailState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(_action, Entity.purchaseRequestDetail);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: BlocListener<MaterialRequestDetailQueryBloc,
          MaterialRequestDetailQueryState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () => <PurchaseRequestDetail>[],
            loaded: (details) {
              checkBoxAll.addAll(details);
              setState(() {});
            },
          );
        },
        child: BlocBuilder<MaterialRequestDetailQueryBloc,
            MaterialRequestDetailQueryState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleFormPanel(
                formKey: _formKey,
                action: widget.action,
                entity: entity,
                size: SingleFormPanelSize.extraLarge,
                children: [
                  DataTableSet2<PurchaseRequestDetail>(
                    status: state.maybeWhen(
                      orElse: () => Status.error,
                      loaded: (_) => Status.loaded,
                      loading: () => Status.progress,
                    ),
                    onRefresh: () => {
                      context.read<MaterialRequestDetailQueryBloc>().add(
                            MaterialRequestDetailQueryEvent.fetchAll(
                              status: widget.status,
                              department: isDepartment ? null : department,
                            ),
                          ),
                      checkBox = [],
                    },
                    key: ValueKey(state.hashCode),
                    data: state.maybeWhen(
                      loaded: (materialRequestDetail) {
                        return materialRequestDetail;
                      },
                      orElse: () => [],
                    ),
                    title: Entity.purchaseRequest.title,
                    search: (materialRequestDetail) => [
                      materialRequestDetail.materialRequest?.id ?? '',
                      materialRequestDetail.materialRequest?.materialGroup.id ??
                          '',
                      materialRequestDetail.material?.id ?? '',
                      materialRequestDetail.material?.name ?? '',
                      materialRequestDetail.product?.name ?? '',
                      materialRequestDetail.quantity.toString(),
                      materialRequestDetail.materialRequest?.dateOfNeed
                              .toString() ??
                          '',
                      materialRequestDetail.unit.id,
                      materialRequestDetail.materialRequest?.vendor?.name ?? '',
                      materialRequestDetail.materialRequest?.department.name ??
                          '',
                    ],
                    actionRight: (refreshButton) => [
                      refreshButton,
                      if (widget.status == PurchaseRequestStatus.input)
                        MaterialRequestDetailRejectForManagerButton.prepare(
                          materialRequestDetails: checkBox,
                          bloc: context.read<MaterialRequestDetailBloc>(),
                          queryBloc:
                              context.read<MaterialRequestDetailQueryBloc>(),
                        ),
                      if (widget.status == PurchaseRequestStatus.input)
                        MaterialRequestDetailApproveButton(
                          onPressed: () {
                            if (checkBox.isEmpty) {
                              Toast(context)
                                  .fail('you must to select the data');
                            } else {
                              _approve();
                            }
                          },
                        ),
                      if (widget.status == PurchaseRequestStatus.confirm)
                        MaterialRequestDetailRejectButton.prepare(
                          isDepartment: isDepartment,
                          materialRequestDetails: checkBox,
                          bloc: context.read<MaterialRequestDetailBloc>(),
                          queryBloc:
                              context.read<MaterialRequestDetailQueryBloc>(),
                        ),
                    ],
                    columns: [
                      DTColumnXX(
                        head: DTHeadXX(
                          label: SizedBox(
                            width: 50,
                            height: 50,
                            child: CheckboxWithText(
                              text: '',
                              initialValue: false,
                              isProgress: state.maybeWhen(
                                orElse: () => false,
                                loading: () => true,
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
                        body: (materialRequestDetail) => DataCell(
                          CheckboxWithText(
                            value: checkBox.contains(materialRequestDetail),
                            initialValue: false,
                            text: '',
                            onChanged: (value) {
                              if (value == true) {
                                checkBox.add(materialRequestDetail);
                                setState(() {});
                              } else {
                                final newState =
                                    List<PurchaseRequestDetail>.from(checkBox)
                                      ..removeWhere(
                                        (element) =>
                                            element == materialRequestDetail,
                                      );
                                checkBox = newState;
                                setState(() {});
                              }
                            },
                          ),
                        ),
                      ),
                      DTColumnXX(
                        head: DTHeadXX(
                          label: const Text('ID'),
                          sortString: (materialRequestDetail) =>
                              materialRequestDetail.materialRequest?.id ?? '',
                        ),
                        body: (materialRequestDetail) => DataCell(
                          Text(materialRequestDetail.materialRequest?.id ?? ''),
                        ),
                      ),
                      DTColumnXX(
                        head: DTHeadXX(
                          label: const Text('Department'),
                          sortString: (materialRequestDetail) =>
                              materialRequestDetail
                                  .materialRequest?.department.name ??
                              '-',
                        ),
                        body: (materialRequestDetail) => DataCell(
                          Text(
                            materialRequestDetail
                                    .materialRequest?.department.name ??
                                '-',
                          ),
                        ),
                      ),
                      DTColumnXX(
                        head: DTHeadXX(
                          label: const Text('Material Group'),
                          sortString: (materialRequestDetail) =>
                              materialRequestDetail
                                  .materialRequest?.materialGroup.id ??
                              '',
                        ),
                        body: (materialRequestDetail) => DataCell(
                          Text(
                            materialRequestDetail
                                    .materialRequest?.materialGroup.id ??
                                '-',
                          ),
                        ),
                      ),
                      DTColumnXX(
                        head: DTHeadXX(
                          label: const Text('Material'),
                          sortString: (materialRequestDetail) =>
                              materialRequestDetail.material?.name ?? '',
                        ),
                        body: (materialRequestDetail) => DataCell(
                          Text(materialRequestDetail.material?.name ?? '-'),
                        ),
                      ),
                      DTColumnXX(
                        head: DTHeadXX(
                          label: const Text('Product'),
                          sortString: (materialRequestDetail) =>
                              materialRequestDetail.product?.name ?? '',
                        ),
                        body: (materialRequestDetail) => DataCell(
                          Text(materialRequestDetail.product?.name ?? '-'),
                        ),
                      ),
                      DTColumnXX(
                        head: DTHeadXX(
                          label: const Text('Quantity'),
                          sortNum: (materialRequestDetail) =>
                              materialRequestDetail.quantity,
                        ),
                        body: (materialRequestDetail) => DataCell(
                          Text(materialRequestDetail.quantity.toString()),
                        ),
                      ),
                      DTColumnXX(
                        head: DTHeadXX(
                          label: const Text('Unit'),
                          sortString: (materialRequestDetail) =>
                              materialRequestDetail.unit.id,
                        ),
                        body: (materialRequestDetail) => DataCell(
                          Text(materialRequestDetail.unit.id),
                        ),
                      ),
                      DTColumnXX(
                        head: const DTHeadXX(
                          label: Text('Fast Track'),
                        ),
                        body: (materialRequestDetail) => DataCell(
                          SizedBox(
                            child: BoolIcon(materialRequestDetail.isFastTrack),
                          ),
                        ),
                      ),
                      DTColumnXX(
                        head: DTHeadXX(
                          label: const Text('Manufacturer'),
                          sortString: (materialRequestDetail) =>
                              materialRequestDetail
                                  .materialRequest?.vendor?.name ??
                              '-',
                        ),
                        body: (materialRequestDetail) => DataCell(
                          Text(
                            materialRequestDetail
                                    .materialRequest?.vendor?.name ??
                                '-',
                          ),
                        ),
                      ),
                      DTColumnXX(
                        head: DTHeadXX(
                          label: Text('design_code'.tr()),
                          sortString: (materialRequestDetail) =>
                              materialRequestDetail
                                  .materialDesign?.designCode ??
                              '-',
                        ),
                        body: (materialRequestDetail) => DataCell(
                          Text(
                            materialRequestDetail.materialDesign?.designCode ??
                                '-',
                          ),
                        ),
                      ),
                      DTColumnXX(
                        head: DTHeadXX(
                          label: const Text('Date of Need'),
                          sortNum: (materialRequestDetail) =>
                              materialRequestDetail.materialRequest?.dateOfNeed
                                  .millisecondsSinceEpoch ??
                              0,
                        ),
                        body: (materialRequestDetail) => DataCell(
                          Text(
                            materialRequestDetail
                                    .materialRequest?.dateOfNeed.yMMMdHm ??
                                '-',
                          ),
                        ),
                      ),
                      DTColumnXX(
                        head: DTHeadXX(
                          label: const Text('Description'),
                          sortString: (materialRequestDetail) =>
                              materialRequestDetail
                                  .materialRequest?.description ??
                              '-',
                        ),
                        body: (materialRequestDetail) => DataCell(
                          Text(
                            materialRequestDetail
                                    .materialRequest?.description ??
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
