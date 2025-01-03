import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material/material_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request/material_request_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_query/material_request_detail_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_temporary/material_request_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/material_request_detail/widget/delete_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/material_request_detail/widget/material_request_detail_create_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/material_request_detail/widget/material_request_detail_table.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/department.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';
import 'package:appointment/src/app/model/config.dart';

class MaterialRequestCreatePage extends StatefulWidget {
  const MaterialRequestCreatePage._({required this.materialRequest});
  final MaterialRequest? materialRequest;

  static Route<bool> route({
    MaterialRequest? materialRequest,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MaterialRequestBloc()),
          BlocProvider(
            create: (context) => DepartmentQueryBloc()
              ..add(DepartmentQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              )),
          ),
          BlocProvider(
            create: (context) => MaterialRequestDetailTemporaryBloc(),
          ),
          BlocProvider(
            create: (context) => MaterialGroupQueryBloc()
              ..add(MaterialGroupQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              )),
          ),
          BlocProvider(create: (context) => MaterialBloc()),
          BlocProvider(create: (context) => MaterialRequestDetailQueryBloc()),
        ],
        child: MaterialRequestCreatePage._(materialRequest: materialRequest),
      ),
    );
  }

  @override
  State<MaterialRequestCreatePage> createState() =>
      PurchaseRequestCreatePageState();
}

class PurchaseRequestCreatePageState extends State<MaterialRequestCreatePage> {
  late DataAction _action;
  late Department _department;
  var _anotherDepartment = false;

  var _type = PurchaseRequestType.purchaseOrder;
  MaterialGroup? _materialGroup;
  Vendor? _vendor;
  DateTime? _dateOfNeed;
  final _formKey = GlobalKey<FormState>();

  final _descriptionController = TextEditingController();
  final _dateOfNeedController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _department = UserRepositoryApp.instance.department!;
    _action = createOrEdit(widget.materialRequest);
    if (_action.isEdit) {
      context.read<MaterialRequestDetailQueryBloc>().add(
            MaterialRequestDetailQueryEvent.fetch(
              materialRequest: widget.materialRequest!,
            ),
          );
      _dateOfNeed = widget.materialRequest!.dateOfNeed;
      _vendor = widget.materialRequest!.vendor;
      _materialGroup = widget.materialRequest!.materialGroup;
      _descriptionController.setText(widget.materialRequest!.description);
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.purchaseRequest;
    return MultiBlocListener(
      listeners: [
        BlocListener<MaterialRequestBloc, MaterialRequestState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (materialRequest) {
                Toast(context).dataChanged(_action, entity);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
        ),
        BlocListener<MaterialRequestDetailQueryBloc,
            MaterialRequestDetailQueryState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loaded: (materials) {
                context.read<MaterialRequestDetailTemporaryBloc>().add(
                      MaterialRequestDetailTemporaryEvent.addAll(
                        materials: materials,
                      ),
                    );
              },
            );
          },
        ),
      ],
      child: ContentWithRightPanel(
        rightPanel: _buildRightPanel(entity),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: MaterialRequestDetailTable(
            vendor: _vendor,
            header: Column(
              children: [
                const BackButtonWithTitle(title: 'Materials'),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _buildMaterialGroupField(),
                    Gap(24),
                    SelectChip<PurchaseRequestType>(
                      isOutlined: true,
                      value: _type,
                      getLabel: (name) => name.label,
                      options: PurchaseRequestType.list,
                      onChanged: (value) {
                        setState(() => _type = value!);
                        context.read<MaterialRequestDetailTemporaryBloc>().add(
                              const MaterialRequestDetailTemporaryEvent.clear(),
                            );
                      },
                    ),
                    const Spacer(),
                    _buildMaterialAddButton(),
                  ],
                ),
              ],
            ),
            materialGroup: _materialGroup,
            action: (materialRequestDetail) {
              return [
                if ([
                      PurchaseRequestDetailStatus.temporary,
                      PurchaseRequestDetailStatus.input,
                    ].contains(materialRequestDetail.status) ||
                    widget.materialRequest?.status ==
                        PurchaseRequestStatus.input)
                  MaterialRequestDetailTemporaryDeleteButton(
                    materialRequestDetail: materialRequestDetail,
                  ),
              ];
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMaterialAddButton() {
    return BlocBuilder<MaterialRequestDetailTemporaryBloc,
        List<PurchaseRequestDetail>>(
      builder: (context, state) {
        return AddButton(
          type: _type,
          materialGroup: _materialGroup,
          vendor: _vendor,
          onVendorChanged: (vendor) {
            setState(() => _vendor = vendor);
          },
        );
      },
    );
  }

  Widget _buildRightPanel(Entity entity) {
    return SingleFormPanel(
      actions: [
        BlocBuilder<MaterialRequestDetailQueryBloc,
            MaterialRequestDetailQueryState>(
          builder: (context, stateMaterialRequestDetail) {
            return BlocBuilder<MaterialRequestBloc, MaterialRequestState>(
              builder: (context, stateMaterialRequest) {
                return BlocBuilder<MaterialRequestDetailTemporaryBloc,
                    List<PurchaseRequestDetail>>(
                  builder: (context, materials) {
                    return Expanded(
                      child: _buildSubmitButton(
                        stateMaterialRequestDetail,
                        stateMaterialRequest,
                        materials,
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ],
      formKey: _formKey,
      visibleBackButton: false,
      action: _action,
      entity: entity,
      children: [
        if (_action.isEdit)
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Text(widget.materialRequest!.id).canCopy(),
          ),
        FieldDatePicker(
          labelText: 'Date of Need',
          initialSelectedDate: _dateOfNeed,
          controller: _dateOfNeedController,
          validator: requiredObjectValidator.call,
          minDate: DateTime.now().add(const Duration(days: 1)),
          onChanged: (value) => _dateOfNeed = value,
        ),
        const Gap(24),
        FTextFormField(
          labelText: 'Note (Optional)',
          controller: _descriptionController,
          maxLines: 5,
          maxLength: 300,
        ),
        const Gap(24),
        if (_action.isCreate)
          CheckboxWithText(
            initialValue: _anotherDepartment,
            text: 'Mark as another department',
            onChanged: (value) {
              setState(() {
                _anotherDepartment = value;
              });
            },
          ),
        if (_anotherDepartment)
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: FDropDownSearchDepartment(
              initialValue: _department,
              onChanged: (department) {
                if (department != null) {
                  _department = department;
                }
              },
            ),
          ),
      ],
    );
  }

  Button _buildSubmitButton(
    MaterialRequestDetailQueryState stateMaterialRequestDetail,
    MaterialRequestState stateMaterialRequest,
    List<PurchaseRequestDetail> materials,
  ) {
    return Button(
      permission: null,
      isInProgress: stateMaterialRequestDetail.maybeWhen(
            loading: () => true,
            orElse: () => false,
          ) ||
          stateMaterialRequest.maybeWhen(
            loading: () => true,
            orElse: () => false,
          ),
      onPressed: (_action.isCreate &&
                  _materialGroup != null &&
                  materials.isNotEmpty) ||
              _action.isEdit
          ? () => _submit(details: materials)
          : null,
      action: _action,
    );
  }

  void _submit({required List<PurchaseRequestDetail> details}) {
    if (_formKey.currentState!.validate()) {
      if (details.isNotEmpty && details.first.material != null) {
        for (final detail in details) {
          if (details.first.material!.isOrder != detail.material!.isOrder) {
            Toast(context).fail('Is order must has the same value.');
            return;
          }
        }
      }

      late MaterialRequestEvent event;
      if (_action.isEdit) {
        event = MaterialRequestEvent.update(
          dateOfNeed: _dateOfNeed!,
          materialGroup: _materialGroup!,
          vendor: _vendor,
          materialRequest: widget.materialRequest!,
          materialRequestDetails: details,
          description: _descriptionController.text,
        );
      } else {
        final department = (_anotherDepartment
            ? _department
            : UserRepositoryApp.instance.department!);
        event = MaterialRequestEvent.create(
          materialRequestDetails: details,
          dateOfNeed: _dateOfNeed!,
          materialGroup: _materialGroup!,
          vendor: _vendor,
          departmentId: department.id,
          departmentBudgetingId: department.id,
          description: _descriptionController.text,
        );
      }

      context.read<MaterialRequestBloc>().add(event);
    }
  }

  Widget _buildMaterialGroupField() {
    return BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>(
      builder: (context, state) {
        final department =
            UserRepositoryApp.instance.department ?? Department.empty();
        return SizedBox(
          width: 200,
          child: FDropDownSearch<MaterialGroup>(
            enabled: _action.isCreate,
            validator: requiredObjectValidator.call,
            initialValue: _materialGroup,
            status: state.maybeWhen(
              error: (_) => Status.error,
              loading: (_) => Status.progress,
              orElse: () => Status.loaded,
            ),
            labelText: 'material_group'.tr(),
            items: state.maybeWhen(
              orElse: () => [],
              loaded: (materialGroups) =>
                  (flavorConfig as FlavorConfig<AppConfig>)
                      .applicationConfig
                      .purchaseRequestCreateFilterMaterialGroup(
                        materialGroups: materialGroups.data,
                        department: department,
                      ),
            ),
            onChanged: (value) {
              if (_materialGroup != value) {
                setState(() => _materialGroup = value);
                context.read<MaterialRequestDetailTemporaryBloc>().add(
                      const MaterialRequestDetailTemporaryEvent.clear(),
                    );
              }
            },
            itemAsString: (materialGroup) => materialGroup.id,
          ),
        );
      },
    );
  }
}
