import 'package:flexurio_chiron_material/src/app/bloc/material/material_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';

import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form/request_form_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail/request_form_detail_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail_query/request_form_detail_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail_temporary/request_form_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form_detail/widget/request_form_detail_table.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form_view/request_form_close_button.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';

class RequestFormViewPage extends StatefulWidget {
  const RequestFormViewPage._({
    required this.materialRequest,
    required this.status,
    this.showStatus,
  });
  final MaterialRequest materialRequest;
  final PurchaseRequestStatus? status;
  final bool? showStatus;

  static Route<bool> route({
    required MaterialRequest materialRequest,
    required PurchaseRequestStatus? status,
    bool? showStatus,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => RequestFormDetailBloc()),
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
          BlocProvider(
            create: (context) =>
                VendorQueryBloc()..add(const VendorQueryEvent.fetch()),
          ),
          BlocProvider(create: (context) => RequestFormDetailQueryBloc()),
        ],
        child: RequestFormViewPage._(
          materialRequest: materialRequest,
          status: status,
          showStatus: showStatus,
        ),
      ),
    );
  }

  @override
  State<RequestFormViewPage> createState() => RequestFormViewPageState();
}

class RequestFormViewPageState extends State<RequestFormViewPage> {
  late MaterialGroup _materialGroup;
  late DateTime _dateOfNeed;

  final _noController = TextEditingController();
  final _noMaterialRequestFormController = TextEditingController();
  final _materialGroupController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateOfNeedController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<RequestFormDetailQueryBloc>().add(
          RequestFormDetailQueryEvent.fetch(
            materialRequest: widget.materialRequest,
          ),
        );
    _dateOfNeed = widget.materialRequest.dateOfNeed;
    _materialGroup = widget.materialRequest.materialGroup;
    _materialGroupController.text = _materialGroup.id;
    _noController.text = widget.materialRequest.id;
    _descriptionController.setText(widget.materialRequest.description);
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.requestForm;

    return MultiBlocListener(
      listeners: [
        BlocListener<RequestFormDetailQueryBloc, RequestFormDetailQueryState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loaded: (materials) {
                setState(() {
                  _noMaterialRequestFormController.text = materials
                              .data.isEmpty ||
                          materials.data.first.materialRequestFormId == null
                      ? '-'
                      : materials.data.first.materialRequestFormId.toString();
                });
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ContentWithRightPanel(
          rightPanel: SingleFormPanel(
            action: DataAction.view,
            entity: entity,
            size: SingleFormPanelSize.large,
            visibleBackButton: false,
            children: [
              FCard(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TileDataVertical(
                      label: 'No. Purchase Request',
                      child:
                          Text(_noMaterialRequestFormController.text).canCopy(),
                    ),
                    const Gap(24),
                    TileDataVertical(
                      label: 'No. Request Form',
                      child: Text(_noController.text).canCopy(),
                    ),
                    const Gap(24),
                    IgnorePointer(
                      child: Column(
                        children: [
                          FieldText(
                            labelText: 'Material Group',
                            controller: _materialGroupController,
                          ),
                          const Gap(24),
                          FieldDatePicker(
                            labelText: 'Date of Need',
                            initialSelectedDate: _dateOfNeed,
                            controller: _dateOfNeedController,
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
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          child: SingleFormPanel(
            action: DataAction.view,
            entity: Entity.requestFormDetail,
            size: SingleFormPanelSize.extraLarge,
            children: [
              RequestFormDetailTable(
                showStatus: widget.showStatus,
                vendor: widget.materialRequest.vendor,
                header: const SizedBox(),
                materialGroup: _materialGroup,
                action: (materialRequestDetail) {
                  return [
                    if (widget.status == PurchaseRequestStatus.inProgress)
                      RequestFormCloseButton.prepare(
                        materialRequestDetail: materialRequestDetail,
                      ),
                  ];
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
