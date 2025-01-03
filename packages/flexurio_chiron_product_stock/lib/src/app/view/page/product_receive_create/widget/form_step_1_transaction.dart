import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_type_query/transaction_type_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/purchase_order.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/supplier.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/transaction_type.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive/product_receive_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_vendor/src/app/bloc/supplier_query/supplier_query_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/model/supplier.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductReceiveCreateTransactionForm extends StatefulWidget {
  const ProductReceiveCreateTransactionForm._({
    required this.onNext,
    this.productReceive,
  });
  final ProductReceive? productReceive;
  final void Function() onNext;

  @override
  State<ProductReceiveCreateTransactionForm> createState() =>
      _ProductReceiveCreateTransactionFormState();

  static Widget prepare({
    required void Function() onNext,
    ProductReceive? productReceive,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PurchaseOrderQueryBloc()
            ..add(
              PurchaseOrderQueryEvent.fetch(
                materialGroupId: ['PRODUCT', 'ALKES'],
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => SupplierQueryBloc()
            ..add(
              SupplierQueryEvent.fetch(pageOptions: PageOptions.emptyNoLimit()),
            ),
        ),
        BlocProvider(
          create: (context) => TransactionTypeQueryBloc(),
        ),
      ],
      child: ProductReceiveCreateTransactionForm._(
        productReceive: productReceive,
        onNext: onNext,
      ),
    );
  }
}

class _ProductReceiveCreateTransactionFormState
    extends State<ProductReceiveCreateTransactionForm> {
  late DataAction _action;

  final _formKey = GlobalKey<FormState>();
  final _deliveryOrderIdController = TextEditingController();
  final _deliveryOrderDateController = TextEditingController();
  final _typeController = TextEditingController();
  final _descriptionController = TextEditingController();

  ProductReceiveType? _type;
  Supplier? _supplier;
  TransactionType? _transactionType;
  PurchaseOrder? _purchaseOrder;
  DateTime? _deliveryOrderDate;

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.productReceive);
    if (_action.isEdit) {
      _type = widget.productReceive!.type;
      _deliveryOrderIdController.text = widget.productReceive!.deliveryOrderId!;
      _deliveryOrderDate = widget.productReceive!.deliveryOrderDate;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final form = ProductReceiveFormTransaction(
        supplier: _supplier,
        transactionType: _transactionType,
        purchaseOrder: _purchaseOrder,
        deliveryOrderId: _deliveryOrderIdController.text,
        deliveryOrderDate: _deliveryOrderDate,
        description: _descriptionController.text,
        type: _type!,
      );
      if (_action.isCreate) {
        context.read<ProductReceiveBloc>().add(
              ProductReceiveEvent.transactionCreate(form),
            );
        widget.onNext();
      } else {
        context.read<ProductReceiveBloc>().add(
              ProductReceiveEvent.transactionEdit(
                widget.productReceive!,
                form,
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    late Widget submitButton;
    if (_action.isCreate) {
      submitButton = _buildSubmitButton();
    } else {
      submitButton = _buildEditButton();
    }

    return FormAction(
      formKey: _formKey,
      actions: [submitButton],
      children: _action.isCreate ? _buildCreateFields : _buildEditFields,
    );
  }

  List<Widget> get _buildCreateFields {
    return [
      _buildFieldType(),
      if (_type != null)
        Column(
          children: [
            const Gap(24),
            if (_type == ProductReceiveType.purchaseOrder)
              _buildDropDownPurchaseOrder(),
            if ([
              ProductReceiveType.nonPurchaseOrder,
              ProductReceiveType.packing,
            ].contains(_type))
              _buildDropDownTransactionType(),
            if (_type == ProductReceiveType.nonPurchaseOrder)
              _buildDropDownSupplier(),
            if (_type != ProductReceiveType.packing)
              _buildDeliveryOrderFields(),
            _buildDescription(),
          ],
        )
    ];
  }

  List<Widget> get _buildEditFields {
    return [
      if (_type != ProductReceiveType.packing) _buildDeliveryOrderFields(),
    ];
  }

  Widget _buildDeliveryOrderFields() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: RowFields(
        children: [
          FTextFormField(
            controller: _deliveryOrderIdController,
            validator: requiredValidator.call,
            labelText: 'Delivery Order ID',
          ),
          FieldDatePicker(
            labelText: 'delivery_order_date'.tr(),
            initialSelectedDate: _deliveryOrderDate,
            controller: _deliveryOrderDateController,
            validator: requiredObjectValidator.call,
            onChanged: (value) => _deliveryOrderDate = value,
            maxDate: DateTime.now(),
          ),
        ],
      ),
    );
  }

  Widget _buildEditButton() {
    return BlocListener<ProductReceiveBloc, ProductReceiveState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(_action, Entity.productReceive);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: _buildSubmitButton(),
    );
  }

  Widget _buildSubmitButton() {
    return BlocBuilder<ProductReceiveBloc, ProductReceiveState>(
      builder: (context, state) {
        return Button(
          permission: null,
          isInProgress: state.maybeWhen(
            orElse: () => false,
            loading: () => true,
          ),
          action: _action.isCreate ? DataAction.next : DataAction.edit,
          onPressed: _submit,
        );
      },
    );
  }

  FTextFormField _buildDescription() {
    return FTextFormField(
      controller: _descriptionController,
      validator: requiredValidator.call,
      labelText: 'description'.tr(),
      maxLines: 4,
    );
  }

  Padding _buildDropDownSupplier() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: FDropDownSearchSupplier(
        isRequired: false,
        initialValue: _supplier,
        onChanged: (supplier) {
          if (supplier != null) {
            _supplier = supplier;
          }
        },
      ),
    );
  }

  Padding _buildDropDownTransactionType() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: FDropDownSearchTransactionType(
        initialValue: _transactionType,
        onChanged: (transactionType) {
          if (transactionType != null) {
            _transactionType = transactionType;
          }
        },
      ),
    );
  }

  Padding _buildDropDownPurchaseOrder() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: RowFields(
        children: [
          FDropDownSearchPurchaseOrder(
            initialValue: _purchaseOrder,
            onChanged: (purchaseOrder) {
              if (purchaseOrder != null) {
                _purchaseOrder = purchaseOrder;
                context.read<PurchaseOrderDetailQueryBloc>().add(
                      PurchaseOrderDetailQueryEvent.fetch(
                        purchaseOrder: _purchaseOrder!,
                      ),
                    );
              }
            },
          ),
        ],
      ),
    );
  }

  SelectChipField<ProductReceiveType> _buildFieldType() {
    return SelectChipField<ProductReceiveType>(
      label: 'Type',
      getLabel: (type) => type.id,
      controller: _typeController,
      validator: requiredValidator.call,
      options: ProductReceiveType.list,
      onChanged: (type) {
        setState(() {
          _type = type;
        });

        String value = '';
        if (_type == ProductReceiveType.nonPurchaseOrder) {
          value = 'ProductInNonPO';
        } else if (_type == ProductReceiveType.packing) {
          value = 'ProductInPacking';
        } else if (_type == ProductReceiveType.purchaseOrder) {
          value = 'ProductIn';
        }

        context.read<TransactionTypeQueryBloc>().add(
              TransactionTypeQueryEvent.fetch(
                flag: 'Modul',
                value: value,
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            );
      },
    );
  }
}
