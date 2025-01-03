import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail_temporary/request_form_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/request_form_detail.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form_create/widget/select_material_input.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RequestFormInput extends StatefulWidget {
  const RequestFormInput({
    required this.onNext,
    required this.onPrevious,
    required this.materialGroup,
    required this.department,
    required this.description,
    required this.onChanged,
    required this.bloc,
    super.key,
  });

  final void Function() onNext;
  final void Function() onPrevious;
  final MaterialGroup materialGroup;
  final Department department;
  final String description;
  final void Function(bool) onChanged;
  final RequestFormDetailTemporaryBloc bloc;

  @override
  State<RequestFormInput> createState() => _RequestFormInputState();
}

class _RequestFormInputState extends State<RequestFormInput> {
  final _formKey = GlobalKey<FormState>();
  List<RequestFormDetail> _materials = [];

  void _submit(BuildContext context) {
    if (_materials.any((element) => element.material == null)) {
      Toast(context).fail('Material Is Required');
    } else {
      widget.bloc.add(
        const RequestFormDetailTemporaryEvent.fetch(),
      );
      widget.onNext();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormAction(
      formKey: _formKey,
      actions: [
        Button(
          permission: null,
          isSecondary: true,
          action: DataAction.back,
          onPressed: () async {
            widget.bloc.add(
              const RequestFormDetailTemporaryEvent.clear(),
            );
            widget.onChanged.call(false);
            widget.onPrevious();
          },
        ),
        const Gap(12),
        Button(
          permission: null,
          action: DataAction.next,
          onPressed: () => _submit(context),
        ),
      ],
      children: [
        BlocBuilder<RequestFormDetailTemporaryBloc, List<RequestFormDetail>>(
          builder: (context, temporary) {
            _materials = temporary;
            return YuhuTable<RequestFormDetail>(
              width: 2000,
              data: temporary,
              columns: [
                TableColumn(
                  width: 200,
                  title: 'ID',
                  builder: (materialRequestDetail, index) {
                    return Text(materialRequestDetail.id.toString()).canCopy();
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
                    return SelectMaterialItem.prepare(
                      materialRequestDetail: materialRequestDetail,
                      queryBloc: widget.bloc,
                      materialGroup: widget.materialGroup,
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
        ),
      ],
    );
  }
}
