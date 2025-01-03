import 'dropdown_only_selling.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/currency.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/customer.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request_query/product_request_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request/product_request_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class ProductRequestCreatePurchaseOrderForm extends StatefulWidget {
  const ProductRequestCreatePurchaseOrderForm._({
    required this.onNext,
    this.productRequest,
    this.customer,
    this.period,
    this.currency,
  });

  final ProductRequestFormPurchaseOrder? productRequest;
  final Customer? customer;
  final Currency? currency;
  final String? period;
  final void Function() onNext;

  static Widget prepare({
    required void Function() onNext,
    ProductRequestFormPurchaseOrder? productRequest,
    Customer? customer,
    String? period,
    Currency? currency,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CurrencyQueryBloc()
            ..add(
              CurrencyQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(create: (context) => ProductRequestQueryBloc()),
        BlocProvider(
          create: (context) => CustomerQueryBloc()
            ..add(
              CustomerQueryEvent.fetch(pageOptions: PageOptions.emptyNoLimit()),
            ),
        ),
        BlocProvider(
          create: (context) => DepartmentQueryBloc()
            ..add(
              DepartmentQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
                departmentType: 'MARKETING',
              ),
            ),
        ),
        BlocProvider(
          create: (context) => SalesDiscountQueryBloc()
            ..add(
              SalesDiscountQueryEvent.fetch(
                customer: customer,
                period: period,
              ),
            ),
        ),
        BlocProvider(create: (context) => RateQueryBloc()),
        BlocProvider(create: (context) => CustomerAddressQueryBloc()),
        BlocProvider(
          create: (context) => TransactionTypeQueryBloc()
            ..add(
              TransactionTypeQueryEvent.fetch(
                name: 'PESANAN',
                flag: 'Discount',
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(create: (context) => CustomerDiscountQueryBloc())
      ],
      child: ProductRequestCreatePurchaseOrderForm._(
        productRequest: productRequest,
        onNext: onNext,
        customer: customer,
        period: period,
        currency: currency,
      ),
    );
  }

  @override
  State<ProductRequestCreatePurchaseOrderForm> createState() =>
      _ProductRequestCreatePurchaseOrderFormState();
}

class _ProductRequestCreatePurchaseOrderFormState
    extends State<ProductRequestCreatePurchaseOrderForm> {
  final _formKey = GlobalKey<FormState>();
  final _purchaseOrderDistributorController = TextEditingController();
  final _termOfPaymentController = TextEditingController();
  final _priceDiscountController = TextEditingController();
  final _bankFeeController = TextEditingController();
  final _specialDiscountController = TextEditingController();
  final _rateController = TextEditingController();
  final _noteController = TextEditingController();
  final _ppnController = TextEditingController();
  final _pphController = TextEditingController();
  final _purchaseOrderDateController = TextEditingController();
  final _receiveDateController = TextEditingController();

  Customer? _customerRequest;
  Customer? _deliveryAddress;
  TransactionType? _transactionType;
  Currency? _currency;
  TransactionType? _orderType;
  Department? _department;
  ProductRequestProductType? _productType;
  ProductRequestFormPurchaseOrder? _productRequest;
  DateTime? _purchaseOrderDate;
  DateTime? _receiveDate;

  late DataAction _action;

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.productRequest);
    if (_action.isEdit) {
      _customerRequest = widget.productRequest!.customer;
      _deliveryAddress = widget.productRequest!.address;
      _transactionType = widget.productRequest!.transactionType;
      _productRequest = widget.productRequest;
      _productType =
          ProductRequestProductType.productRequestProductTypeFromString(
        widget.productRequest!.productType!,
      );
      _currency = widget.productRequest!.currency;
      _orderType = widget.productRequest!.orderType;
      _purchaseOrderDistributorController.text =
          widget.productRequest!.purchaseOrderDistributor!;
      _termOfPaymentController.text =
          widget.productRequest!.termOfPayment.toString();
      _rateController.text = widget.productRequest!.rate.toString();
      _noteController.text = widget.productRequest!.note!;
      _department = widget.productRequest!.department;
      _specialDiscountController.text =
          widget.productRequest!.specialDiscountPercent.toString();
      _pphController.text =
          '${widget.productRequest!.pph22Percent}%'.replaceAll('.0', '');
      _ppnController.text =
          '${widget.productRequest!.ppnPercent}%'.replaceAll('.0', '');
      _bankFeeController.text = widget.productRequest!.bankFee.toString();

      if (_productType == ProductRequestProductType.antiten) {
        if (_productRequest!.customer!.id == 'ENSEVAL' ||
            _productRequest!.customer!.id == 'ENSEVAL 1' ||
            _productRequest!.customer!.id == 'ENSEVAL 2') {
          _priceDiscountController.text = '35';
        } else if (_productRequest!.customer!.id == 'MBSJ') {
          _priceDiscountController.text = '7.5';
        } else {
          _priceDiscountController.text = '9';
        }
      } else if (_productType == ProductRequestProductType.alkes) {
        if (_productRequest!.customer!.id == 'MBSJ') {
          _priceDiscountController.text = '7.5';
        } else {
          _priceDiscountController.text =
              _productRequest!.customer!.discount.toString();
        }
      } else {
        _priceDiscountController.text =
            _productRequest!.customer!.discount.toString();
      }
    }
  }

  @override
  void dispose() {
    _purchaseOrderDistributorController.dispose();
    _termOfPaymentController.dispose();
    _priceDiscountController.dispose();
    _bankFeeController.dispose();
    _specialDiscountController.dispose();
    _rateController.dispose();
    _noteController.dispose();
    _ppnController.dispose();
    _pphController.dispose();
    _purchaseOrderDateController.dispose();
    _receiveDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SalesDiscountQueryBloc, SalesDiscountQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) {},
          loaded: (salesDiscount) {
            if (salesDiscount.isNotEmpty) {
              _specialDiscountController.text =
                  salesDiscount[0].discount.toString();
            } else {
              _specialDiscountController.text = '0';
            }
          },
        );
      },
      child: FormAction(
        formKey: _formKey,
        actions: [
          _buildButtonNext(),
        ],
        children: [
          RowFields(
            children: [
              _buildFieldPurchaseOrderDistributor(),
              _buildFieldDepartment(),
            ],
          ),
          const Gap(20),
          RowFields(
            children: [
              _buildFieldCustomer(),
              _buildFieldDeliveryAddress(),
            ],
          ),
          const Gap(20),
          RowFields(
            children: [
              _buildFieldPurchaseOrderDate(),
              _buildFieldReceiveDate(),
            ],
          ),
          const Gap(20),
          RowFields(
            children: [
              FDropDownSearch<ProductRequestProductType>(
                key: Key(_customerRequest != null ? _customerRequest!.id : '-'),
                validator: requiredObjectValidator.call,
                labelText: 'Product Type',
                items: const [
                  ProductRequestProductType.non,
                  ProductRequestProductType.bpjs,
                  ProductRequestProductType.alkes,
                  ProductRequestProductType.antiten,
                  ProductRequestProductType.tollIn,
                ],
                onChanged: (value) {
                  _productType = value;

                  if (_productType == ProductRequestProductType.antiten) {
                    if (_customerRequest!.id == 'MBSJ') {
                      _priceDiscountController.text = '7.5';
                      _termOfPaymentController.text = '45';
                    } else if (_customerRequest!.id == 'MPI' ||
                        _customerRequest!.id == 'PVJ') {
                      _priceDiscountController.text = '9';
                      _termOfPaymentController.text = '7';
                    } else {
                      _priceDiscountController.text =
                          _customerRequest!.discount.toString();
                      _termOfPaymentController.text =
                          _customerRequest!.termOfPayment!.toString();
                    }
                    setState(() {
                      _pphController.text = '0.30%';
                    });
                  } else if (_productType == ProductRequestProductType.alkes) {
                    if (_customerRequest!.id == 'MBSJ') {
                      _priceDiscountController.text = '7.5';
                      _termOfPaymentController.text = '45';
                    } else if (_customerRequest!.id == 'MPI' ||
                        _customerRequest!.id == 'PVJ') {
                      _priceDiscountController.text = '9';
                      _termOfPaymentController.text = '7';
                    } else {
                      _priceDiscountController.text =
                          _customerRequest!.discount.toString();
                      _termOfPaymentController.text =
                          _customerRequest!.termOfPayment!.toString();
                    }

                    setState(() {
                      _pphController.text = '0%';
                    });
                  } else if (_productType == ProductRequestProductType.bpjs ||
                      _productType == ProductRequestProductType.tollIn) {
                    _priceDiscountController.text =
                        _customerRequest!.discount.toString();
                    _termOfPaymentController.text = '0';
                    setState(() {
                      _pphController.text = '0.30%';
                    });
                  } else {
                    _priceDiscountController.text =
                        _customerRequest!.discount.toString();
                    _termOfPaymentController.text =
                        _customerRequest!.termOfPayment!.toString();
                    setState(() {
                      _pphController.text = '0.30%';
                    });
                  }
                },
                itemAsString: (productType) => productType.label,
                initialValue: _productType,
              ),
              FTextFormField(
                controller: _priceDiscountController,
                labelText: 'Price Discount',
                enabled: false,
                inputFormatters: [
                  ThousandsFormatter(),
                ],
              ),
            ],
          ),
          const Gap(20),
          RowFields(
            children: [
              DropDownOnlySelling.prepare(
                transactionType: _transactionType,
                onChanged: (transactionType) {
                  if (transactionType != null) {
                    _transactionType = transactionType;
                  }
                },
              ),
              BlocBuilder<TransactionTypeQueryBloc, TransactionTypeQueryState>(
                builder: (context, state) {
                  state.maybeWhen(
                    loaded: (transactionTypes) {
                      if (_action != DataAction.edit) {
                        final data = transactionTypes.data
                            .where(
                              (i) => i.name.contains('NETTO'),
                            )
                            .toList();
                        if (data.isNotEmpty)
                          _orderType = data.first;
                        else
                          _orderType = null;
                      }
                    },
                    orElse: () => [],
                  );
                  return FDropDownSearch<TransactionType>(
                    initialValue: _orderType,
                    labelText: 'Order Type',
                    items: state.maybeWhen(
                      loaded: (address) => address.data,
                      orElse: () => [],
                    ),
                    onChanged: (orderType) {
                      if (orderType != null) {
                        _orderType = orderType;
                        if (orderType.name.contains('NETTO')) {
                          context.read<CustomerDiscountQueryBloc>().add(
                                CustomerDiscountQueryEvent.fetch(
                                  customer: _customerRequest,
                                  pageOptions: PageOptions.emptyNoLimit(),
                                ),
                              );
                        } else {
                          _specialDiscountController.text = '20';
                          setState(() {
                            _pphController.text = '0%';
                          });
                        }
                      }
                    },
                    itemAsString: (orderType) =>
                        '${orderType.id} - ${orderType.name}',
                    validator: requiredObjectValidator.call,
                    status: state.maybeWhen(
                      error: (_) => Status.error,
                      loading: (_) => Status.progress,
                      orElse: () => Status.loaded,
                    ),
                  );
                },
              ),
            ],
          ),
          const Gap(20),
          RowFields(
            children: [
              FTextFormField(
                controller: _termOfPaymentController,
                validator: requiredValidator.call,
                labelText: 'Term of Payment',
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              BlocBuilder<CustomerDiscountQueryBloc,
                  CustomerDiscountQueryState>(
                builder: (context, state) {
                  state.maybeWhen(
                    loaded: (discount) {
                      final data = discount.data
                          .where((i) => i.endDate == null)
                          .toList();
                      if (data.isNotEmpty)
                        _specialDiscountController.text =
                            data.first.discount.toString();
                    },
                    orElse: () => [],
                  );
                  return FTextFormField(
                    controller: _specialDiscountController,
                    labelText: 'Special Discount',
                    enabled: false,
                    inputFormatters: [
                      ThousandsFormatter(),
                    ],
                  );
                },
              ),
            ],
          ),
          const Gap(20),
          RowFields(
            children: [
              FDropDownSearchCurrency(
                isRequired: false,
                initialValue: _currency,
                label: 'currency'.tr(),
                onChanged: (currency) {
                  if (currency != null) {
                    _currency = currency;
                    context.read<RateQueryBloc>().add(
                          RateQueryEvent.fetch(currency: currency),
                        );
                  }
                },
              ),
              BlocBuilder<RateQueryBloc, RateQueryState>(
                builder: (context, state) {
                  state.maybeWhen(
                    loaded: (rate) {
                      if (rate.data.isNotEmpty) {
                        _rateController.text = rate.data[0].rate.toString();
                      } else {
                        _rateController.text = '0';
                      }
                    },
                    orElse: () =>
                        const Center(child: CupertinoActivityIndicator()),
                  );
                  return FTextFormField(
                    controller: _rateController,
                    labelText: 'Rate',
                    enabled: false,
                  );
                },
              ),
            ],
          ),
          const Gap(20),
          RowFields(
            children: [
              SelectChipField<String>(
                label: 'PPN',
                getLabel: (ppn) => ppn,
                controller: _ppnController,
                validator: requiredValidator.call,
                options: const [
                  '0%',
                  '11%',
                  '12%',
                ],
                onChanged: (value) {
                  _ppnController.text = value;
                  setState(() {});
                },
              ),
              SelectChipField<String>(
                key: Key(
                  '${_productType?.label ?? '-'}${_specialDiscountController.text}',
                ),
                label: 'PPH',
                getLabel: (pph) => pph,
                controller: _pphController,
                validator: requiredValidator.call,
                options: const [
                  '0%',
                  '0.30%',
                ],
                onChanged: (value) {
                  if (value != '') {
                    _pphController.text = value;
                    setState(() {});
                  }
                },
              ),
            ],
          ),
          const Gap(20),
          RowFields(
            children: [
              FTextFormField(
                controller: _noteController,
                labelText: 'Note',
              ),
              FTextFormField(
                controller: _bankFeeController,
                labelText: 'Bank Fee',
                inputFormatters: [
                  ThousandsFormatter(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _edit() {
    if (_formKey.currentState!.validate()) {
      context.read<ProductRequestBloc>().add(
            ProductRequestEvent.editFormPurchaseOrder(
              ProductRequest(
                purchaseOrderDistributorDate:
                    widget.productRequest!.purchaseOrderDate,
                purchaseOrderDistributorDateReceive:
                    widget.productRequest!.receiveDate,
                createdById: 0,
                createdAt: DateTime.now(),
                updatedById: 0,
                updatedAt: DateTime.now(),
                subtotal: 0,
                subtotalAfterDiscount: 0,
                total: 0,
                exchangeValue: 0,
                confirmBy: 0,
                confirmAt: DateTime.now(),
                id: widget.productRequest!.id!,
                rate: stringDecimalToDouble(_rateController.text),
                termOfPayment: stringToInt(_termOfPaymentController.text),
                typeProduct: _productType!.label,
                purchaseOrderDistributor:
                    _purchaseOrderDistributorController.text,
                discountPercent: stringDecimalToDouble(
                  _specialDiscountController.text,
                ),
                discountValue: 0,
                ppnPercent: stringDecimalToDouble(
                  _ppnController.text.replaceAll('%', ''),
                ),
                ppnValue: 0,
                status: widget.productRequest!.status!,
                pph22Percent: stringDecimalToDouble(
                  _pphController.text.replaceAll('%', ''),
                ),
                pph22Value: 0,
                description: _noteController.text,
                bankFee: stringDecimalToDouble(_bankFeeController.text),
                transactionType: _transactionType!,
                currency: _currency!,
                customer: _customerRequest!,
                deliveryAddress: _deliveryAddress!,
                orderType: _orderType!,
                department: _department!,
              ),
              widget.productRequest!,
            ),
          );
    }
  }

  void _next() {
    if (_formKey.currentState!.validate()) {
      context.read<ProductRequestBloc>().add(
            ProductRequestEvent.createFormPurchaseOrderToLocal(
              ProductRequestFormPurchaseOrder(
                rate: stringDecimalToDouble(_rateController.text),
                termOfPayment: stringToInt(_termOfPaymentController.text),
                productType: _productType!.label,
                purchaseOrderDistributor:
                    _purchaseOrderDistributorController.text,
                specialDiscountPercent: stringDecimalToDouble(
                  _specialDiscountController.text,
                ),
                ppnPercent: stringDecimalToDouble(
                  _ppnController.text.replaceAll('%', ''),
                ),
                pph22Percent: stringDecimalToDouble(
                  _pphController.text.replaceAll('%', ''),
                ),
                purchaseOrderDate: _purchaseOrderDate!,
                receiveDate: _receiveDate!,
                department: _department,
                customer: _customerRequest,
                transactionType: _transactionType,
                orderType: _orderType,
                currency: _currency,
                note: _noteController.text,
                address: _deliveryAddress,
                priceDiscountPercent:
                    stringDecimalToDouble(_priceDiscountController.text),
                bankFee: stringDecimalToDouble(_bankFeeController.text),
              ),
            ),
          );
      widget.onNext();
    }
  }

  Widget _buildButtonNext() {
    late Widget submitButton;
    if (_action.isEdit) {
      submitButton = Button(
        permission: null,
        action: DataAction.edit,
        onPressed: _edit,
      );
    } else {
      submitButton =
          BlocListener<ProductRequestQueryBloc, ProductRequestQueryState>(
        listener: (context, state) {
          state.maybeWhen(
            loaded: (data) {
              if (data.data.isNotEmpty) {
                Toast(context)
                    .fail('Purchase Order Distributor already exist.');
              } else {
                _next();
              }
            },
            orElse: () => false,
          );
        },
        child: BlocBuilder<ProductRequestQueryBloc, ProductRequestQueryState>(
          builder: (context, state) {
            final isProgress = state.maybeWhen(
              orElse: () => false,
              loading: (_) => true,
            );

            return Button(
              permission: null,
              action: DataAction.next,
              isInProgress: isProgress,
              onPressed: () {
                context.read<ProductRequestQueryBloc>().add(
                      ProductRequestQueryEvent.fetch(
                        purchaseOrderDistributorId:
                            _purchaseOrderDistributorController.text,
                      ),
                    );
              },
            );
          },
        ),
      );
    }
    return submitButton;
  }

  Widget _buildFieldPurchaseOrderDistributor() {
    return FTextFormField(
      controller: _purchaseOrderDistributorController,
      validator: requiredValidator.call,
      labelText: 'Purchase Order Distributor',
    );
  }

  Widget _buildFieldDepartment() {
    return BlocBuilder<DepartmentQueryBloc, DepartmentQueryState>(
      builder: (context, state) {
        return FDropDownSearch<Department>(
          initialValue: _department,
          labelText: 'Department',
          items: state.maybeWhen(
            loaded: (department) => department.data,
            orElse: () => [],
          ),
          onChanged: (value) {
            if (value != null) {
              _department = value;
            }
          },
          itemAsString: (department) => department.name,
          validator: requiredObjectValidator.call,
        );
      },
    );
  }

  Widget _buildFieldCustomer() {
    return FDropDownSearchCustomer(
      isRequired: false,
      itemAsString: (customer) => customer!.id,
      initialValue: _customerRequest,
      onChanged: (customer) {
        if (customer != null) {
          _customerRequest = customer;
          context.read<SalesDiscountQueryBloc>().add(
                SalesDiscountQueryEvent.fetch(
                  customer: customer,
                  period: DateTime.now().yyyyMMdd.replaceAll('-', ''),
                ),
              );
          _priceDiscountController.text = customer.discount.toString();
          context.read<CustomerAddressQueryBloc>().add(
                CustomerAddressQueryEvent.fetchByParent(
                  pageOptions: PageOptions.emptyNoLimit(),
                  customer: customer,
                ),
              );
          context.read<CustomerDiscountQueryBloc>().add(
                CustomerDiscountQueryEvent.fetch(
                  customer: customer,
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              );
          _termOfPaymentController.text = '';
          setState(() {
            _productType = null;
          });
        }
      },
    );
  }

  Widget _buildFieldDeliveryAddress() {
    return BlocBuilder<CustomerAddressQueryBloc, CustomerAddressQueryState>(
      builder: (context, state) {
        return FDropDownSearch<Customer>(
          initialValue: _deliveryAddress,
          labelText: 'Delivery Address',
          items: state.maybeWhen(
            loaded: (address) => address.data,
            orElse: () => [],
          ),
          onChanged: (value) {
            if (value != null) {
              _deliveryAddress = value;
            }
          },
          itemAsString: (address) => '${address.name} - ${address.id}',
          validator: requiredObjectValidator.call,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: (_) => Status.progress,
            orElse: () => Status.loaded,
          ),
        );
      },
    );
  }

  Widget _buildFieldPurchaseOrderDate() {
    return FieldDatePicker(
      labelText: 'purchase_order_date'.tr(),
      controller: _purchaseOrderDateController,
      maxDate: DateTime.now(),
      validator: requiredObjectValidator,
      onChanged: (value) => _purchaseOrderDate = value,
    );
  }

  Widget _buildFieldReceiveDate() {
    return FieldDatePicker(
      labelText: 'receive_date'.tr(),
      controller: _receiveDateController,
      maxDate: DateTime.now(),
      validator: requiredObjectValidator,
      onChanged: (value) => _receiveDate = value,
    );
  }
}
