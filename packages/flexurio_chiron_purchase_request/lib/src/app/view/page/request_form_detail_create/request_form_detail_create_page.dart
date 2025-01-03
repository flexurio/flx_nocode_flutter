import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail_temporary/request_form_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_material_query/request_form_material_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_material/src/app/model/material_type.dart'
    as modelmaterialtype;
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/request_form_detail.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/request_form_material.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RequestFormDetailCreatePage extends StatefulWidget {
  const RequestFormDetailCreatePage._({
    required this.temporaryBloc,
    required this.materialGroup,
    required this.vendor,
    required this.onVendorChanged,
  });

  static Widget prepare({
    required MaterialGroup materialGroup,
    required RequestFormDetailTemporaryBloc temporaryBloc,
    required Vendor? vendor,
    required void Function(Vendor? vendor) onVendorChanged,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialQueryBloc(pagination: false)
            ..add(
              MaterialQueryEvent.fetch(
                materialGroup: materialGroup,
                isActive: true,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => RequestFormMaterialQueryBloc()
            ..add(
              RequestFormMaterialQueryEvent.fetch(
                materialGroup: materialGroup,
              ),
            ),
        ),
      ],
      child: RequestFormDetailCreatePage._(
        materialGroup: materialGroup,
        temporaryBloc: temporaryBloc,
        vendor: vendor,
        onVendorChanged: onVendorChanged,
      ),
    );
  }

  final MaterialGroup materialGroup;
  final RequestFormDetailTemporaryBloc temporaryBloc;
  final Vendor? vendor;
  final void Function(Vendor? vendor) onVendorChanged;

  @override
  State<RequestFormDetailCreatePage> createState() =>
      _MaterialRequestDetailCreateState();
}

class _MaterialRequestDetailCreateState
    extends State<RequestFormDetailCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  final _isFastTrackController = false;
  model.Material? _material;
  modelmaterialtype.MaterialType? _materialType;
  @override
  void initState() {
    super.initState();
    _material = model.Material.empty();
    _materialType = modelmaterialtype.MaterialType.empty();
  }

  MaterialUnit? getUnit() {
    if (_material != null) {
      return _material!.materialUnit;
    }
    return null;
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final dateNow = DateTime.now().millisecondsSinceEpoch;
      final event = RequestFormDetailTemporaryEvent.add(
        requestFormDetails: RequestFormDetail(
          id: dateNow,
          quantity: double.parse(_quantityController.text),
          isFastTrack: _isFastTrackController,
          materialType: _materialType ?? modelmaterialtype.MaterialType.empty(),
          unit: _material?.materialUnit ?? MaterialUnit.empty(),
          status: RequestFormDetailStatus.temporary,
          material: _material ?? model.Material.empty(),
          materialRequest: MaterialRequest.empty(),
          materialRequestFormId: '',
        ),
      );
      widget.temporaryBloc.add(event);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    return SingleFormPanel(
      actions: [
        Button(
          permission: null,
          onPressed: () {
            _submit(context);
          },
          action: action,
        ),
      ],
      formKey: _formKey,
      action: action,
      entity: Entity.material,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!widget.materialGroup.isProduct)
              Column(
                children: [
                  BlocBuilder<MaterialQueryBloc, MaterialQueryState>(
                    builder: (context, stateMaterialQueryBloc) {
                      return BlocBuilder<RequestFormMaterialQueryBloc,
                          RequestFormMaterialQueryState>(
                        builder: (context, state) {
                          return FDropDownSearch<RequestFormMaterial>(
                            validator: requiredObjectValidator.call,
                            status: state.maybeWhen(
                              error: (_) => Status.error,
                              loading: () => Status.progress,
                              orElse: () => Status.loaded,
                            ),
                            labelText: 'Material',
                            items: state.maybeWhen(
                              orElse: () => [],
                              loaded: (material) => material,
                            ),
                            onChanged: (material) {
                              if (material != null) {
                                if (material.isMaterialType == true) {
                                  setState(() {
                                    _materialType =
                                        modelmaterialtype.MaterialType(
                                      id: material.id,
                                      createAt: DateTime.now(),
                                      updatedAt: DateTime.now(),
                                      materialGroup: MaterialGroup.empty(),
                                      type: material.name,
                                    );
                                  });
                                } else {
                                  var newMaterial = model.Material.empty();
                                  stateMaterialQueryBloc.maybeWhen(
                                    orElse: () {},
                                    loaded: (materialsaterialQueryBloc) {
                                      for (final materialsaterial
                                          in materialsaterialQueryBloc.data) {
                                        if (materialsaterial.id ==
                                            material.id) {
                                          setState(() {
                                            newMaterial = materialsaterial;
                                          });
                                        }
                                      }
                                    },
                                  );
                                  setState(() {
                                    _material = model.Material(
                                      isLockQuantityMaterialIssue: true,
                                      company: '',
                                      id: material.id,
                                      name: material.name,
                                      halalCertificateId: '',
                                      isAsset: false,
                                      isActive: false,
                                      isOrder: false,
                                      isStock: false,
                                      createdAt: DateTime.now(),
                                      updatedAt: DateTime.now(),
                                      materialUnit: newMaterial.materialUnit,
                                      stockUnit: newMaterial.materialUnit,
                                      materialGroup: MaterialGroup.empty(),
                                      materialType: modelmaterialtype
                                          .MaterialType.empty(),
                                      packSize: 0,
                                    );
                                  });
                                }
                              }
                            },
                            itemAsString: (material) => material.name,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            const Gap(24),
            Text(
              _material != null && _material != model.Material.empty()
                  ? 'Material Unit : ${_material!.materialUnit.id}'
                  : _materialType != null && _materialType!.id != ''
                      ? 'Material Unit : PCS'
                      : 'Material Unit : -',
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'Quantity',
              controller: _quantityController,
              validator: requiredValidator.call,
              maxLength: 50,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              // onChanged: (_) {
              //   setState(() {});
              // },
            ),
          ],
        ),
      ],
    );
  }
}
