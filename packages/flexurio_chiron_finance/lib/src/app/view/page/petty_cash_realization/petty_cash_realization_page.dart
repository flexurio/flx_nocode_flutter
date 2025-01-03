import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_temporary/material_request_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/supplier.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class PettyCashRealizationPage extends StatefulWidget {
  const PettyCashRealizationPage._(this.pettyCash);

  final PettyCash pettyCash;

  static Route<bool?> route({required PettyCash pettyCash}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PettyCashBloc()),
          BlocProvider(
            create: (context) => SupplierQueryBloc()
              ..add(
                SupplierQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => PettyCashDetailQueryBloc()
              ..add(
                PettyCashDetailQueryEvent.fetchByPettyCashId(
                  pettyCashId: pettyCash.id,
                ),
              ),
          ),
          BlocProvider(
            create: (context) => MaterialRequestDetailTemporaryBloc(),
          ),
        ],
        child: PettyCashRealizationPage._(pettyCash),
      ),
    );
  }

  @override
  State<PettyCashRealizationPage> createState() =>
      _PettyCashRealizationPageState();
}

class _PettyCashRealizationPageState extends State<PettyCashRealizationPage> {
  final _pettyCashDetails = <int, PettyCashDetail>{};
  final _quantity = <int, double>{};
  final _price = <int, double>{};
  final _action = DataAction.realization;
  final _entity = Entity.pettyCash;
  Supplier? _supplier;
  Ppn? _ppn;
  var _totalAmount = 0.0;
  var _ppnAmount = 0.0;
  var _subtotal = 0.0;

  final _descriptionController = TextEditingController();
  final _discountController = TextEditingController(text: '0');
  final _shippingCostController = TextEditingController(text: '0');
  final _ppnController = TextEditingController();
  final _pphController = TextEditingController(text: '0');
  final _roundingController = TextEditingController(text: '0');
  final _recipientController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _recipientController.text = widget.pettyCash.recipient;
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _discountController.dispose();
    _shippingCostController.dispose();
    _ppnController.dispose();
    _pphController.dispose();
    _roundingController.dispose();
    _recipientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PettyCashBloc, PettyCashState>(
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(_action, _entity);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
        ),
        BlocListener<PettyCashDetailQueryBloc, PettyCashDetailQueryState>(
          listener: (context, state) {
            state.maybeWhen(
              loaded: (pettyCashDetail) {
                _pettyCashDetails.clear();
                for (var i = 0; i < pettyCashDetail.data.length; i++) {
                  _pettyCashDetails[i] =
                      pettyCashDetail.data[i].copyWith(price: 0, quantity: 0);
                }
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: SingleFormPanel(
        formKey: _formKey,
        action: _action,
        entity: _entity,
        size: SingleFormPanelSize.large,
        actions: [
          BlocBuilder<PettyCashBloc, PettyCashState>(
            builder: (context, state) {
              return Button(
                permission: null,
                isInProgress: state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                ),
                action: DataAction.realization,
                onPressed: () => _submit(context),
              );
            },
          ),
        ],
        children: [
          RowFields(
            children: [
              TileDataVertical(
                label: 'Petty Cash',
                child: Text(widget.pettyCash.id).canCopy(),
              ),
              TileDataVertical(
                label: 'Purchase Order ID',
                child: Text(widget.pettyCash.purchaseOrder.id).canCopy(),
              ),
            ],
          ),
          const Gap(24),
          RowFields(
            children: [
              _buildFieldRecipient(),
              if (widget.pettyCash.isGeneralExpense) _buildFieldDescription(),
            ],
          ),
          const Gap(24),
          RowFields(
            children: [
              FDropDownSearchSupplier(
                initialValue: _supplier,
                onChanged: (supplier) {
                  if (supplier != null) _supplier = supplier;
                },
              ),
              FTextFormField(
                controller: _discountController,
                validator: requiredValidator.call,
                labelText: 'Discount Amount',
                onChanged: (_) => _updateTotalAmount(),
                inputFormatters: [
                  currencyFormatter,
                ],
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
                  _updateTotalAmount();
                },
              ),
              FTextFormField(
                controller: _pphController,
                validator: requiredValidator.call,
                labelText: 'PPH Amount',
                onChanged: (_) => _updateTotalAmount(),
                inputFormatters: [
                  currencyFormatter,
                ],
              ),
            ],
          ),
          const Gap(24),
          RowFields(
            children: [
              FTextFormField(
                controller: _shippingCostController,
                validator: requiredValidator.call,
                labelText: 'Shipping Cost',
                onChanged: (p0) => _updateTotalAmount(),
                inputFormatters: [
                  currencyFormatter,
                ],
              ),
              FTextFormField(
                controller: _roundingController,
                validator: requiredValidator.call,
                labelText: 'Rounding',
                onChanged: (p0) => _updateTotalAmount(),
                inputFormatters: [
                  currencyFormatter,
                ],
              ),
            ],
          ),
          const Gap(24),
          _buildPettyCashTableEditor(),
          const Gap(24),
          ConfirmFormTotalDetails(
            totalAmount: _subtotal,
            pettyCash: widget.pettyCash.copyWith(
              discountAmount: stringDecimalToDouble(_discountController.text),
              ppnAmount: _ppnAmount,
              pphAmount: stringDecimalToDouble(_pphController.text),
              shippingCost: stringDecimalToDouble(_shippingCostController.text),
              rounding: stringDecimalToDouble(_roundingController.text),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFieldRecipient() {
    return FTextFormField(
      labelText: 'Recipient',
      controller: _recipientController,
      validator: requiredValidator.call,
    );
  }

  Widget _buildFieldDescription() {
    return FTextFormField(
      labelText: 'description'.tr(),
      controller: _descriptionController,
      validator: requiredValidator.call,
    );
  }

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    final bloc = context.read<PettyCashBloc>();
    showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<PettyCashBloc, PettyCashState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(_action, Entity.pettyCash);
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
                action: _action,
                data: _entity,
                label: widget.pettyCash.id,
                onConfirm: () {
                  bloc.add(
                    PettyCashEvent.realization(
                      description: widget.pettyCash.isGeneralExpense
                          ? _descriptionController.text
                          : null,
                      pettyCash: widget.pettyCash,
                      details: _pettyCashDetails.values.toList(),
                      ppn: _ppn!,
                      supplier: _supplier!,
                      pphAmount: stringDecimalToDouble(_pphController.text),
                      rounding: stringDecimalToDouble(_roundingController.text),
                      discountAmount:
                          stringDecimalToDouble(_discountController.text),
                      shippingCost:
                          stringDecimalToDouble(_shippingCostController.text),
                      recipient: _recipientController.text,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  void _updateSubTotal() {
    final pettyCashDetails = _pettyCashDetails.values.toList();
    for (var index = 0; index < pettyCashDetails.length; index++) {
      final quantity = _quantity.containsKey(index) ? _quantity[index]! : 0.0;
      final price = _price.containsKey(index) ? _price[index]! : 0.0;
      _pettyCashDetails[index] = _pettyCashDetails[index]!.copyWith(
        quantity: quantity,
        price: price,
        realizationPrice: quantity * price,
      );
    }
    _updateTotalAmount();
  }

  void _updateTotalAmount() {
    _subtotal = _pettyCashDetails.values.toList().fold<double>(
          0,
          (total, material) => total + material.realizationPrice,
        );

    final discount = stringDecimalToDouble(_discountController.text);
    _ppnAmount = ((_ppn?.id ?? 0) / 100) * (_subtotal - discount);

    _totalAmount = _subtotal +
        _ppnAmount -
        stringDecimalToDouble(_pphController.text) -
        stringDecimalToDouble(_discountController.text) +
        stringDecimalToDouble(_shippingCostController.text) +
        stringDecimalToDouble(_roundingController.text);
    setState(() {});
  }

  Widget _buildPettyCashTableEditor() {
    return BlocBuilder<PettyCashDetailQueryBloc, PettyCashDetailQueryState>(
      builder: (context, state) {
        final data = state.maybeWhen(
          loaded: (pettyCash) => pettyCash.data,
          orElse: () => <PettyCashDetail>[],
        );

        final status = state.maybeWhen(
          loaded: (_) => Status.loaded,
          loading: () => Status.progress,
          orElse: () => Status.error,
        );
        final materialRequestDetails = data
            .map(
              (e) => PurchaseRequestDetail.empty().copyWith(
                material: e.material,
                quantity: e.quantity,
                unit: e.unit,
              ),
            )
            .toList();
        return PurchaseOrderDetailMaterialTableEdit(
          data: materialRequestDetails,
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
          materials: _pettyCashDetails.map(
            (key, value) => MapEntry(key, value.toPurchaseOrderDetail),
          ),
          temporaryLength: 0,
        );
      },
    );
  }
}
