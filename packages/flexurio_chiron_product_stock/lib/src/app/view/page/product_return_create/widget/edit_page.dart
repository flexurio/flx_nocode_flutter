import 'package:flexurio_chiron_finance/src/app/bloc/currency_query/currency_query_bloc.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_type_query/transaction_type_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/currency.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/customer.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/department.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/transaction_type.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return/product_return_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class ProductReturnEditPage extends StatefulWidget {
  const ProductReturnEditPage({required this.productReturn, super.key});

  final ProductReturn productReturn;

  static Widget prepare({
    required ProductReturn productReturn,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductReturnBloc()),
        BlocProvider(
          create: (context) =>
              CurrencyQueryBloc()..add(const CurrencyQueryEvent.fetch()),
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
          create: (context) =>
              DepartmentQueryBloc()..add(const DepartmentQueryEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => TransactionTypeQueryBloc()
            ..add(
              TransactionTypeQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: ProductReturnEditPage(
        productReturn: productReturn,
      ),
    );
  }

  @override
  State<ProductReturnEditPage> createState() => _ProductReturnEditPageState();
}

class _ProductReturnEditPageState extends State<ProductReturnEditPage> {
  final _referenceNoController = TextEditingController();
  final _subtotalController = TextEditingController();
  final _discountPercentController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _discountValueController = TextEditingController();
  final _ppnValueController = TextEditingController();
  final _accountValueController = TextEditingController();
  final _totalController = TextEditingController();
  double ppnP = 1;

  double subTotalAfterDiscount() {
    final discountP = _discountPercentController.text.isEmpty
        ? 0
        : (stringDecimalToDouble(_discountPercentController.text)) / 100;

    final subtotal = _subtotalController.text.isEmpty
        ? 0
        : stringDecimalToDouble(_subtotalController.text);

    return (1 - discountP) * subtotal.toDouble();
  }

  double ppnValue() {
    return ppnP != 0 ? ppnP / 100 : 0;
  }

  double subTotalAfterPPn() {
    return subTotalAfterDiscount() * ppnValue();
  }

  double totalValue() {
    return subTotalAfterDiscount() + subTotalAfterPPn();
  }

  final _formKey = GlobalKey<FormState>();
  late DataAction _action;
  late Department _department;
  late Customer _customer;
  late TransactionType _transactionType;
  late Currency _currency;
  late Ppn _ppnPercent;

  @override
  void initState() {
    _action = createOrEdit(widget.productReturn);
    super.initState();

    if (_action.isEdit) {
      final productReturn = widget.productReturn;
      _department = productReturn.department;
      _customer = productReturn.customer;
      _transactionType = productReturn.transactionType;
      _currency = productReturn.currency;
      _ppnPercent = productReturn.ppnPercent;
      _descriptionController.text = productReturn.description;
      _subtotalController.text = productReturn.subtotal.format();
      _discountPercentController.text =
          productReturn.discountPercent.toString();
      _discountValueController.text = productReturn.discountValue.toString();
      _ppnValueController.text = productReturn.ppnValue.toString();
      _referenceNoController.text = productReturn.referenceNo;
      _totalController.text = productReturn.total.format();
    }
  }

  void _submit() {
    if (_action.isEdit) {
      context.read<ProductReturnBloc>().add(
            ProductReturnEvent.editFormCustomer(
              productReturnId: widget.productReturn.id,
              currency: _currency,
              customer: _customer,
              department: _department,
              transactionType: _transactionType,
              description: _descriptionController.text,
              subtotal: stringDecimalToDouble(_subtotalController.text),
              discountPercent:
                  stringDecimalToDouble(_discountPercentController.text),
              discountValue:
                  stringDecimalToDouble(_discountValueController.text),
              ppnPercent: _ppnPercent.id,
              ppnValue: stringDecimalToDouble(_ppnValueController.text),
              accountValue: stringDecimalToDouble(_accountValueController.text),
              referenceNo: _referenceNoController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.productReturn;
    return BlocListener<ProductReturnBloc, ProductReturnState>(
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
          formKey: _formKey,
          action: _action,
          entity: entity,
          actions: [
            BlocBuilder<ProductReturnBloc, ProductReturnState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  action: _action,
                  onPressed: _submit,
                  isInProgress: state.maybeWhen(
                    orElse: () => false,
                    loading: () => true,
                  ),
                );
              },
            ),
          ],
          children: [
            RowFields(
              children: [
                Column(
                  children: [
                    FDropDownSearchDepartment(
                      enabled: false,
                      initialValue: widget.productReturn.department,
                      label: 'Department',
                      itemAsString: (department) =>
                          '${department!.id} - ${department.name}',
                      onChanged: (department) {
                        if (department != null) {
                          _department = department;
                        }
                      },
                    ),
                    const Gap(24),
                    FDropDownSearchTransactionType(
                      enabled: false,
                      initialValue: widget.productReturn.transactionType,
                      onChanged: (type) {
                        if (type != null) {
                          _transactionType = type;
                        }
                      },
                    ),
                    const Gap(24),
                    FTextFormField(
                      labelText: 'Subtotal',
                      controller: _subtotalController,
                      enabled: false,
                      onChanged: (subtotal) {
                        _totalController.text = totalValue().format();
                        setState(() {});
                      },
                      inputFormatters: [
                        ThousandsFormatter(),
                      ],
                    ),
                    const Gap(24),
                    FTextFormField(
                      enabled: false,
                      labelText: 'Percent Discount',
                      controller: _discountPercentController,
                      suffixText: '%',
                      maxLength: 3,
                      onChanged: (discount) {
                        _totalController.text = totalValue().format();
                        setState(() {});
                      },
                      validator: requiredValidator.call,
                      inputFormatters: [
                        ThousandsFormatter(),
                      ],
                    ),
                    const Gap(24),
                    FTextFormField(
                      labelText: 'Total',
                      controller: _totalController,
                      enabled: false,
                      onChanged: (discount) {
                        _totalController.text = totalValue().format();
                        setState(() {});
                      },
                      inputFormatters: [
                        ThousandsFormatter(),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    FDropDownSearchCustomer(
                      enabled: false,
                      initialValue: widget.productReturn.customer,
                      itemAsString: (customer) =>
                          '${customer!.id} - ${customer.name}',
                      onChanged: (customer) {
                        if (customer != null) {
                          _customer = customer;
                        }
                      },
                    ),
                    const Gap(24),
                    FDropDownSearchCurrency(
                      enabled: false,
                      initialValue: widget.productReturn.currency,
                      onChanged: (currency) {
                        if (currency != null) {
                          _currency = currency;
                        }
                      },
                    ),
                    const Gap(24),
                    FTextFormField(
                      labelText: 'Reference Number',
                      controller: _referenceNoController,
                      validator: requiredValidator.call,
                    ),
                    const Gap(24),
                    FDropDownSearch<Ppn>(
                      enabled: false,
                      initialValue: widget.productReturn.ppnPercent,
                      labelText: 'PPN Percent',
                      itemAsString: (ppn) => ppn.label,
                      validator: requiredObjectValidator.call,
                      items: const [
                        Ppn.ppn10,
                        Ppn.ppn11,
                      ],
                      onChanged: (ppn) {
                        if (ppn != null) {
                          ppnP = ppn.id;
                          _totalController.text = totalValue().format();
                          _ppnPercent = ppn;
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
