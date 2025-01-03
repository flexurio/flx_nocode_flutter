import 'dart:core';

import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive/material_receive_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_create/widget/add_button.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_create/widget/detail_table.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_create/widget/temporary_add_button.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_create/widget/temporary_detail_table.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveItemsForm extends StatefulWidget {
  const MaterialReceiveItemsForm({
    required this.onNext,
    required this.onPrevious,
    required this.createType,
    required this.showMaterialDesign,
    required this.isExternal,
    super.key,
  });

  final void Function() onNext;
  final void Function() onPrevious;
  final MaterialReceiveType createType;
  final bool showMaterialDesign;
  final bool isExternal;

  @override
  State<MaterialReceiveItemsForm> createState() =>
      _MaterialReceiveItemsFormState();
}

class _MaterialReceiveItemsFormState extends State<MaterialReceiveItemsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _batch = [];
  final List<double> _quantity = [];
  final List<int> _vatTotal = [];
  final List<DateTime?> _expDate = [];
  final List<DateTime?> _bestBefore = [];
  final List<DateTime?> _mfgDate = [];
  final List<DateTime?> _retestDate = [];
  final List<DateTime?> _shelfLife = [];
  var _data = <PurchaseOrderDetail>[];
  var _materialOptions = <Material>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PurchaseOrderDetailQueryBloc,
        PurchaseOrderDetailQueryState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            loaded: (details) {
              _materialOptions =
                  details.map((e) => e.material ?? Material.empty()).toList();
              context
                  .read<PurchaseOrderDetailTemporaryBloc>()
                  .add(PurchaseOrderDetailTemporaryEvent.clear());
              _batch.clear();
              _quantity.clear();
              _vatTotal.clear();
              _expDate.clear();
              _bestBefore.clear();
              _mfgDate.clear();
              _retestDate.clear();
              _shelfLife.clear();
              for (var i = 0; i < details.length; i++) {
                _batch.add('');
                _quantity.add(0);
                _vatTotal.add(0);
                _expDate.add(null);
                _bestBefore.add(null);
                _mfgDate.add(null);
                _retestDate.add(null);
                _shelfLife.add(null);
              }
            });
      },
      child: BlocBuilder<MaterialReceiveBloc, MaterialReceiveState>(
        builder: (context, state) {
          final purchaseOrder = state.maybeWhen(
            orElse: PurchaseOrder.empty,
            initial: (detail, typeForm, createForm) =>
                createForm?.purchaseOrder,
          );
          final materialGroup = state.maybeWhen(
            orElse: MaterialGroup.empty,
            initial: (_, __, createForm) => createForm?.materialGroup,
          );
          return FormAction(
            formKey: _formKey,
            actions: [
              Button(
                permission: null,
                isSecondary: true,
                action: DataAction.back,
                onPressed: widget.onPrevious,
              ),
              const SizedBox(width: 12),
              BlocBuilder<MaterialReceiveBloc, MaterialReceiveState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: Container.new,
                    initial: (details, type, _) {
                      return Button(
                        permission: null,
                        action: DataAction.next,
                        onPressed: () {
                          if (purchaseOrder != null) {
                            _submitPurchaseOrder(context);
                          } else {
                            _submit(context, details);
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ],
            children: [
              if (purchaseOrder == null)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialReceiveAddTemporaryButton(
                          materialGroup: materialGroup ?? MaterialGroup.empty(),
                          createType: widget.createType,
                          showMaterialDesign: widget.showMaterialDesign,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const MaterialReceiveDetailTemporaryTable(),
                  ],
                ),
              if (purchaseOrder != null)
                Column(
                  children: [
                    _buildAddItemButton(context),
                    const SizedBox(height: 24),
                    _buildTableItems(),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }

  void _submitPurchaseOrder(BuildContext context) {
    final materials = <MaterialReceiveDetail>[];
    for (var i = 0; i < _data.length; i++) {
      final quantity = _quantity[i];
      final vatTotal = _vatTotal[i];

      if (quantity > 0 && vatTotal > 0) {
        materials.add(
          MaterialReceiveDetail.empty().copyWith(
            quantity: quantity,
            vatTotal: vatTotal,
            batchNo: _batch[i],
            expiredDate: _expDate[i],
            bestBefore: _bestBefore[i],
            manufacturingDate: _mfgDate[i],
            retestDate: _retestDate[i],
            shelfLife: _shelfLife[i],
            material: _data[i].material!,
            materialUnit: _data[i].unit,
            materialDesign: _data[i].materialDesign,
            totalQuantity: _quantity[i],
          ),
        );
      }
    }

    if (materials.isEmpty) {
      ToastRepository.errorRequiredAtLeastOne(
        context: context,
        data: 'material',
      );
      return;
    }

    final groups = groupBy(
      materials,
      (detail) =>
          detail.material.id +
          '-' +
          detail.batchNo +
          '-' +
          detail.quantity.toString(),
    );
    for (final group in groups.entries) {
      if (group.value.length > 1) {
        Toast(context).fail('Please provide unique materials');
        return;
      }
    }

    context
        .read<MaterialReceiveBloc>()
        .add(MaterialReceiveEvent.createMaterial(materials));
    widget.onNext();
  }

  void _submit(BuildContext context, List<MaterialReceiveDetail>? materials) {
    if (materials!.isNotEmpty) {
      widget.onNext();
      return;
    }
    ToastRepository.errorRequiredAtLeastOne(context: context, data: 'material');
  }

  void _addDetail(BuildContext context, PurchaseOrderDetail detail) {
    _batch.add('');
    _quantity.add(0);
    _vatTotal.add(0);
    _expDate.add(null);
    _bestBefore.add(null);
    _mfgDate.add(null);
    _retestDate.add(null);
    _shelfLife.add(null);
    context.read<PurchaseOrderDetailTemporaryBloc>().add(
          PurchaseOrderDetailTemporaryEvent.add(
            material: detail.material,
            materialUnit: detail.unit,
            quantity: 0,
            design: detail.materialDesign ?? MaterialDesign.empty(),
            batch: ProductionOrder.empty(),
            ignoreDuplicate: true,
          ),
        );
    setState(() {});
  }

  void _removeDetail(BuildContext context, int index) {
    _batch.removeAt(index);
    _quantity.removeAt(index);
    _vatTotal.removeAt(index);
    _expDate.removeAt(index);
    _bestBefore.removeAt(index);
    _mfgDate.removeAt(index);
    _retestDate.removeAt(index);
    _shelfLife.removeAt(index);
    setState(() {});
  }

  Widget _buildAddItemButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialReceiveAddButton(
          isExternal: widget.isExternal,
          createType: widget.createType,
          showMaterialDesign: widget.showMaterialDesign,
          materialOptions:
              widget.createType == MaterialReceiveType.purchaseOrder
                  ? _materialOptions
                  : null,
          onAddDetail: (data) => _addDetail(context, data),
        ),
      ],
    );
  }

  Widget _buildTableItems() {
    return BlocBuilder<PurchaseOrderDetailTemporaryBloc,
        List<PurchaseOrderDetail>>(
      builder: (context, temporary) {
        return BlocBuilder<PurchaseOrderDetailQueryBloc,
            PurchaseOrderDetailQueryState>(
          builder: (context, state) {
            final data = state.maybeWhen(
              orElse: () => <PurchaseOrderDetail>[],
              loaded: (purchaseOrderDetails) => List<PurchaseOrderDetail>.from(
                purchaseOrderDetails,
              )..addAll(temporary),
            );
            _data =
                data.where((e) => e.material?.id != 'ANALISA').toSet().toList();
            return state.maybeWhen(
              loading: () => const Center(child: CupertinoActivityIndicator()),
              orElse: SizedBox.shrink,
              loaded: (purchaseOrder) {
                return MaterialReceiveDetailTable(
                  isExternal: widget.isExternal,
                  key: Key(data.length.toString()),
                  temporaryLength: temporary.length,
                  purchaseOrderDetails: _data,
                  action: DataAction.create,
                  canDelete: true,
                  canEdit: false,
                  createType: widget.createType,
                  onRemoveDetail: (index) => _removeDetail(context, index),
                  initialBatch: _batch,
                  initialQuantity: _quantity,
                  initialVatTotal: _vatTotal,
                  initialExpDate: _expDate,
                  initialBestBefore: _bestBefore,
                  initialMfgDate: _mfgDate,
                  initialRetestDate: _retestDate,
                  initialShelfLife: _shelfLife,
                  onChangedQuantity: (index, quantity) {
                    setState(() => _quantity[index] = quantity);
                  },
                  onChangedBatch: (index, batch) {
                    setState(() => _batch[index] = batch);
                  },
                  onChangedVatTotal: (index, vatTotal) {
                    setState(() => _vatTotal[index] = vatTotal);
                  },
                  onChangedExpDate: (index, date) {
                    setState(() => _expDate[index] = date);
                  },
                  onChangedBestBefore: (index, date) {
                    setState(() => _bestBefore[index] = date);
                  },
                  onChangedMfgDate: (index, date) {
                    setState(() => _mfgDate[index] = date);
                  },
                  onChangedRetestDate: (index, date) {
                    setState(() => _retestDate[index] = date);
                  },
                  onChangedShelfLife: (index, date) {
                    setState(() => _shelfLife[index] = date);
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
