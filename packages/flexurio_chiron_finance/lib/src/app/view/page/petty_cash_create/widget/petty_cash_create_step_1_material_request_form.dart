import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_query/material_request_query_bloc.dart';
import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_request.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/purchase_order.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/vehicle_rent.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PettyCashCreateTypeForm extends StatefulWidget {
  const PettyCashCreateTypeForm._({
    required this.onNext,
    required this.viewOnly,
  });

  final void Function() onNext;
  final bool viewOnly;

  static Widget prepare({
    required void Function() onNext,
    PettyCash? pettyCash,
    bool viewOnly = false,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PurchaseRequestQueryBloc()
            ..add(
              PurchaseRequestQueryEvent.fetch(
                status: PurchaseRequestStatus.inProgress,
                isOrder: false,
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => PurchaseOrderQueryBloc()
            ..add(
              PurchaseOrderQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
                status: [PurchaseOrderStatus.accountingConfirm],
                paymentType: PurchaseOrderPaymentType.termOfPayment,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => VehicleRentQueryBloc()
            ..add(
              VehicleRentQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) =>
              CurrencyQueryBloc()..add(const CurrencyQueryEvent.fetch()),
        ),
      ],
      child: PettyCashCreateTypeForm._(onNext: onNext, viewOnly: viewOnly),
    );
  }

  @override
  State<PettyCashCreateTypeForm> createState() =>
      _PettyCashCreateTypeFormState();
}

class _PettyCashCreateTypeFormState extends State<PettyCashCreateTypeForm> {
  final _formKey = GlobalKey<FormState>();
  MaterialRequest? _materialRequest;
  PurchaseOrder? _purchaseOrder;
  PettyCashType? _pettyCashType;
  VehicleRent? _vehicleRent;
  final _pettyCashTypeController = TextEditingController();

  @override
  void dispose() {
    _pettyCashTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormAction(
      formKey: _formKey,
      actions: [if (!widget.viewOnly) _buildNextButton(context)],
      children: [
        SelectChipField<PettyCashType>(
          label: 'type'.tr(),
          getLabel: (type) => type.label,
          controller: _pettyCashTypeController,
          options: PettyCashType.list,
          validator: requiredValidator.call,
          onChanged: (value) {
            setState(() {
              _pettyCashType = value;
            });
          },
        ),
        const Gap(24),
        _buildSourceData(),
      ],
    );
  }

  Widget _buildSourceData() {
    switch (_pettyCashType) {
      case PettyCashType.pettyCash:
        return FDropDownSearchMaterialRequest(
          onChanged: (materialRequest) {
            if (materialRequest != null) {
              _materialRequest = materialRequest;
            }
          },
        );
      case PettyCashType.generalExpense:
        return FDropDownSearchPurchaseOrder(
          onChanged: (purchaseOrder) {
            if (purchaseOrder != null) {
              _purchaseOrder = purchaseOrder;
            }
          },
        );
      case PettyCashType.vehicleRent:
        return FDropDownSearchVehicleRent(
          onChanged: (vehicleRent) {
            if (vehicleRent != null) {
              _vehicleRent = vehicleRent;
            }
          },
        );
      default:
        return Container();
    }
  }

  Button _buildNextButton(BuildContext context) {
    return Button(
      permission: null,
      action: DataAction.next,
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<PettyCashBloc>().add(
                PettyCashEvent.createStep1FormType(
                  _materialRequest,
                  _purchaseOrder,
                  _vehicleRent,
                  _pettyCashType!,
                ),
              );

          widget.onNext();
        }
      },
    );
  }
}
