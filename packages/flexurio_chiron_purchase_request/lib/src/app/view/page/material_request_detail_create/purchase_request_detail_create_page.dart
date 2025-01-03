import 'package:flexurio_chiron_vendor/src/app/bloc/material_approve_vendor_query/material_approve_vendor_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_design_query/material_design_query_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/bloc/material_lead_time_query/material_lead_time_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_temporary/material_request_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:flexurio_chiron_vendor/src/app/model/material_supplier_leadtime.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/production_order.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_query/bloc/product_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_vendor/src/app/model/vendors.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PurchaseRequestDetailCreatePage extends StatefulWidget {
  const PurchaseRequestDetailCreatePage._({
    required this.temporaryBloc,
    required this.materialGroup,
    required this.vendor,
    required this.onVendorChanged,
    required this.isOrder,
  });

  static Widget prepare({
    required MaterialGroup materialGroup,
    required MaterialRequestDetailTemporaryBloc temporaryBloc,
    required Vendor? vendor,
    required void Function(Vendor? vendor) onVendorChanged,
    required bool isExternal,
    required bool isOrder,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialDesignQueryBloc(
            isExternal: isExternal,
          ),
        ),
        BlocProvider(create: (context) => MaterialLeadTimeQueryBloc()),
        BlocProvider(
            create: (context) =>
                ProductionOrderQueryBloc(isExternal: isExternal)),
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(
              ProductQueryEvent.fetch(
                active: true,
                productGroup: materialGroup.toProductGroup,
                pageOptions:
                    PageOptions.emptyNoLimit(sortBy: 'name', ascending: true),
              ),
            ),
        ),
        BlocProvider(create: (context) => MaterialQueryBloc()),
        BlocProvider(create: (context) => MaterialApproveVendorQueryBloc()),
      ],
      child: PurchaseRequestDetailCreatePage._(
        materialGroup: materialGroup,
        temporaryBloc: temporaryBloc,
        vendor: vendor,
        onVendorChanged: onVendorChanged,
        isOrder: isOrder,
      ),
    );
  }

  final MaterialGroup materialGroup;
  final MaterialRequestDetailTemporaryBloc temporaryBloc;
  final Vendor? vendor;
  final bool isOrder;
  final void Function(Vendor? vendor) onVendorChanged;

  @override
  State<PurchaseRequestDetailCreatePage> createState() =>
      _MaterialRequestDetailCreateState();
}

class _MaterialRequestDetailCreateState
    extends State<PurchaseRequestDetailCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  final _batchController = TextEditingController();
  final _materialDesignController = TextEditingController()..text = '-';
  model.Material? _material;
  DateTime? _batchExpired;
  String? _batch;
  Product? _product;
  MaterialDesign? _materialDesign;
  Vendor? _vendor;
  var _isFastTrackController = false;
  var _createNewBatch = false;

  @override
  void initState() {
    super.initState();
    if (widget.vendor != null) {
      _vendor = widget.vendor;
    }
    _fetchMaterial();
  }

  void _fetchMaterial() {
    if (widget.vendor != null) {
      context.read<MaterialQueryBloc>().add(MaterialQueryEvent.fetchByVendorId(
            materialGroup: widget.materialGroup,
            vendorId: widget.vendor!.id,
            pageOptions: PageOptions.emptyNoLimit(),
          ));
    } else {
      context.read<MaterialQueryBloc>().add(MaterialQueryEvent.fetch(
            isOrder: widget.isOrder,
            isActive: true,
            materialGroup: widget.materialGroup,
            pageOptions: PageOptions.emptyNoLimit(),
          ));
    }
  }

  MaterialUnit? getUnit() {
    if (_material != null) {
      return _material!.materialUnit;
    }
    if (_product != null) {
      return _product!.unitOrder;
    }
    return null;
  }

  void _submit(BuildContext context, DateTime dueDate) {
    if (_formKey.currentState!.validate()) {
      final event = MaterialRequestDetailTemporaryEvent.add(
        dueDate: dueDate,
        material: _material,
        materialDesign: _materialDesign,
        quantity: stringDecimalToDouble(_quantityController.text),
        isFastTrack: _isFastTrackController,
        product: _product,
        unit: getUnit()!,
        batchExpiredDate: _batchExpired,
        batchNo: _createNewBatch ? _batchController.text : _batch,
      );
      widget.temporaryBloc.add(event);
      if (widget.vendor != null) {
        widget.onVendorChanged(_vendor);
      }
      widget.onVendorChanged(_vendor);

      Navigator.pop(context);
    }
  }

  DateTime _getDueDate(List<MaterialSupplierLeadTime> leadTimes) {
    var leadTime = 0;
    for (final leadTimeData in leadTimes) {
      if (leadTimeData.leadTime > leadTime) {
        leadTime = leadTimeData.leadTime;
      }
    }

    var daysAdded = 0;
    var dueDate = DateTime.now();

    while (daysAdded < leadTime) {
      dueDate = dueDate.add(const Duration(days: 1));

      if (dueDate.weekday != DateTime.saturday &&
          dueDate.weekday != DateTime.sunday) {
        daysAdded++;
      }
    }

    return dueDate;
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final unit = getUnit();
    return SingleFormPanel(
      actions: [
        BlocBuilder<MaterialLeadTimeQueryBloc, MaterialLeadTimeQueryState>(
          builder: (context, state) {
            return Button(
              permission: null,
              onPressed: !widget.materialGroup.isProduct &&
                      state.maybeWhen(
                        orElse: () => true,
                        loaded: (leadTimes) => false,
                      )
                  ? null
                  : () {
                      final dueDate = state.maybeWhen<DateTime>(
                        orElse: DateTime.now,
                        loaded: _getDueDate,
                      );
                      _submit(context, dueDate);
                    },
              action: action,
            );
          },
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
                    builder: (context, state) {
                      final items = state.maybeWhen(
                        orElse: () => <model.Material>[],
                        loaded: (materialDesign) => materialDesign.data,
                      );
                      return FDropDownSearch<model.Material>(
                        validator: requiredObjectValidator.call,
                        status: state.maybeWhen(
                          error: (_) => Status.error,
                          loading: (_) => Status.progress,
                          orElse: () => Status.loaded,
                        ),
                        labelText: 'Material',
                        items: items,
                        onChanged: (value) {
                          _material = value;
                          context.read<MaterialApproveVendorQueryBloc>().add(
                                MaterialApproveVendorQueryEvent.fetch(
                                  material: value,
                                  pageOptions: PageOptions.emptyNoLimit(),
                                ),
                              );
                          context.read<MaterialLeadTimeQueryBloc>().add(
                                MaterialLeadTimeQueryEvent.fetch(
                                  material: value,
                                ),
                              );
                          if (widget.materialGroup.isPacking) {
                            _materialDesign = null;
                            context.read<MaterialDesignQueryBloc>().add(
                                  MaterialDesignQueryEvent.fetch(
                                    material: _material,
                                    active: true,
                                    pageOptions: PageOptions.emptyNoLimit(),
                                  ),
                                );
                          }
                          setState(() {});
                        },
                        itemAsString: (material) => material.name,
                      );
                    },
                  ),
                  if (widget.materialGroup.isBasic ||
                      widget.materialGroup.isAuxiliary)
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: BlocBuilder<MaterialApproveVendorQueryBloc,
                          MaterialApproveVendorQueryState>(
                        builder: (context, state) {
                          return FDropDownSearch<Vendor>(
                            key: ValueKey(_material),
                            enabled: widget.vendor == null,
                            initialValue: _vendor,
                            validator: requiredObjectValidator.call,
                            status: state.maybeWhen(
                              error: (_) => Status.error,
                              loading: (_) => Status.progress,
                              orElse: () => Status.loaded,
                            ),
                            labelText: 'manufacturer'.tr(),
                            items: state.maybeWhen(
                              orElse: () => [],
                              loaded: (vendor) =>
                                  vendor.data.map((e) => e.vendor).toList(),
                            ),
                            onChanged: (vendor) {
                              if (vendor != null) {
                                setState(() {
                                  _vendor = vendor;
                                  widget.onVendorChanged(vendor);
                                });
                              }
                            },
                            itemAsString: (vendor) => vendor.name,
                          );
                        },
                      ),
                    ),
                  const Gap(24),
                  RowFields(
                    children: [
                      BlocBuilder<MaterialLeadTimeQueryBloc,
                          MaterialLeadTimeQueryState>(
                        builder: (context, state) {
                          return TileDataVertical(
                            label: 'Due Date',
                            child: state.maybeWhen(
                              initial: () {
                                return Text(DateTime.now().yMMMMd);
                              },
                              loaded: (leadTimes) {
                                return Text(_getDueDate(leadTimes).yMMMMd);
                              },
                              orElse: () {
                                return const CupertinoActivityIndicator();
                              },
                            ),
                          );
                        },
                      ),
                      TileDataVertical(
                        label: 'Unit',
                        child: Text(unit == null ? '' : unit.id),
                      ),
                      TileDataVertical(
                        label: 'Pack Size',
                        child: Text(_material?.packSize.toString() ?? '-'),
                      ),
                    ],
                  ),
                ],
              ),
            if (widget.materialGroup.isPacking)
              Column(
                children: [
                  const Gap(24),
                  BlocListener<MaterialDesignQueryBloc,
                      MaterialDesignQueryState>(
                    listener: (context, state) {
                      _materialDesign = state.maybeWhen(
                        orElse: () => null,
                        loaded: (materialDesign) {
                          if (materialDesign.data.isEmpty) {
                            return null;
                          } else {
                            return materialDesign.data.first;
                          }
                        },
                      );
                      _materialDesignController.text = _materialDesign == null
                          ? '-'
                          : _materialDesign!.designCode;
                    },
                    child: FTextFormField(
                      labelText: 'Design',
                      controller: _materialDesignController,
                      validator: requiredValidator.call,
                      enabled: false,
                    ),
                  ),
                  const Gap(24),
                  FTextFormField(
                    labelText: 'description'.tr(),
                    enabled: false,
                    controller: TextEditingController()
                      ..text = _materialDesign?.description ?? '-',
                    validator: requiredValidator.call,
                    maxLength: 50,
                  ),
                ],
              ),
            if (widget.materialGroup.isProduct)
              Column(
                children: [
                  const Gap(24),
                  BlocBuilder<ProductQueryBloc, ProductQueryState>(
                    builder: (context, state) {
                      return FDropDownSearch<Product>(
                        validator: requiredObjectValidator.call,
                        status: state.maybeWhen(
                          error: (_) => Status.error,
                          loading: (_) => Status.progress,
                          orElse: () => Status.loaded,
                        ),
                        labelText: 'Products',
                        items: state.maybeWhen(
                          orElse: () => [],
                          loaded: (products) => products.data,
                        ),
                        onChanged: (value) {
                          _product = value;
                          _batch = null;
                          context.read<ProductionOrderQueryBloc>().add(
                                ProductionOrderQueryEvent.fetch(product: value),
                              );
                          setState(() {});
                        },
                        itemAsString: (products) => products.name,
                      );
                    },
                  ),
                  const Gap(24),
                  RowFields(
                    children: [
                      BlocBuilder<MaterialLeadTimeQueryBloc,
                          MaterialLeadTimeQueryState>(
                        builder: (context, state) {
                          return TileDataVertical(
                            label: 'Due Date',
                            child: state.maybeWhen(
                              initial: () {
                                return Text(DateTime.now().yMMMMd);
                              },
                              loaded: (leadTimes) {
                                return Text(_getDueDate(leadTimes).yMMMMd);
                              },
                              orElse: () {
                                return const CupertinoActivityIndicator();
                              },
                            ),
                          );
                        },
                      ),
                      TileDataVertical(
                        label: 'Unit',
                        child: Text(unit == null ? '' : unit.id),
                      ),
                      TileDataVertical(
                        label: 'Pack Size',
                        child: Text(_material?.packSize.toString() ?? '-'),
                      ),
                    ],
                  ),
                  const Gap(24),
                  CheckboxWithText(
                    initialValue: _createNewBatch,
                    text: 'Batch Non Production',
                    onChanged: (value) {
                      setState(() {
                        _createNewBatch = value;
                      });
                    },
                  ),
                  const Gap(24),
                  if (_createNewBatch)
                    RowFields(
                      children: [
                        FTextFormField(
                          labelText: 'Batch',
                          controller: _batchController,
                          maxLength: 50,
                        ),
                        FieldDatePicker(
                          labelText: 'Expired Date',
                          controller: TextEditingController(),
                          minDate: DateTime.now(),
                          validator: (value) => _batchController.text == ''
                              ? null
                              : requiredObjectValidator(value),
                          onChanged: (value) => _batchExpired = value,
                        ),
                      ],
                    )
                  else
                    FDropDownSearchProductionOrder(
                      key: ValueKey(_product),
                      isRequired: false,
                      label: 'Batch',
                      onChanged: (value) {
                        if (value != null) {
                          _batch = value.id;
                        }
                      },
                    ),
                ],
              ),
            if (widget.materialGroup.isGeneral)
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: CheckboxWithText(
                  initialValue: _isFastTrackController,
                  text: 'Fast Track',
                  onChanged: (value) {
                    setState(() {
                      _isFastTrackController = value;
                    });
                  },
                ),
              ),
            const Gap(24),
            FTextFormField(
              labelText: 'Quantity',
              controller: _quantityController,
              validator: requiredValidator.call,
              maxLength: 50,
              inputFormatters: [
                DecimalInputFormatter(),
              ],
              onChanged: (_) {},
            ),
            if (_material != null &&
                _quantityController.text.isNotEmpty &&
                (double.parse(_quantityController.text) %
                        _material!.packSize) !=
                    0)
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: BlockNote(
                  color: Colors.orange,
                  title: 'Warning',
                  subtitle:
                      'Quantity is not a multiple of ${_material!.packSize}',
                ),
              ),
          ],
        ),
      ],
    );
  }
}
