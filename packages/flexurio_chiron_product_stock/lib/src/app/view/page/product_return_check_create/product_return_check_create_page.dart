import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_type_query/transaction_type_query_bloc.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class ProductReturnCheckCreatePage extends StatefulWidget {
  const ProductReturnCheckCreatePage({
    required this.productReturn,
    required this.productReturnDetail,
    required this.productReturnDetailQueryBloc,
    super.key,
  });

  final ProductReturn productReturn;
  final ProductReturnDetail productReturnDetail;
  final ProductReturnDetailQueryBloc productReturnDetailQueryBloc;

  static Widget prepare({
    required ProductReturn productReturn,
    required ProductReturnDetail productReturnDetail,
    required ProductReturnDetailQueryBloc productReturnDetailQueryBloc,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => productReturnDetailQueryBloc
            ..add(ProductReturnDetailQueryEvent.fetchById(
              productReturnId: productReturn.id,
              idDetail: productReturnDetail.id,
            )),
        ),
        BlocProvider(
          create: (context) => ProductReturnCheckQueryBloc()
            ..add(ProductReturnCheckQueryEvent.fetch(
                productReturnId: productReturn.id,
                productId: productReturnDetail.product.id,
                batchId: productReturnDetail.batchNo.id)),
        ),
        BlocProvider(
          create: (context) => TransactionTypeQueryBloc()
            ..add(
              TransactionTypeQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
                id: [
                  'R18',
                  'R14',
                  'R20',
                  'R21',
                ],
              ),
            ),
        ),
        BlocProvider(
          create: (context) => ProductReturnCheckBloc(),
        ),
      ],
      child: ProductReturnCheckCreatePage(
        productReturn: productReturn,
        productReturnDetail: productReturnDetail,
        productReturnDetailQueryBloc: productReturnDetailQueryBloc,
      ),
    );
  }

  @override
  State<ProductReturnCheckCreatePage> createState() =>
      _ProductReturnCheckCreatePageState();
}

class _ProductReturnCheckCreatePageState
    extends State<ProductReturnCheckCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _productReturnIdController = TextEditingController();
  final _quantityController = TextEditingController();
  final _batchNoController = TextEditingController();
  final _unitIdController = TextEditingController();
  final _productNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  ProductReturnCheckStatus _statusController = ProductReturnCheckStatus.empty;
  final _batchNumberController = TextEditingController();
  final _qtyRemainingController = TextEditingController();
  final _productList = <ProductReturnCheck>[];

  @override
  void initState() {
    _productReturnIdController.text = widget.productReturn.id;
    _batchNoController.text = widget.productReturnDetail.batchNo.id;
    _unitIdController.text = widget.productReturnDetail.unit.id;
    _productNameController.text = widget.productReturnDetail.product.name;
    _batchNumberController.text = widget.productReturnDetail.batchNo.id;
    _qtyRemainingController.text =
        widget.productReturnDetail.quantityRemaining.toString();
    super.initState();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      int sumQuantity = _productList.fold(
          0, (previousValue, element) => previousValue + element.quantity);

      if (sumQuantity == int.parse(_qtyRemainingController.text)) {
        context.read<ProductReturnCheckBloc>().add(
              ProductReturnCheckEvent.create(productCheckList: _productList),
            );
      } else {
        Toast(context)
            .fail('Sum of quantity must be equal to quantity remaining');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.productReturnCheck;
    return BlocListener<ProductReturnCheckBloc, ProductReturnCheckState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => Toast(context).fail(error!),
          success: () {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          size: SingleFormPanelSize.large,
          formKey: _formKey,
          action: action,
          entity: entity,
          actions: [
            BlocBuilder<ProductReturnCheckBloc, ProductReturnCheckState>(
              builder: (context, state) {
                return Visibility(
                  visible: _productList.isNotEmpty,
                  child: Button(
                    permission: null,
                    action: action,
                    onPressed: _submit,
                    isInProgress: state.maybeWhen(
                      orElse: () => false,
                      loading: () => true,
                    ),
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
                    FTextFormField(
                      labelText: 'product_return'.tr(),
                      controller: _productReturnIdController,
                      enabled: false,
                    ),
                    const Gap(24),
                    FTextFormField(
                      controller: _batchNoController,
                      labelText: 'batch_no'.tr(),
                      enabled: false,
                    ),
                    const Gap(24),
                    BlocBuilder<ProductReturnDetailQueryBloc,
                        ProductReturnDetailQueryState>(
                      bloc: widget.productReturnDetailQueryBloc,
                      builder: (context, state) {
                        _qtyRemainingController.text = state.maybeWhen(
                          orElse: () => '0',
                          loaded: (data) =>
                              data.data[0].quantityRemaining.toString(),
                        );
                        return FTextFormField(
                          labelText: 'quantity_remaining'.tr(),
                          controller: _qtyRemainingController,
                          enabled: false,
                          inputFormatters: [
                            ThousandsFormatter(),
                          ],
                        );
                      },
                    ),
                    const Gap(24),
                    BlocBuilder<TransactionTypeQueryBloc,
                        TransactionTypeQueryState>(
                      builder: (context, state) {
                        return FDropDownSearch<ProductReturnCheckStatus>(
                          labelText: 'status'.tr(),
                          itemAsString: (status) => status.id,
                          items: state.maybeWhen(
                            orElse: () => [],
                            loaded: (transactionTypes) => [
                              ProductReturnCheckStatus.shouldNotReturn,
                              ProductReturnCheckStatus.qcCheck,
                              ProductReturnCheckStatus.releaseToClinic,
                              ProductReturnCheckStatus.releaseToLab,
                            ],
                          ),
                          validator: requiredObjectValidator.call,
                          onChanged: (status) {
                            _statusController = status!;
                          },
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    FTextFormField(
                      labelText: 'product'.tr(),
                      controller: _productNameController,
                      enabled: false,
                    ),
                    const Gap(24),
                    FTextFormField(
                      labelText: 'unit'.tr(),
                      controller: _unitIdController,
                      enabled: false,
                    ),
                    const Gap(24),
                    FTextFormField(
                      labelText: 'quantity'.tr(),
                      controller: _quantityController,
                      validator: requiredValidator.call,
                      inputFormatters: [
                        ThousandsFormatter(),
                      ],
                    ),
                    const Gap(24),
                    FTextFormField(
                      labelText: 'description'.tr(),
                      controller: _descriptionController,
                      validator: requiredValidator.call,
                    ),
                  ],
                ),
              ],
            ),
            const Gap(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  permission: null,
                  action: DataAction.add,
                  onPressed: () {
                    int statusCheck = -1;
                    if (_descriptionController.text.isNotEmpty &&
                        _quantityController.text.isNotEmpty &&
                        _statusController != ProductReturnCheckStatus.empty &&
                        _quantityController.text != '0') {
                      if (_productList.isNotEmpty) {
                        statusCheck = _productList
                            .indexWhere((e) => e.status == _statusController);
                      }
                      if (statusCheck == -1) {
                        int sumQuantity = _productList.fold(
                            0,
                            (previousValue, element) =>
                                previousValue + element.quantity);
                        sumQuantity += int.parse(_quantityController.text);
                        if (int.parse(_qtyRemainingController.text) <
                            sumQuantity) {
                          return Toast(context).fail(
                              'Quantity cannot exceed Quantity remaining');
                        } else {
                          _productList.add(
                            ProductReturnCheck(
                              status: _statusController,
                              id: 0,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime(0),
                              productReturnId: ProductReturn.empty().copyWith(
                                id: widget.productReturnDetail.productReturn.id,
                              ),
                              productId: Product.empty().copyWith(
                                id: widget.productReturnDetail.product.id,
                              ),
                              batch: ProductionOrder.empty().copyWith(
                                id: widget.productReturnDetail.batchNo.id,
                              ),
                              unitId: MaterialUnit.empty().copyWith(
                                id: widget.productReturnDetail.unit.id,
                              ),
                              quantity: stringToInt(_quantityController.text),
                              description: _descriptionController.text,
                              qtyWarehouseReturn: 0,
                              qtyWarehouseRemaining: 0,
                              qtyOutReturn: 0,
                              qtyOutRemaining: 0,
                              qualityCheckById: 0,
                              qualityCheckDate: DateTime(0),
                            ),
                          );
                          setState(() {});
                        }
                      } else {
                        return Toast(context).fail(
                            'Status that has been used cannot be repeated');
                      }
                    } else {
                      return Toast(context).fail('Please fill out all fields');
                    }
                  },
                ),
              ],
            ),
            const Gap(24),
            YuhuTable<ProductReturnCheck>(
              width: 2100,
              data: _productList,
              columns: [
                TableColumn(
                  width: 150,
                  title: 'product_return'.tr(),
                  builder: (productReturnCheck, _) {
                    return Text(productReturnCheck.productReturnId.id);
                  },
                ),
                TableColumn(
                  width: 150,
                  title: 'status'.tr(),
                  builder: (productReturnCheck, _) {
                    return ChipType(productReturnCheck.status);
                  },
                ),
                TableColumn(
                  width: 150,
                  title: 'product'.tr(),
                  builder: (productReturnCheck, _) {
                    return Text(_productNameController.text);
                  },
                ),
                TableColumn(
                  width: 150,
                  title: 'batch_no'.tr(),
                  builder: (productReturnCheck, _) {
                    return Text(productReturnCheck.batch.id);
                  },
                ),
                TableColumn(
                  width: 80,
                  title: 'quantity'.tr(),
                  builder: (productReturnCheck, _) {
                    return Text(productReturnCheck.quantity.toString());
                  },
                ),
                TableColumn(
                  width: 200,
                  title: 'quantity_warehouse_return'.tr(),
                  builder: (productReturnCheck, _) {
                    return Text(
                      productReturnCheck.qtyWarehouseReturn.toString(),
                    );
                  },
                ),
                TableColumn(
                  width: 200,
                  title: 'quantity_warehouse_remaining'.tr(),
                  builder: (productReturnCheck, _) {
                    return Text(
                      productReturnCheck.qtyWarehouseRemaining.toString(),
                    );
                  },
                ),
                TableColumn(
                  width: 170,
                  title: 'quantity_out_return'.tr(),
                  builder: (productReturnCheck, _) {
                    return Text(productReturnCheck.qtyOutReturn.toString());
                  },
                ),
                TableColumn(
                  width: 200,
                  title: 'quantity_out_remaining'.tr(),
                  builder: (productReturnCheck, _) {
                    return Text(productReturnCheck.qtyOutRemaining.toString());
                  },
                ),
                TableColumn(
                  width: 90,
                  title: 'Unit',
                  builder: (productReturnCheck, _) {
                    return Text(productReturnCheck.unitId.id);
                  },
                ),
                TableColumn(
                  width: 100,
                  title: 'description'.tr(),
                  builder: (productReturnCheck, _) {
                    return Text(productReturnCheck.description);
                  },
                ),
                TableColumn(
                  width: 80,
                  title: 'actions'.tr(),
                  builder: (productRequestDetail, index) {
                    return Row(
                      children: [
                        ProductReturnCheckFromLocalDeleteButton(
                          product: productRequestDetail,
                          onDelete: () {
                            final index =
                                _productList.indexOf(productRequestDetail);
                            if (index != -1) {
                              _productList.removeAt(index);
                            }
                            setState(() {
                              _productList;
                            });
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
