import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order_down_payment_view/widget/actions.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PurchaseOrderCreateReviewForm extends StatefulWidget {
  const PurchaseOrderCreateReviewForm({
    required this.onPrevious,
    super.key,
    this.purchaseOrder,
  });

  final void Function() onPrevious;
  final PurchaseOrder? purchaseOrder;

  @override
  State<PurchaseOrderCreateReviewForm> createState() =>
      _PurchaseOrderCreateReviewFormState();
}

class _PurchaseOrderCreateReviewFormState
    extends State<PurchaseOrderCreateReviewForm> {
  PurchaseOrderFormSupplier? _formSupplier;
  List<PurchaseOrderDetail>? _materials;
  PurchaseOrderFormDiscount? _formDiscount;

  @override
  Widget build(BuildContext context) {
    final canEdit = widget.purchaseOrder != null &&
        widget.purchaseOrder!.status == PurchaseOrderStatus.input;

    return BlocBuilder<PurchaseOrderBloc, PurchaseOrderState>(
      builder: (context, state) {
        state.maybeWhen(
          initial: (formSupplier, materials, formDiscount) {
            if (formDiscount != null) {
              _formDiscount = formDiscount;
            }
            if (materials != null) {
              _materials = materials;
            }
            if (formSupplier != null) {
              _formSupplier = formSupplier;
            }
          },
          orElse: () {},
        );

        if (_formDiscount == null ||
            _formSupplier == null ||
            _materials == null) {
          return const Center(child: CupertinoActivityIndicator());
        }

        final isProgress = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        final purchaseOrderBloc = context.read<PurchaseOrderBloc>();

        return FormAction(
          isProgress: isProgress,
          actions: [_buildActions(isProgress, purchaseOrderBloc)],
          children: [
            ReviewFormData(
              purchaseOrderFormSupplier: _formSupplier!,
              purchaseOrderFormDiscount: _formDiscount!,
              purchaseOrder: widget.purchaseOrder,
              purchaseOrderBloc: purchaseOrderBloc,
            ),
            const Gap(24),
            if (canEdit) _buildDetailEditButton(context, purchaseOrderBloc),
            ReviewFormDetailTable(
              purchaseOrderDetails: _materials!,
              purchaseOrder: widget.purchaseOrder,
            ),
            const Gap(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (widget.purchaseOrder != null)
                  PurchaseOrderDocumentButton.prepare(widget.purchaseOrder!),
                Expanded(
                  child: ReviewFormTotalDetails(
                    purchaseOrder: widget.purchaseOrder,
                    purchaseOrderDetails: _materials!,
                    purchaseOrderFormDiscount: _formDiscount!,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailEditButton(
    BuildContext context,
    PurchaseOrderBloc purchaseOrderBloc,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: IconButtonSmall(
          permission: PermissionPurchaseOrder.purchaseOrderEdit,
          onPressed: () {
            Navigator.push(
              context,
              PurchaseOrderMaterialFormEditPage.route(
                purchaseOrder: widget.purchaseOrder!,
                purchaseOrderDetails: _materials!,
              ),
            ).then((success) {
              if (success ?? false) {
                purchaseOrderBloc.add(
                  PurchaseOrderEvent.initialize(
                    widget.purchaseOrder!,
                  ),
                );
              }
            });
          },
          action: DataAction.edit,
        ),
      ),
    );
  }

  Widget _buildActions(
    bool isLoading,
    PurchaseOrderBloc purchaseOrderBloc,
  ) {
    return PurchaseOrderActions(
      isLoading: isLoading,
      purchaseOrder: widget.purchaseOrder,
      onPrevious: widget.onPrevious,
      onFinish: () => _submit(context),
      purchaseOrderBloc: purchaseOrderBloc,
    );
  }

  void _submit(BuildContext context) {
    final bloc = context.read<PurchaseOrderBloc>();
    const action = DataAction.create;
    showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<PurchaseOrderBloc, PurchaseOrderState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(
                  action,
                  Entity.purchaseOrder,
                );
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<PurchaseOrderBloc, PurchaseOrderState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.purchaseOrder,
                label: _formSupplier!.materialRequest.id,
                onConfirm: () {
                  bloc.add(const PurchaseOrderEvent.submit());
                },
              );
            },
          ),
        );
      },
    );
  }
}
