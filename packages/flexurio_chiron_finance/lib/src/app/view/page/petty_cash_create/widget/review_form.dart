import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/petty_cash_create/widget/tile_data.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:gap/gap.dart';

class PettyCashCreateReviewForm extends StatefulWidget {
  const PettyCashCreateReviewForm({
    this.onPrevious,
    super.key,
    this.pettyCash,
  });

  final void Function()? onPrevious;
  final PettyCash? pettyCash;

  @override
  State<PettyCashCreateReviewForm> createState() =>
      _PettyCashCreateReviewFormState();
}

class _PettyCashCreateReviewFormState extends State<PettyCashCreateReviewForm> {
  PurchaseOrder? _purchaseOrder;
  PettyCashType? _type;
  VehicleRent? _vehicleRent;
  List<PurchaseOrderDetail> _materials = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PettyCashBloc, PettyCashState>(
      builder: (context, state) {
        state.maybeWhen(
          initial: (purchaseOrder, vehicleRent, materials, type) {
            if (vehicleRent != null) _vehicleRent = vehicleRent;
            if (materials != null) _materials = materials;
            if (purchaseOrder != null) _purchaseOrder = purchaseOrder;
            if (type != null) _type = type;
          },
          orElse: () {},
        );

        final isProgress = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );
        final pettyCashBloc = context.read<PettyCashBloc>();

        double realizationAmount = 0.0;
        if (_type == PettyCashType.vehicleRent) {
          realizationAmount = _vehicleRent!.totalCost;
        } else {
          realizationAmount = _materials.fold<double>(
            0,
            (total, material) => total + material.subtotal,
          );
        }

        final pettyCash = widget.pettyCash;

        return FormAction(
          isProgress: isProgress,
          actions: widget.onPrevious != null
              ? _buildActions(isProgress, pettyCashBloc)
              : null,
          children: [
            if (pettyCash == null)
              if (_type?.isVehicleRent ?? false)
                _TileDataVehicleRent(vehicleRent: _vehicleRent!)
              else
                TileDataVertical(
                  label: 'purchase_request'.tr(),
                  child:
                      Text(_purchaseOrder?.materialRequest.id ?? '-').canCopy(),
                )
            else
              TileDataPettyCash(pettyCash: pettyCash),
            const Gap(24),
            if (!(_type?.isVehicleRent ?? false))
              ReviewFormDetailTable(
                key: Key(pettyCash?.updatedAt.toUtcIso() ?? '-'),
                suffixPrice: 'Realization',
                purchaseOrderDetails: _materials,
                purchaseOrder: _purchaseOrder,
                hideAmount: _type == PettyCashType.generalExpense,
                isPettyCash: true,
              ),
            const Gap(24),
            ConfirmFormTotalDetails(
              totalAmount: realizationAmount,
              pettyCash: widget.pettyCash,
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildActions(
    bool isLoading,
    PettyCashBloc pettyCashBloc,
  ) {
    return [
      Button(
        permission: null,
        isSecondary: true,
        isInProgress: isLoading,
        action: DataAction.back,
        onPressed: () {
          widget.onPrevious?.call();
        },
      ),
      const Gap(12),
      Button(
        permission: null,
        isInProgress: isLoading,
        action: DataAction.finish,
        onPressed: () {
          _submit(context);
        },
      ),
    ];
  }

  void _submit(BuildContext context) {
    final bloc = context.read<PettyCashBloc>();
    const action = DataAction.create;
    showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<PettyCashBloc, PettyCashState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(
                  action,
                  Entity.pettyCash,
                );
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<PettyCashBloc, PettyCashState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.pettyCash,
                label: _purchaseOrder?.materialRequest.id ??
                    _vehicleRent?.id ??
                    '',
                onConfirm: () {
                  bloc.add(
                    _type?.isVehicleRent ?? false
                        ? PettyCashEvent.submitVehicleRent()
                        : const PettyCashEvent.submit(),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class _TileDataVehicleRent extends StatelessWidget {
  const _TileDataVehicleRent({
    required this.vehicleRent,
  });

  final VehicleRent vehicleRent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowFields(
          children: [
            TileDataVertical(
              label: 'ID',
              child: Text(vehicleRent.id),
            ),
            TileDataVertical(
              label: 'Department',
              child: Text(vehicleRent.department.name),
            ),
          ],
        ),
        const SizedBox(height: 5),
        RowFields(
          children: [
            TileDataVertical(
              label: 'Schedule Start',
              child: Text(vehicleRent.scheduledStartDate.yMMMMd),
            ),
            TileDataVertical(
              label: 'Schedule End',
              child: Text(vehicleRent.scheduledEndDate.yMMMMd),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'User',
              child: GetNameUser(userId: vehicleRent.userId),
            ),
            TileDataVertical(
              label: 'description'.tr(),
              child: Text(vehicleRent.description),
            ),
          ],
        ),
      ],
    );
  }
}

class TextLink extends StatelessWidget {
  const TextLink(
    this.text, {
    super.key,
    required this.onTap,
    this.canCopy = false,
  });

  final String text;
  final void Function()? onTap;
  final bool canCopy;

  @override
  Widget build(BuildContext context) {
    if (onTap == null) {
      return Text(text);
    }

    Widget widget = Text(text,
        style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
        ));
    if (canCopy) {
      widget = (widget as Text).canCopy();
    }
    return InkWell(
      child: widget,
      onTap: onTap,
    );
  }
}
