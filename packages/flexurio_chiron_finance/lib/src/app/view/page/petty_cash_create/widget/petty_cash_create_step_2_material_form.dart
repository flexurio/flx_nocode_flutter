import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flutter/cupertino.dart';
import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_query/material_request_detail_query_bloc.dart';

class PettyCashCreateMaterialForm extends StatefulWidget {
  const PettyCashCreateMaterialForm({
    required this.onNext,
    required this.onPrevious,
    super.key,
  });

  final void Function() onNext;
  final void Function() onPrevious;

  @override
  State<PettyCashCreateMaterialForm> createState() =>
      _PettyCashCreateMaterialFormState();
}

class _PettyCashCreateMaterialFormState
    extends State<PettyCashCreateMaterialForm> {
  final _formKey = GlobalKey<FormState>();
  final _materials = <int, PurchaseOrderDetail>{};
  final _quantity = <int, double>{};
  final _price = <int, double>{};
  final _amountController = TextEditingController();
  var _data = <PurchaseOrderDetail>[];

  void _submit(BuildContext context, PettyCashType pettyCashType) {
    final materials = <PurchaseOrderDetail>[];
    var vehicleRentAmount = 0.0;

    switch (pettyCashType) {
      case PettyCashType.generalExpense:
        materials.addAll(_data.map((e) {
          final unit = e.unit;
          final material = e.material?.copyWith(materialUnit: unit);
          return e.copyWith(material: material);
        }));
        break;
      case PettyCashType.pettyCash:
        for (var i = 0; i < _data.length; i++) {
          final quantity = _quantity[i];
          final price = _price[i];
          if (quantity != null && price != null && quantity > 0 && price > 0) {
            materials.add(_materials[i]!);
          }
        }
        break;
      case PettyCashType.vehicleRent:
        if (_amountController.text.isEmpty) {
          Toast(context).fail(ErrorMessage.fieldRequired('amount'.tr()));
          return;
        }
        vehicleRentAmount = stringDecimalToDouble(_amountController.text);
        break;
      default:
        Toast(context).fail('not implemented');
        return;
    }

    if (!pettyCashType.isVehicleRent && materials.isEmpty) {
      Toast(context).fail('Please provide the prices for all materials');
      return;
    }

    context.read<PettyCashBloc>().add(
          PettyCashEvent.createStep2FormDetails(
            materials,
            vehicleRentAmount,
          ),
        );
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PettyCashBloc, PettyCashState>(
      listener: (context, state) {
        state.maybeWhen(
          initial: (purchaseOrder, vehicleRent, materials, type) {
            if (type == PettyCashType.generalExpense) {
              if (purchaseOrder != null && materials == null) {
                context.read<PurchaseOrderDetailQueryBloc>().add(
                      PurchaseOrderDetailQueryEvent.fetch(
                        purchaseOrder: purchaseOrder,
                      ),
                    );
              }
            } else if (type == PettyCashType.pettyCash) {
              context.read<MaterialRequestDetailQueryBloc>().add(
                    MaterialRequestDetailQueryEvent.fetch(
                      materialRequest: purchaseOrder!.materialRequest,
                      status: PurchaseRequestDetailStatus.confirm,
                    ),
                  );
            }
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<PettyCashBloc, PettyCashState>(
        builder: (context, state) {
          return state.maybeWhen(
            initial: (purchaseOrder, vehicleRent, details, pettyCashType) {
              return FormAction(
                formKey: _formKey,
                actions: [
                  _buildBackButton(),
                  const Gap(12),
                  _buildNextButton(context, pettyCashType),
                ],
                children: [
                  if (pettyCashType == PettyCashType.vehicleRent)
                    _buildFormFromVehicleRent(vehicleRent!),
                  if (pettyCashType == PettyCashType.generalExpense)
                    _buildTableFromPurchaseOrder(pettyCashType, purchaseOrder),
                  if (pettyCashType == PettyCashType.pettyCash)
                    BlocBuilder<MaterialRequestDetailQueryBloc,
                        MaterialRequestDetailQueryState>(
                      builder: (context, state) {
                        _data = state.maybeWhen(
                          loaded: (materialRequestDetails) =>
                              materialRequestDetails
                                  .map((e) => e.toPurchaseOrderDetail)
                                  .toList(),
                          orElse: () => <PurchaseOrderDetail>[],
                        );
                        return _buildTable(
                          status: state.maybeWhen(
                            loaded: (_) => Status.loaded,
                            loading: () => Status.progress,
                            orElse: () => Status.error,
                          ),
                          pettyCashType: pettyCashType,
                          purchaseOrder: purchaseOrder,
                        );
                      },
                    ),
                ],
              );
            },
            orElse: CupertinoActivityIndicator.new,
          );
        },
      ),
    );
  }

  Widget _buildFormFromVehicleRent(VehicleRent vehicleRent) {
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
        Gap(12),
        FTextFormField(
          enabled: false,
          labelText: 'amount'.tr(),
          validator: requiredValidator.call,
          controller: _amountController..text = vehicleRent.totalCost.format(),
          inputFormatters: [currencyFormatter],
        ),
      ],
    );
  }

  Widget _buildTableFromPurchaseOrder(
      PettyCashType? pettyCashType, PurchaseOrder? purchaseOrder) {
    return BlocBuilder<PurchaseOrderDetailQueryBloc,
        PurchaseOrderDetailQueryState>(
      builder: (context, state) {
        _data = state.maybeWhen(
          loaded: (purchaseOrderDetail) => purchaseOrderDetail,
          orElse: () => <PurchaseOrderDetail>[],
        );
        return _buildTable(
          status: state.maybeWhen(
            loaded: (_) => Status.loaded,
            loading: () => Status.progress,
            orElse: () => Status.error,
          ),
          pettyCashType: pettyCashType,
          purchaseOrder: purchaseOrder,
        );
      },
    );
  }

  Button _buildBackButton() {
    return Button(
      permission: null,
      isSecondary: true,
      action: DataAction.back,
      onPressed: () => widget.onPrevious(),
    );
  }

  Button _buildNextButton(
    BuildContext context,
    PettyCashType? pettyCashType,
  ) {
    return Button(
      permission: null,
      action: DataAction.next,
      onPressed: () => _submit(context, pettyCashType!),
    );
  }

  Widget _buildTable({
    required Status status,
    required PettyCashType? pettyCashType,
    required PurchaseOrder? purchaseOrder,
  }) {
    if (pettyCashType == PettyCashType.generalExpense) {
      _materials.clear();
      for (var i = 0; i < _data.length; i++) {
        final unit = _data[i].unit;
        final material = _data[i].material?.copyWith(materialUnit: unit);
        _materials[i] = _data[i].copyWith(material: material);
      }
      return ReviewFormDetailTable(
        purchaseOrderDetails: _materials.values.toList(),
        purchaseOrder: purchaseOrder,
        hideAmount: pettyCashType == PettyCashType.generalExpense,
      );
    }
    if (pettyCashType == PettyCashType.pettyCash) {
      return PurchaseOrderDetailMaterialTableEdit(
        data: _data.map((e) => e.toMaterialRequestDetail).toList(),
        status: status,
        hideAction: true,
        onChangedQuantity: (quantity, index) {
          _quantity[index] = quantity;
          _updateSubTotal();
        },
        onChangedPrice: (price, _, index) {
          _price[index] = price;
          _updateSubTotal();
        },
        materials: _materials,
        temporaryLength: 0,
      );
    }
    return Container();
  }

  void _updateSubTotal() {
    for (var index = 0; index < _data.length; index++) {
      final unit = _data[index].unit;
      final materialRequestDetail = _data[index].toMaterialRequestDetail;
      _materials[index] = PurchaseOrderDetail.empty().copyWith(
        product: materialRequestDetail.product,
        material: materialRequestDetail.material?.copyWith(materialUnit: unit),
        quantity: _quantity.containsKey(index) ? _quantity[index]! : 0,
        price: _price.containsKey(index) ? _price[index]! : 0,
        id: _data[index].id,
        materialDesign: materialRequestDetail.materialDesign,
        materialRequestDetail: materialRequestDetail.status ==
                PurchaseRequestDetailStatus.temporary
            ? null
            : materialRequestDetail,
        unit: _data[index].unit,
      );
    }
    setState(() {});
  }
}
