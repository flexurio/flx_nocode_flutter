import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return/material_return_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return_create/widget/detail_data_table.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReturnCreateReviewForm extends StatefulWidget {
  const MaterialReturnCreateReviewForm({
    required this.onPrevious,
    required this.action,
    required this.isExternal,
    super.key,
    this.materialReturn,
    this.bloc,
    this.materialReturnType,
  });
  final void Function() onPrevious;

  final MaterialReturn? materialReturn;
  final DataAction action;
  final MaterialReturnBloc? bloc;
  final MaterialReturnType? materialReturnType;
  final bool isExternal;

  @override
  State<MaterialReturnCreateReviewForm> createState() =>
      _MaterialReturnCreateReviewFormState();
}

class _MaterialReturnCreateReviewFormState
    extends State<MaterialReturnCreateReviewForm> {
  MaterialReturnFormProduct? _materialReturnFormProduct;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialReturnBloc, MaterialReturnState>(
      builder: (context, state) {
        state.maybeWhen(
          initial: (
            materials,
            materialReturnFormProduct,
          ) {
            if (materialReturnFormProduct != null) {
              _materialReturnFormProduct = materialReturnFormProduct;
            }
          },
          orElse: () {},
        );

        if (_materialReturnFormProduct == null) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        final actions = <Widget>[];
        if (widget.materialReturn == null) {
          actions.addAll(
            [
              Button(
                isSecondary: true,
                permission: null,
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

        return FormAction(
          actions: actions,
          children: [
            RowFields(
              children: [
                TileDataVertical(
                  label: 'product'.tr(),
                  child: Text(
                    _materialReturnFormProduct!.product != null
                        ? _materialReturnFormProduct!.product!.name
                        : '-',
                  ),
                ),
                TileDataVertical(
                  label: 'Batch',
                  child: Text(
                    _materialReturnFormProduct!.productionOrder != null
                        ? _materialReturnFormProduct!.productionOrder!.id
                        : '-',
                  ),
                ),
              ],
            ),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'product_id'.tr(),
                  child: Text(
                    _materialReturnFormProduct!.product != null
                        ? _materialReturnFormProduct!.product!.id
                        : '-',
                  ),
                ),
                TileDataVertical(
                  label: 'Material Group',
                  child: Text(_materialReturnFormProduct!.materialGroup.id),
                ),
              ],
            ),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'Return Type',
                  child: Text(_materialReturnFormProduct!.transactionType.name),
                ),
                TileDataVertical(
                  label: 'department'.tr(),
                  child: Text(_materialReturnFormProduct!.department.name),
                ),
              ],
            ),
            TileDataVertical(
              label: 'description'.tr(),
              child: Text(_materialReturnFormProduct!.remarks),
            ),
            const SizedBox(height: 24),
            MaterialReturnDetailDataTable(
              action: widget.action,
              bloc: widget.bloc,
              materialReturn: widget.materialReturn,
              isExternal: widget.isExternal,
            ),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }

  void _submit(BuildContext context) {
    final bloc = context.read<MaterialReturnBloc>();
    const action = DataAction.create;
    showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<MaterialReturnBloc, MaterialReturnState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              error: (error) => Toast(context).fail(error),
              success: () {
                Toast(context).dataChanged(action, Entity.materialReturn);
                Navigator.pop(context, true);
              },
            );
          },
          child: BlocBuilder<MaterialReturnBloc, MaterialReturnState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                orElse: () => false,
                loading: () => true,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.materialReturn,
                onConfirm: () {
                  bloc.add(const MaterialReturnEvent.submit());
                },
              );
            },
          ),
        );
      },
    );
  }
}
