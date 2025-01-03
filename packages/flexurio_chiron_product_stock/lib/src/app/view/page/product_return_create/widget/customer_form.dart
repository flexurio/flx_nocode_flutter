import 'package:flexurio_chiron_finance/src/app/bloc/currency_query/currency_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_query/sales_order_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_type_query/transaction_type_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/currency.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/customer.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/transaction_type.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return/product_return_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class ProductReturnCreateCustomerForm extends StatefulWidget {
  const ProductReturnCreateCustomerForm({
    required this.onNext,
    super.key,
  });

  final void Function() onNext;

  static Widget prepare({
    required void Function() onNext,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CurrencyQueryBloc()..add(const CurrencyQueryEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => SalesOrderQueryBloc(),
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
          create: (context) => DepartmentQueryBloc()
            ..add(
              DepartmentQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => TransactionTypeQueryBloc()
            ..add(
              TransactionTypeQueryEvent.fetch(
                flag: 'Retur Distributor',
                type: 'PRODUCT RETURN',
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: ProductReturnCreateCustomerForm(
        onNext: onNext,
      ),
    );
  }

  @override
  State<ProductReturnCreateCustomerForm> createState() =>
      _ProductReturnCreateCustomerFormState();
}

class _ProductReturnCreateCustomerFormState
    extends State<ProductReturnCreateCustomerForm> {
  final _periodController = TextEditingController();
  final _referenceNoController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _totalController = TextEditingController();
  final _subTotalController = TextEditingController();
  final _percentDiscountController = TextEditingController();

  late SalesOrder _salesOrder;
  DateTime _selectedMonth = DateTime.now();

  final _formKey = GlobalKey<FormState>();
  late Department _department;
  Customer? _customer;
  TransactionType? _transactionType;
  Currency? _currency;
  Ppn? _ppnPercent;

  @override
  Widget build(BuildContext context) {
    return FormAction(
      formKey: _formKey,
      actions: [
        Button(
          permission: null,
          action: DataAction.next,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.read<ProductReturnBloc>().add(
                    ProductReturnEvent.createFormCustomer(
                      customerForm: ProductReturnCustomerForm(
                        salesOrder: _salesOrder,
                        department: _department,
                        customer: _customer,
                        currency: _currency,
                        transactionType: _transactionType,
                        subtotal: 0,
                        referenceNumber: _referenceNoController.text,
                        ppnPercent: _ppnPercent,
                        discountPercent: stringDecimalToDouble(
                            _percentDiscountController.text),
                        total: 0,
                        description: _descriptionController.text,
                      ),
                    ),
                  );
              widget.onNext();
            }
          },
        ),
      ],
      children: [
        Column(children: [
          RowFields(children: [
            BlocBuilder<DepartmentQueryBloc, DepartmentQueryState>(
              builder: (context, state) {
                return FDropDownSearch<Department>(
                  labelText: 'department'.tr(),
                  itemAsString: (department) =>
                      '${department.id} - ${department.name}',
                  validator: requiredObjectValidator.call,
                  items: state.maybeWhen(
                    orElse: () => [],
                    loaded: (pageOptions) {
                      return pageOptions.data
                          .where((e) => ['MD', 'MO', 'IC'].contains(e.id))
                          .toSet()
                          .toList();
                    },
                  ),
                  onChanged: (department) {
                    if (department != null) {
                      _department = department;
                    }
                  },
                );
              },
            ),
            FDropDownSearchCustomer(
              itemAsString: (customer) => '${customer!.id} - ${customer.name}',
              onChanged: (customer) {
                if (customer != null) {
                  _customer = customer;
                }
              },
            ),
          ]),
          const Gap(24),
          RowFields(children: [
            FieldMonthPicker(
              validator: requiredObjectValidator.call,
              maxDate: DateTime.now(),
              labelText: 'period'.tr(),
              controller: _periodController,
              onChanged: (month) {
                _selectedMonth = month;
                _periodController.text = DateFormat('MMMM yyyy').format(
                  _selectedMonth,
                );
                var _periodStart =
                    DateTime(_selectedMonth.year, _selectedMonth.month);
                var _periodEnd =
                    DateTime(_selectedMonth.year, _selectedMonth.month + 1, 0);
                if (_customer != null) {
                  context.read<SalesOrderQueryBloc>().add(
                        SalesOrderQueryEvent.fetch(
                          pageOptions: PageOptions.emptyNoLimit(),
                          periodStart: _periodStart,
                          periodEnd: _periodEnd,
                          customer: _customer,
                        ),
                      );
                }
                setState(() {});
              },
            ),
            BlocBuilder<SalesOrderQueryBloc, SalesOrderQueryState>(
              builder: (context, state) {
                return FDropDownSearch<SalesOrder>(
                  labelText: 'delivery_order'.tr(),
                  itemAsString: (sales) => sales.deliveryOrderId,
                  status: state.maybeWhen(
                    orElse: () => Status.error,
                    loading: (_) => Status.progress,
                    loaded: (_, __) => Status.loaded,
                  ),
                  onChanged: (sales) {
                    if (sales != null) {
                      _salesOrder = sales;
                      _currency = sales.productRequest!.currency;
                      _subTotalController.text = sales.subtotal.format();
                      _totalController.text = sales.total.format();
                      _percentDiscountController.text =
                          sales.discountPercent.toString();
                      _ppnPercent = Ppn.fromNum(sales.ppnPercent);
                      setState(() {});
                    }
                  },
                  items: state.maybeWhen(
                    orElse: () => [],
                    loaded: (salesOrder, _) => salesOrder.data,
                  ),
                  validator: requiredObjectValidator.call,
                );
              },
            ),
          ]),
          const Gap(24),
          RowFields(children: [
            FDropDownSearchTransactionType(
              initialValue: _transactionType,
              onChanged: (type) {
                if (type != null) {
                  _transactionType = type;
                }
              },
            ),
            FDropDownSearchCurrency(
              enabled: false,
              isRequired: false,
              label: 'currency'.tr(),
              initialValue: _currency,
              onChanged: (currency) {
                if (currency != null) {
                  _currency = currency;
                }
              },
            ),
          ]),
          const Gap(24),
          RowFields(children: [
            FTextFormField(
              enabled: false,
              labelText: 'percent_discount'.tr(),
              controller: _percentDiscountController,
              suffixText: '%',
              maxLength: 3,
              onChanged: (discount) {
                _percentDiscountController.text = discount;
                setState(() {});
              },
              inputFormatters: [
                ThousandsFormatter(),
              ],
            ),
            FDropDownSearch<Ppn>(
              enabled: false,
              initialValue: _ppnPercent,
              labelText: 'percent_ppn'.tr(),
              itemAsString: (ppn) => ppn.label,
              items: const [
                Ppn.none,
                Ppn.ppn10,
                Ppn.ppn11,
              ],
              onChanged: (ppn) {
                if (ppn != null) {
                  _ppnPercent = ppn;
                  setState(() {});
                }
              },
            ),
          ]),
          const Gap(24),
          RowFields(
            children: [
              FTextFormField(
                labelText: 'reference_no'.tr(),
                controller: _referenceNoController,
                validator: requiredValidator.call,
              ),
              SizedBox.shrink(),
            ],
          ),
        ]),
      ],
    );
  }
}
