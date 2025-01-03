import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request/material_request_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_query/material_request_detail_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_temporary/material_request_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/material_request_detail/widget/material_request_detail_table.dart';

import 'package:flexurio_chiron_material/src/app/bloc/material/material_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_vendor/src/app/bloc/vendor_query/vendor_query_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/model/vendors.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';

class MaterialRequestViewPage extends StatefulWidget {
  const MaterialRequestViewPage._({required this.materialRequest});
  final MaterialRequest materialRequest;

  static Route<bool> route({required MaterialRequest materialRequest}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MaterialRequestBloc()),
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
          BlocProvider(
            create: (context) =>
                VendorQueryBloc()..add(const VendorQueryEvent.fetch()),
          ),
          BlocProvider(create: (context) => MaterialRequestDetailQueryBloc()),
        ],
        child: MaterialRequestViewPage._(materialRequest: materialRequest),
      ),
    );
  }

  @override
  State<MaterialRequestViewPage> createState() =>
      MaterialRequestViewPageState();
}

class MaterialRequestViewPageState extends State<MaterialRequestViewPage> {
  late MaterialGroup _materialGroup;
  late DateTime _dateOfNeed;
  Vendor? _vendor;

  final _noController = TextEditingController();
  final _materialGroupController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateOfNeedController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<MaterialRequestDetailQueryBloc>().add(
          MaterialRequestDetailQueryEvent.fetch(
            materialRequest: widget.materialRequest,
          ),
        );
    _dateOfNeed = widget.materialRequest.dateOfNeed;
    _vendor = widget.materialRequest.vendor;
    _materialGroup = widget.materialRequest.materialGroup;
    _materialGroupController.text = _materialGroup.id;
    _noController.text = widget.materialRequest.id;
    _descriptionController.setText(widget.materialRequest.description);
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.purchaseRequest;

    return MultiBlocListener(
      listeners: [
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
        rightPanel: IgnorePointer(
          child: FCard(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FieldText(
                  labelText: 'No.',
                  controller: _noController,
                ),
                const Gap(24),
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
                BlocBuilder<VendorQueryBloc, VendorQueryState>(
                  builder: (context, state) {
                    return FDropDownSearch<Vendor>(
                      initialValue: _vendor,
                      status: state.maybeWhen(
                        error: (_) => Status.error,
                        loading: (_) => Status.progress,
                        orElse: () => Status.loaded,
                      ),
                      labelText: 'Manufacturer',
                      items: state.maybeWhen(
                        orElse: () => [],
                        loaded: (vendor) => vendor.data,
                      ),
                      onChanged: (vendor) {
                        if (vendor != null) {
                          _vendor = vendor;
                        }
                      },
                      itemAsString: (vendor) => vendor.name,
                    );
                  },
                ),
                const Gap(24),
                FTextFormField(
                  labelText: 'Note (Optional)',
                  controller: _descriptionController,
                  maxLines: 5,
                  maxLength: 300,
                ),
              ],
            ),
          ),
        ),
        child: MaterialRequestDetailTable(
          vendor: widget.materialRequest.vendor,
          header: BackButtonWithTitle(
            title: '${DataAction.view.title} ${entity.title}',
          ),
          materialGroup: _materialGroup,
          action: (_) => [],
        ),
      ),
    );
  }
}
