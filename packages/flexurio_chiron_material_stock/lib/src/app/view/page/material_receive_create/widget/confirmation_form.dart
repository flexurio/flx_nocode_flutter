import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive/material_receive_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/entity.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_create/widget/confirm_form_detail_table.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_create/widget/temporary_confirm_detail_table.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveConfirmationForm extends StatefulWidget {
  const MaterialReceiveConfirmationForm({
    required this.action,
    required this.onPrevious,
    required this.purchaseOrderQuantity,
    super.key,
    this.materialReceive,
    this.bloc,
  });
  final void Function() onPrevious;
  final MaterialReceive? materialReceive;
  final MaterialReceiveBloc? bloc;
  final DataAction action;
  final List<double> purchaseOrderQuantity;

  @override
  State<MaterialReceiveConfirmationForm> createState() =>
      _MaterialReceiveConfirmationFormState();
}

class _MaterialReceiveConfirmationFormState
    extends State<MaterialReceiveConfirmationForm> {
  MaterialReceiveCreateForm? _createForm;
  late MaterialReceiveCreateTypeForm _typeForm;
  List<MaterialReceiveDetail> _materials = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialReceiveBloc, MaterialReceiveState>(
      builder: (context, state) {
        state.maybeWhen(
          initial: (
            materialReceiveDetail,
            typeForm,
            createFormMaterialReceive,
          ) {
            if (createFormMaterialReceive != null) {
              _createForm = createFormMaterialReceive;
            }
            if (typeForm != null) {
              _typeForm = typeForm;
            }
            _materials = materialReceiveDetail;
          },
          orElse: () {},
        );
        if (_createForm == null) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        final actions = <Widget>[];
        if (widget.materialReceive == null) {
          actions.addAll(
            [
              Button(
                permission: null,
                isSecondary: true,
                isInProgress: isLoading,
                action: DataAction.back,
                onPressed: () {
                  widget.onPrevious();
                },
              ),
              const SizedBox(width: 12),
              Button(
                permission: null,
                isInProgress: isLoading,
                action: DataAction.finish,
                onPressed: () {
                  _submit(context);
                },
              ),
            ],
          );
        }

        final type = _typeForm.type;
        return FormAction(
          actions: actions,
          children: [
            RowFields(
              children: [
                TileDataVertical(
                  label: 'type'.tr(),
                  child: ChipType(type),
                ),
                TileDataVertical(
                  label: 'transaction_type'.tr(),
                  child: Text(_createForm!.transactionType.name),
                ),
              ],
            ),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'purchase_order'.tr(),
                  child: Text(_createForm!.purchaseOrder?.id ?? '-'),
                ),
                TileDataVertical(
                  label: 'delivery_order_date'.tr(),
                  child: Text(_createForm!.deliveryOrderDate?.yMMMd ?? '-'),
                ),
              ],
            ),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'warehouse'.tr(),
                  child: Text(_createForm!.warehouse),
                ),
                TileDataVertical(
                  label: 'manufacturer'.tr(),
                  child: Text(_createForm!.vendor?.name ?? '-'),
                ),
              ],
            ),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'delivery_order'.tr(),
                  child: Text(
                    _createForm!.deliveryOrderId.isEmpty
                        ? '-'
                        : _createForm!.deliveryOrderId,
                  ),
                ),
                TileDataVertical(
                  label: 'description'.tr(),
                  child: Text(
                    _createForm!.description.isEmpty
                        ? '-'
                        : _createForm!.description,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (_createForm?.purchaseOrder != null)
              MaterialReceiveConfirmFormDetailTable(
                qtyPO: widget.purchaseOrderQuantity,
                materialReceiveDetails: _materials,
              )
            else
              const MaterialReceiveTemporaryReviewTable(),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }

  void _submit(BuildContext context) {
    final bloc = context.read<MaterialReceiveBloc>();
    const action = DataAction.create;
    showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<MaterialReceiveBloc, MaterialReceiveState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(
                  action,
                  EntityMaterialStock.materialReceive,
                );
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<MaterialReceiveBloc, MaterialReceiveState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: EntityMaterialStock.materialReceive,
                onConfirm: () {
                  bloc.add(const MaterialReceiveEvent.submit());
                },
              );
            },
          ),
        );
      },
    );
  }
}
