import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/tax.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order/purchase_order_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class PurchaseOrderCreateDiscountPpnForm extends StatefulWidget {
  const PurchaseOrderCreateDiscountPpnForm({
    required this.onNext,
    required this.onPrevious,
    super.key,
    this.purchaseOrder,
  });

  final void Function() onNext;
  final void Function() onPrevious;
  final PurchaseOrder? purchaseOrder;

  @override
  State<PurchaseOrderCreateDiscountPpnForm> createState() =>
      _PurchaseOrderCreateDiscountPpnFormState();
}

class _PurchaseOrderCreateDiscountPpnFormState
    extends State<PurchaseOrderCreateDiscountPpnForm> {
  final _discountController = TextEditingController(text: '0');
  final _ppnController = TextEditingController();
  final _paymentTypeController = TextEditingController();
  final _downPaymentController = TextEditingController(text: '0');
  final _termOfPaymentController = TextEditingController();
  final _noteController = TextEditingController();

  TaxType? _taxType;
  Ppn? _ppn;
  var _paymentType = PurchaseOrderPaymentType.termOfPayment;

  final _formKey = GlobalKey<FormState>();

  late DataAction _action;

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.purchaseOrder);
    if (_action.isEdit) {
      _taxType = widget.purchaseOrder!.taxType;
      _ppn = widget.purchaseOrder!.ppn;
      _paymentType = widget.purchaseOrder!.paymentType;
      _discountController.text =
          widget.purchaseOrder!.discountPercent.toString();
      _downPaymentController.text = widget.purchaseOrder!.dpPercent.toString();
      _noteController.text = widget.purchaseOrder!.description;
      _ppnController.text = widget.purchaseOrder!.ppn.label;
      _termOfPaymentController.text =
          widget.purchaseOrder!.termOfPayment.toString();
      _paymentTypeController.text = widget.purchaseOrder!.paymentType.label;
    }
  }

  void _onNext(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<PurchaseOrderBloc>().add(
            PurchaseOrderEvent.createFormDiscount(
              PurchaseOrderFormDiscount(
                paymentType: _paymentType,
                ppn: _ppn!,
                discountPercent:
                    stringDecimalToDouble(_discountController.text),
                downPaymentPercent:
                    stringDecimalToDouble(_downPaymentController.text),
                termOfPayment: stringToInt(_termOfPaymentController.text),
                taxType: _taxType!,
                description: _noteController.text,
              ),
            ),
          );
      widget.onNext();
    }
  }

  void _onEdit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<PurchaseOrderBloc>().add(
            PurchaseOrderEvent.editFormDiscount(
              widget.purchaseOrder!,
              PurchaseOrderFormDiscount(
                paymentType: _paymentType,
                ppn: _ppn!,
                discountPercent:
                    stringDecimalToDouble(_discountController.text),
                downPaymentPercent:
                    stringDecimalToDouble(_downPaymentController.text),
                termOfPayment: stringToInt(_termOfPaymentController.text),
                taxType: _taxType!,
                description: _noteController.text,
              ),
            ),
          );
      widget.onNext();
    }
  }

  @override
  Widget build(BuildContext context) {
    final actions = <Widget>[];
    if (_action.isEdit) {
      actions.add(
        BlocListener<PurchaseOrderBloc, PurchaseOrderState>(
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(_action, Entity.purchaseOrder);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<PurchaseOrderBloc, PurchaseOrderState>(
            builder: (context, state) {
              return Button(
                isInProgress: state.maybeWhen(
                  orElse: () => false,
                  loading: () => true,
                ),
                permission: null,
                action: DataAction.edit,
                onPressed: () => _onEdit(context),
              );
            },
          ),
        ),
      );
    } else {
      actions.addAll([
        Button(
          permission: null,
          isSecondary: true,
          action: DataAction.back,
          onPressed: () {
            widget.onPrevious();
          },
        ),
        const Gap(12),
        Button(
          permission: null,
          action: DataAction.next,
          onPressed: () => _onNext(context),
        ),
      ]);
    }
    return BlocBuilder<PurchaseOrderBloc, PurchaseOrderState>(
      builder: (context, state) {
        final supplier = state.maybeWhen(
          initial: (supplierForm, _, __) => supplierForm?.supplier,
          orElse: () => null,
        );
        if (_action.isCreate) {
          _termOfPaymentController.text =
              (supplier?.termOfPayment ?? 0).toString();
        }

        return FormAction(
          formKey: _formKey,
          actions: actions,
          children: [
            FTextFormField(
              controller: _discountController,
              validator: requiredValidator.call,
              labelText: 'Discount',
              suffixText: '%',
              inputFormatters: [
                currencyFormatter,
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                FTextFormField(
                  controller: _downPaymentController,
                  validator: requiredValidator.call,
                  labelText: 'D.P.',
                  suffixText: '%',
                  inputFormatters: [
                    currencyFormatter,
                  ],
                ),
                FDropDownSearchTaxType(
                  initialValue: _taxType,
                  onChanged: (taxType) {
                    if (taxType != null) {
                      _taxType = taxType;
                    }
                  },
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                SelectChipField<Ppn>(
                  label: 'PPN',
                  getLabel: (ppn) => ppn.label,
                  controller: _ppnController,
                  validator: requiredValidator.call,
                  options: Ppn.list,
                  onChanged: (value) {
                    _ppn = value;
                  },
                ),
                FTextFormField(
                  controller: _termOfPaymentController,
                  validator: requiredValidator.call,
                  labelText: 'Term of Payment',
                  suffixText: 'days',
                  inputFormatters: [
                    ThousandsFormatter(),
                  ],
                ),
              ],
            ),
            const Gap(24),
            FTextFormField(
              controller: _noteController,
              maxLines: 3,
              labelText: 'Note',
            ),
          ],
        );
      },
    );
  }
}
