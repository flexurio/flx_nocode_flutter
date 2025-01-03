import 'package:flexurio_chiron_finance/src/app/bloc/currency_query/currency_query_bloc.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/rate_query/rate_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_type_query/transaction_type_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_finance/src/app/model/rate.dart';
import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/customer.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/department.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/transaction_type.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_note/product_return_note_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_note.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/currency.dart';

class ProductReturnNoteCreatePage extends StatefulWidget {
  const ProductReturnNoteCreatePage({
    super.key,
    this.productReturnNote,
  });

  final ProductReturnNote? productReturnNote;

  static Widget prepare({
    ProductReturnNote? productReturnNote,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DepartmentQueryBloc()
            ..add(
              DepartmentQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => CustomerQueryBloc()
            ..add(
              CustomerQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => TransactionTypeQueryBloc()
            ..add(
              TransactionTypeQueryEvent.fetch(
                name: 'RETUR NOTES',
                flag: TransactionTypeFlag.perkiraanRetur.id,
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => CurrencyQueryBloc()
            ..add(CurrencyQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
        BlocProvider(
          create: (context) => PurchaseOrderQueryBloc()
            ..add(
              PurchaseOrderQueryEvent.fetch(
                status: [PurchaseOrderStatus.input],
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(create: (context) => RateQueryBloc()),
        BlocProvider(
          create: (context) => ProductReturnNoteBloc(),
        ),
      ],
      child: ProductReturnNoteCreatePage(productReturnNote: productReturnNote),
    );
  }

  @override
  State<ProductReturnNoteCreatePage> createState() =>
      _ProductReturnNoteCreatePageState();
}

class _ProductReturnNoteCreatePageState
    extends State<ProductReturnNoteCreatePage> {
  final formatter = NumberFormat('#,###.##');
  final _formKey = GlobalKey<FormState>();
  final _shippingAddressController = TextEditingController();
  final _addressNameController = TextEditingController();
  final _remarkController = TextEditingController();
  final _discountPercentController = TextEditingController();
  final _rateController = TextEditingController();
  final _purchaseOrderController = TextEditingController();
  final _taxInvoiceDateController = TextEditingController();
  final _returnDateController = TextEditingController();
  double ppnP = 0;

  double ppnValue() {
    return ppnP / 100;
  }

  late DataAction _action;
  DateTime? _returnDate;
  DateTime? _taxInvoiceDate;
  late Ppn _ppn;
  late Currency _currency;
  Customer? _customer;
  late TransactionType _transactionType;
  Rate? _rate;
  late Department _department;

  @override
  void initState() {
    _action = createOrEdit(widget.productReturnNote);
    super.initState();
    if (_action.isEdit) {
      final productReturnNote = widget.productReturnNote!;
      _rateController.text = productReturnNote.rate.toString();
      _department = productReturnNote.department;
      _customer = productReturnNote.customer;
      _transactionType = productReturnNote.transactionType;
      productReturnNote.transactionType.name;
      _taxInvoiceDate = productReturnNote.deliveryNoteDate;
      _currency = productReturnNote.currency;
      _addressNameController.text = productReturnNote.addressName;
      _shippingAddressController.text = productReturnNote.shippingAddress;
      _returnDate = productReturnNote.returnDate;
      _purchaseOrderController.text = productReturnNote.purchaseOrderId;
      productReturnNote.termOfPayment.toString();
      productReturnNote.termOfPayment.toString();
      productReturnNote.termOfPayment.toString();
      _ppn = productReturnNote.ppnPercent;
      _remarkController.text = productReturnNote.remark;
      _discountPercentController.text =
          productReturnNote.discountPercent.toString();
      context.read<RateQueryBloc>().add(
            RateQueryEvent.fetch(currency: _currency),
          );
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (_action.isEdit) {
        context.read<ProductReturnNoteBloc>().add(
              ProductReturnNoteEvent.edit(
                productReturnNoteId: widget.productReturnNote!.id,
                shippingAddress: _shippingAddressController.text,
                addressName: _addressNameController.text,
                deliveryNoteDate: _taxInvoiceDate!,
                termOfPayment: 0,
                remark: _remarkController.text,
                subtotal: 0,
                discountPercentage:
                    stringDecimalToDouble(_discountPercentController.text),
                discountValue: 0,
                ppnPercentage: _ppn,
                ppnValue: 0,
                total: 0,
                currencyId: _currency.id,
                transactionTypeId: _transactionType.id,
                rateId: _rate!.id,
                purchaseOrderId: _purchaseOrderController.text,
              ),
            );
      } else {
        context.read<ProductReturnNoteBloc>().add(
              ProductReturnNoteEvent.create(
                currencyId: _currency.id,
                customerId: _customer!.id,
                departmentId: _department.id,
                transactionTypeId: _transactionType.id,
                rateId: _rate!.id,
                purchaseOrderId: _purchaseOrderController.text,
                returnDate: _returnDate!,
                shippingAddress: _shippingAddressController.text,
                addressName: _addressNameController.text,
                deliveryNoteDate: _taxInvoiceDate!,
                termOfPayment: 0,
                remark: _remarkController.text,
                subtotal: 0,
                discountPercentage:
                    stringDecimalToDouble(_discountPercentController.text),
                discountValue: 0,
                ppnPercentage: _ppn,
                ppnValue: 0,
                total: 0,
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.productReturnNote;
    return BlocListener<ProductReturnNoteBloc, ProductReturnNoteState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => Toast(context).fail(error),
          success: () {
            Toast(context).dataChanged(_action, entity);
            Navigator.pop(context, true);
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          size: SingleFormPanelSize.large,
          action: _action,
          entity: entity,
          formKey: _formKey,
          actions: [
            _buildButtonSave(),
          ],
          children: [
            RowFields(
              children: [
                _buildFieldDepartment(),
                _buildFieldReferenceNumber(),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                _buildFieldCustomer(),
                _buildFieldDeliveryAddress(),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                _buildFieldTransactionType(),
                _buildFieldTaxInvoiceDate(),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                _buildFieldCurrency(),
                _buildFieldRate(),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                _buildReturnNoteDate(),
                _buildFieldTaxInvoiceNumber(),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                _buildFieldPpn(),
                _buildFieldDiscount(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BlocBuilder<ProductReturnNoteBloc, ProductReturnNoteState>
      _buildButtonSave() {
    return BlocBuilder<ProductReturnNoteBloc, ProductReturnNoteState>(
      builder: (context, state) {
        return Button(
          action: _action,
          onPressed: _submit,
          isInProgress: state.maybeWhen(
            orElse: () => false,
            loading: () => true,
          ),
          permission: null,
        );
      },
    );
  }

  Widget _buildFieldCurrency() {
    return FDropDownSearchCurrency(
      isRequired: false,
      initialValue: widget.productReturnNote?.currency,
      label: 'currency'.tr(),
      onChanged: (currency) {
        if (currency != null) {
          _currency = currency;
          context.read<RateQueryBloc>().add(
                RateQueryEvent.fetch(currency: currency),
              );
        }
      },
    );
  }

  Widget _buildFieldRate() {
    return BlocBuilder<RateQueryBloc, RateQueryState>(
      builder: (context, state) {
        state.maybeWhen(
          loaded: (rate) {
            if (rate.data.isNotEmpty) {
              _rateController.text = rate.data[0].rate.toString();
              _rate = rate.data[0];
            } else {
              _rateController.text = '0';
            }
          },
          orElse: () => const Center(child: CupertinoActivityIndicator()),
        );
        return FTextFormField(
          controller: _rateController,
          labelText: 'rate'.tr(),
          enabled: false,
        );
      },
    );
  }

  FTextFormField _buildFieldDiscount() {
    return FTextFormField(
      labelText: 'discount'.tr(),
      controller: _discountPercentController,
      validator: requiredValidator.call,
      suffixText: '%',
      maxLength: 3,
      onChanged: (discount) {
        if (double.parse(discount) > 100) {
          _discountPercentController.text = '100';
        }
      },
      inputFormatters: [
        DecimalInputFormatter(),
      ],
    );
  }

  FDropDownSearch<Ppn> _buildFieldPpn() {
    return FDropDownSearch<Ppn>(
      labelText: 'percent_ppn'.tr(),
      initialValue: widget.productReturnNote?.ppnPercent,
      itemAsString: (ppn) => ppn.label,
      onChanged: (ppn) {
        if (ppn != null) {
          ppnP = ppn.id;
          _ppn = ppn;
        }
      },
      items: const [
        Ppn.none,
        Ppn.ppn11,
        Ppn.ppn12,
      ],
    );
  }

  FTextFormField _buildFieldTaxInvoiceNumber() {
    return FTextFormField(
      labelText: 'description'.tr(),
      controller: _remarkController,
      validator: requiredValidator.call,
    );
  }

  FieldDatePicker _buildReturnNoteDate() {
    return FieldDatePicker(
      labelText: 'return_note_date'.tr(),
      controller: _returnDateController,
      enabled: _action.isCreate,
      validator: requiredObjectValidator.call,
      initialSelectedDate: _returnDate,
      onChanged: (value) => _returnDate = value,
    );
  }

  FieldDatePicker _buildFieldTaxInvoiceDate() {
    return FieldDatePicker(
      labelText: 'tax_invoice_date'.tr(),
      controller: _taxInvoiceDateController,
      initialSelectedDate: _taxInvoiceDate,
      validator: requiredObjectValidator.call,
      onChanged: (value) => _taxInvoiceDate = value,
      enabled: _action.isCreate,
    );
  }

  FDropDownSearchCustomer _buildFieldCustomer() {
    return FDropDownSearchCustomer(
      label: 'customer'.tr(),
      enabled: _action.isCreate,
      initialValue: widget.productReturnNote?.customer,
      itemAsString: (customer) => '${customer!.id} - ${customer.name}',
      onChanged: (customer) {
        if (customer != null) {
          _customer = customer;
          _addressNameController.text = customer.name;
          _shippingAddressController.text = customer.id;
          setState(() {});
        }
      },
    );
  }

  Widget _buildFieldDeliveryAddress() {
    final queryBloc = CustomerQueryBloc();
    if (_customer != null) {
      queryBloc.add(
        CustomerQueryEvent.fetch(
          parent: _customer,
          pageOptions: PageOptions.emptyNoLimit(),
        ),
      );
    }
    return BlocProvider(
      key: ValueKey(_customer),
      create: (context) => queryBloc,
      child: Builder(
        builder: (context) {
          return FDropDownSearchCustomer(
            label: 'delivery_address'.tr(),
            initialValue: _customer ?? widget.productReturnNote?.customer,
            enabled: _action.isCreate,
            itemAsString: (customer) => customer!.id,
            onChanged: (customer) {
              if (customer != null) {
                _addressNameController.text = customer.name;
                _shippingAddressController.text = customer.id;
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildFieldTransactionType() {
    return FDropDownSearchTransactionType(
      label: 'transaction_type'.tr(),
      initialValue: widget.productReturnNote?.transactionType,
      itemAsString: (type) => '[${type.id}] ${type.code} - ${type.name}',
      onChanged: (type) {
        if (type != null) {
          _transactionType = type;
        }
      },
    );
  }

  Widget _buildFieldReferenceNumber() {
    return FTextFormField(
      labelText: 'reference_number'.tr(),
      controller: _purchaseOrderController,
    );
  }

  Widget _buildFieldDepartment() {
    return FDropDownSearchDepartment(
      label: 'department'.tr(),
      enabled: _action.isCreate,
      itemAsString: (department) => '${department!.id} - ${department.name}',
      initialValue: widget.productReturnNote?.department,
      onChanged: (department) {
        if (department != null) {
          _department = department;
        }
      },
    );
  }
}
