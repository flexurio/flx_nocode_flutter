import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail_query/request_form_detail_query_bloc.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/department.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_group.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RequestFormSelectGroup extends StatefulWidget {
  const RequestFormSelectGroup._({
    required this.onChangedMaterialGroup,
    required this.onChangedDescription,
    required this.onChangedDepartment,
    required this.onNext,
    this.purchaseOrder,
  });

  final void Function() onNext;
  final PurchaseOrder? purchaseOrder;
  final void Function(MaterialGroup) onChangedMaterialGroup;
  final void Function(String) onChangedDescription;
  final void Function(Department) onChangedDepartment;

  static Widget prepare({
    required void Function() onNext,
    required void Function(MaterialGroup) onChangedMaterialGroup,
    required void Function(String) onChangedDescription,
    required void Function(Department) onChangedDepartment,
    PurchaseOrder? purchaseOrder,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(MaterialGroupQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
      ],
      child: RequestFormSelectGroup._(
        onNext: onNext,
        purchaseOrder: purchaseOrder,
        onChangedMaterialGroup: onChangedMaterialGroup,
        onChangedDescription: onChangedDescription,
        onChangedDepartment: onChangedDepartment,
      ),
    );
  }

  @override
  State<RequestFormSelectGroup> createState() => _RequestFormSelectGroupState();
}

class _RequestFormSelectGroupState extends State<RequestFormSelectGroup> {
  final _formKey = GlobalKey<FormState>();
  MaterialGroup _materialGroup = MaterialGroup.empty();
  Department _department =
      UserRepositoryApp.instance.department ?? Department.empty();
  final _descriptionController = TextEditingController();
  final userDepartment = UserRepositoryApp.instance.department;
  final allowedMaterialGroupIds = [
    'ALAT DAPUR',
    'ATK',
    'IT COMP',
    'SAFETY',
    'UMUM',
  ];

  @override
  Widget build(BuildContext context) {
    return FormAction(
      formKey: _formKey,
      actions: [
        Button(
          permission: null,
          action: DataAction.next,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (_materialGroup.id != '') {
                if (_materialGroup.id == "IT COMP") {
                  if (_department.id != '') {
                    setState(() {
                      widget.onChangedDescription(
                        _descriptionController.text == ''
                            ? '-'
                            : _descriptionController.text,
                      );
                    });
                    widget.onNext();
                    context.read<RequestFormDetailQueryBloc>().add(
                          RequestFormDetailQueryEvent.fetchAll(
                            status: PurchaseRequestStatus.confirm,
                            department: _department,
                            materialGroup: _materialGroup,
                            isRequestForm: true,
                            pageOptions: PageOptions.emptyNoLimit(),
                          ),
                        );
                  }
                } else {
                  setState(() {
                    widget.onChangedDescription(
                      _descriptionController.text == ''
                          ? '-'
                          : _descriptionController.text,
                    );
                  });
                  widget.onNext();
                  context.read<RequestFormDetailQueryBloc>().add(
                        RequestFormDetailQueryEvent.fetchAll(
                          status: PurchaseRequestStatus.confirm,
                          department: _department,
                          materialGroup: _materialGroup,
                          isRequestForm: true,
                          pageOptions: PageOptions.emptyNoLimit(),
                        ),
                      );
                }
              }
            }
          },
        ),
      ],
      children: [
        Center(
          child: BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>(
            builder: (context, state) {
              return SizedBox(
                width: 300,
                child: Column(
                  children: [
                    FDropDownSearchMaterialGroup(
                      format: allowedMaterialGroupIds,
                      onChanged: (materialGroup) {
                        if (materialGroup != null) {
                          setState(() {
                            _materialGroup = materialGroup;
                            widget.onChangedMaterialGroup(_materialGroup);
                          });
                        }
                      },
                    ),
                    if (_materialGroup.id != '' &&
                        _materialGroup.id == "IT COMP")
                      const Gap(12),
                    if (_materialGroup.id != '' &&
                        _materialGroup.id == "IT COMP")
                      FDropDownSearchDepartment(
                        onChanged: (department) {
                          if (department != null) {
                            setState(() {
                              _department = department;
                              widget.onChangedDepartment(_department);
                            });
                          }
                        },
                      ),
                    const Gap(12),
                    FTextFormField(
                      labelText: 'Note (Optional)',
                      controller: _descriptionController,
                      maxLines: 5,
                      maxLength: 500,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
