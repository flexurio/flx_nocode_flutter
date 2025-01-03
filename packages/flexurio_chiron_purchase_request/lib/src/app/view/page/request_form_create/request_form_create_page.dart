import 'package:flexurio_chiron_material/src/app/bloc/material/material_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form/request_form_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail_query/request_form_detail_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail_temporary/request_form_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/request_form_detail.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form_detail/widget/delete_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form_detail/widget/request_form_detail_create_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form_detail/widget/request_form_detail_table.dart';

import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';

class RequestFormCreatePage extends StatefulWidget {
  const RequestFormCreatePage._({
    required this.materialRequest,
  });
  final MaterialRequest? materialRequest;

  static Route<bool> route({
    MaterialRequest? materialRequest,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => RequestFormBloc()),
          BlocProvider(
            create: (context) => RequestFormDetailTemporaryBloc(),
          ),
          BlocProvider(
            create: (context) => MaterialGroupQueryBloc()
              ..add(MaterialGroupQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              )),
          ),
          BlocProvider(create: (context) => MaterialBloc()),
          BlocProvider(create: (context) => RequestFormDetailQueryBloc()),
        ],
        child: RequestFormCreatePage._(materialRequest: materialRequest),
      ),
    );
  }

  @override
  State<RequestFormCreatePage> createState() => RequestFormCreatePageState();
}

class RequestFormCreatePageState extends State<RequestFormCreatePage> {
  late DataAction _action;

  MaterialGroup? _materialGroup;
  Vendor? _vendor;
  DateTime? _dateOfNeed;
  final _formKey = GlobalKey<FormState>();

  final _descriptionController = TextEditingController();
  final _dateOfNeedController = TextEditingController();

  final allowedMaterialGroupIds = [
    'ALAT DAPUR',
    'ATK',
    'IT COMP',
    'SAFETY',
    'UMUM',
  ];

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.materialRequest);
    if (_action.isEdit) {
      context.read<RequestFormDetailQueryBloc>().add(
            RequestFormDetailQueryEvent.fetch(
              materialRequest: widget.materialRequest!,
            ),
          );
      _dateOfNeed = widget.materialRequest!.dateOfNeed;
      _vendor = widget.materialRequest!.vendor ?? Vendor.empty();
      _materialGroup = widget.materialRequest!.materialGroup;
      _descriptionController.setText(widget.materialRequest!.description);
    }
  }

  void submit({required List<RequestFormDetail> materials}) {
    if (_formKey.currentState!.validate()) {
      late RequestFormEvent event;
      if (_action.isEdit) {
        event = RequestFormEvent.update(
          dateOfNeed: _dateOfNeed!,
          materialGroup: _materialGroup!,
          materialRequest: widget.materialRequest!,
          materialRequestDetails: materials,
          description: _descriptionController.text,
        );
      } else {
        event = RequestFormEvent.create(
          materialRequestDetails: materials,
          dateOfNeed: _dateOfNeed!,
          materialGroup: _materialGroup!,
          description: _descriptionController.text,
          isRequestForm: true,
        );
      }

      context.read<RequestFormBloc>().add(event);
    }
  }

  BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>
      _buildMaterialGroupField() {
    return BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>(
      builder: (context, state) {
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
            labelText: 'Material Group',
            items: state.maybeWhen(
              orElse: () => [],
              loaded: (materialGroups) => materialGroups.data
                  .where((group) => allowedMaterialGroupIds.contains(group.id))
                  .toList(),
            ),
            onChanged: (value) {
              if (_materialGroup != value) {
                setState(() => _materialGroup = value);
                context.read<RequestFormDetailTemporaryBloc>().add(
                      const RequestFormDetailTemporaryEvent.clear(),
                    );
              }
            },
            itemAsString: (materialGroup) => materialGroup.id,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.requestForm;

    return MultiBlocListener(
      listeners: [
        BlocListener<RequestFormBloc, RequestFormState>(
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(_action, entity);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
        ),
        BlocListener<RequestFormDetailQueryBloc, RequestFormDetailQueryState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loaded: (materials) {
                context.read<RequestFormDetailTemporaryBloc>().add(
                      RequestFormDetailTemporaryEvent.addAll(
                        requestFormDetails: materials.data,
                      ),
                    );
              },
            );
          },
        ),
      ],
      child: ContentWithRightPanel(
        rightPanel: _buildRightPanel(entity),
        child: RequestFormDetailTable(
          vendor: _vendor,
          header: Column(
            children: [
              const BackButtonWithTitle(title: 'Request Form'),
              const SizedBox(height: 10),
              Row(
                children: [
                  _buildMaterialGroupField(),
                  const Spacer(),
                  BlocBuilder<RequestFormDetailTemporaryBloc,
                      List<RequestFormDetail>>(
                    builder: (context, state) {
                      return AddButton(
                        materialGroup: _materialGroup,
                        vendor: state.isEmpty ? null : _vendor,
                        onVendorChanged: (vendor) {
                          if (vendor != null) {
                            setState(() {
                              _vendor = vendor;
                            });
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          materialGroup: _materialGroup,
          action: (materialRequestDetail) {
            return [
              MaterialRequestDetailTemporaryDeleteButton(
                materialRequestDetail: materialRequestDetail,
              ),
            ];
          },
        ),
      ),
    );
  }

  Widget _buildRightPanel(Entity entity) {
    return SingleFormPanel(
      actions: [
        BlocBuilder<RequestFormDetailQueryBloc, RequestFormDetailQueryState>(
          builder: (context, stateMaterialRequestDetail) {
            return BlocBuilder<RequestFormBloc, RequestFormState>(
              builder: (context, stateMaterialRequest) {
                return BlocBuilder<RequestFormDetailTemporaryBloc,
                    List<RequestFormDetail>>(
                  builder: (context, materials) {
                    return Expanded(
                      child: Button(
                        permission: null,
                        isInProgress: stateMaterialRequestDetail.maybeWhen(
                              loading: (l) => true,
                              orElse: () => false,
                            ) ||
                            stateMaterialRequest.maybeWhen(
                              loading: () => true,
                              orElse: () => false,
                            ),
                        onPressed: (_action.isCreate &&
                                    _materialGroup != null &&
                                    materials.isNotEmpty) ||
                                (_action.isEdit)
                            ? () => submit(materials: materials)
                            : null,
                        action: _action,
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
      action: _action == DataAction.create
          ? DataAction.createAdditional
          : DataAction.editAdditional,
      entity: Entity.none,
      children: [
        if (_action.isEdit)
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Text(widget.materialRequest?.id ?? '-'),
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
          labelText: 'Noted (Optional)',
          controller: _descriptionController,
          maxLines: 5,
          maxLength: 300,
        ),
      ],
    );
  }
}
