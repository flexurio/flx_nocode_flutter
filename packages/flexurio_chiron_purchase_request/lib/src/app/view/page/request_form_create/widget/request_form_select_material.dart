import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail_query/request_form_detail_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail_temporary/request_form_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as s2;
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart'
    as s3;
import 'package:flexurio_chiron_material/src/app/model/material_type.dart'
    as s1;
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart'
    as s4;
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/request_form_detail.dart';

import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RequestFormSelectMaterial extends StatefulWidget {
  const RequestFormSelectMaterial._({
    required this.onNext,
    required this.onPrevious,
    required this.materialGroup,
    required this.department,
    required this.description,
    required this.onChanged,
    this.isReject = false,
    this.purchaseOrder,
  });

  final void Function() onNext;
  final void Function() onPrevious;
  final void Function(bool) onChanged;
  final MaterialGroup materialGroup;
  final Department department;
  final String description;
  final PurchaseOrder? purchaseOrder;
  final bool? isReject;

  static Widget prepare({
    required void Function() onNext,
    required void Function() onPrevious,
    required MaterialGroup materialGroup,
    required Department department,
    required String description,
    required void Function(bool) onChanged,
    PurchaseOrder? purchaseOrder,
    bool? isReject,
  }) {
    return RequestFormSelectMaterial._(
      onNext: onNext,
      purchaseOrder: purchaseOrder,
      onPrevious: onPrevious,
      materialGroup: materialGroup,
      isReject: isReject,
      department: department,
      description: description,
      onChanged: onChanged,
    );
  }

  @override
  State<RequestFormSelectMaterial> createState() =>
      _RequestFormSelectMaterialState();
}

class _RequestFormSelectMaterialState extends State<RequestFormSelectMaterial> {
  final _formKey = GlobalKey<FormState>();
  late List<RequestFormDetail> checkBox = [];
  bool allEmpty = true;

  void _approve() {
    if (_formKey.currentState!.validate()) {
      context.read<RequestFormDetailTemporaryBloc>().add(
            RequestFormDetailTemporaryEvent.addAll(
              requestFormDetails: checkBox,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestFormDetailQueryBloc, RequestFormDetailQueryState>(
      builder: (context, state) {
        return FormAction(
          formKey: _formKey,
          actions: [
            Button(
              permission: null,
              isSecondary: true,
              action: DataAction.back,
              onPressed: () => widget.onPrevious(),
            ),
            const Gap(12),
            Button(
              permission: null,
              action: DataAction.next,
              onPressed: () {
                if (checkBox.isEmpty) {
                  Toast(context).fail('you must to select the data');
                } else {
                  final allEmpty = checkBox.every((item) {
                    return item.material?.id.isEmpty ?? true;
                  });

                  if (allEmpty == true) {
                    widget.onChanged.call(true);
                    _approve();
                    widget.onNext();
                  }

                  if (allEmpty == false) {
                    widget.onChanged.call(false);
                    _approve();
                    widget.onNext();
                  }
                }
              },
            ),
          ],
          children: [
            state.maybeWhen(
              loaded: (materialRequestDetails) {
                final sss =
                    List<RequestFormDetail>.from(materialRequestDetails.data);

                sss.add(
                  RequestFormDetail(
                    id: 0,
                    quantity: 0,
                    materialRequestFormId: '',
                    isFastTrack: false,
                    status: RequestFormDetailStatus.input,
                    materialType: s1.MaterialType.empty(),
                    material: s2.Material.empty(),
                    materialRequest: s3.MaterialRequest.empty(),
                    unit: s4.MaterialUnit.empty(),
                  ),
                );
                return YuhuTable<RequestFormDetail>(
                  width: 2000,
                  data: materialRequestDetails.data,
                  columns: [
                    TableColumn(
                      width: 80,
                      title: '',
                      builder: (materialRequestDetail, index) {
                        return CheckboxWithText(
                          initialValue: false,
                          text: '',
                          onChanged: (value) {
                            if (value == true) {
                              checkBox.add(materialRequestDetail);
                            } else {
                              final newState =
                                  List<RequestFormDetail>.from(checkBox)
                                    ..removeWhere(
                                      (element) =>
                                          element == materialRequestDetail,
                                    );
                              checkBox = newState;
                            }
                          },
                        );
                      },
                    ),
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
                        return Text(
                          materialRequestDetail.material == null
                              ? ''
                              : materialRequestDetail.material!.name,
                        );
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
              orElse: SizedBox.new,
            ),
          ],
        );
      },
    );
  }
}
