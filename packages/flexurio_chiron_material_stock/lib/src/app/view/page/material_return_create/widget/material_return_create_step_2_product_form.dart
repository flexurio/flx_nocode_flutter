import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/department.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_group.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/transaction_type.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MaterialReturnCreateProductForm extends StatefulWidget {
  const MaterialReturnCreateProductForm({
    required this.onNext,
    required this.onPrevious,
    this.materialReturnType,
    this.materialReturn,
  });

  final void Function() onNext;
  final void Function() onPrevious;
  final MaterialReturn? materialReturn;
  final MaterialReturnType? materialReturnType;

  @override
  State<MaterialReturnCreateProductForm> createState() =>
      _MaterialReturnCreateTypeFormState();
}

class _MaterialReturnCreateTypeFormState
    extends State<MaterialReturnCreateProductForm> {
  final _formKey = GlobalKey<FormState>();
  final _remarkController = TextEditingController();
  final _periodController = TextEditingController();
  var _isExternal = false;

  Department? _department;
  MaterialGroup? _materialGroup;
  TransactionType _transactionType = TransactionType.empty();
  Product? _product;
  ProductionOrder? _productionOrder;
  DateTime? _period;

  @override
  void dispose() {
    _remarkController.dispose();
    _periodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormAction(
      formKey: _formKey,
      actions: [
        Button(
          permission: null,
          action: DataAction.back,
          onPressed: widget.onPrevious,
          isSecondary: true,
        ),
        BlocListener<MaterialReturnBloc, MaterialReturnState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              error: (error) => Toast(context).fail(error),
              success: () {
                Toast(context).dataChanged(
                  DataAction.create,
                  Entity.materialReturn,
                );
              },
            );
          },
          child: Button(
            permission: null,
            action: DataAction.next,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<MaterialReturnBloc>().add(
                      MaterialReturnEvent.createFormProduct(
                        MaterialReturnFormProduct(
                          materialGroup: _materialGroup!,
                          department: _department!,
                          remarks: _remarkController.text,
                          transactionType: _transactionType,
                          product: _product,
                          productionOrder: _productionOrder,
                          type: widget.materialReturnType!,
                        ),
                      ),
                    );
                widget.onNext();
              }
            },
          ),
        ),
      ],
      children: [
        RowFields(
          children: [
            FDropDownSearchMaterialGroup(
              onChanged: (materialGroup) {
                if (materialGroup != null) {
                  _materialGroup = materialGroup;
                  setState(() {});
                }
              },
            ),
            FDropDownSearchTransactionType(
              label: 'type'.tr(),
              onChanged: (transactionType) {
                if (transactionType != null) {
                  _transactionType = transactionType;
                  _isExternal = _transactionType.id == '31';
                  setState(() {});
                }
              },
            ),
          ],
        ),
        const Gap(24),
        if (widget.materialReturnType != MaterialReturnType.adjustment)
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              children: [
                FieldMonthPicker(
                  initialSelectedDate: _period,
                  controller: _periodController,
                  labelText: 'period'.tr(),
                  maxDate: DateTime.now(),
                  validator: requiredObjectValidator.call,
                  onChanged: (value) {
                    _period = value;
                    setState(() {});
                  },
                ),
                Gap(24),
                BlocProvider(
                  key: ValueKey(_period.toString() +
                      _materialGroup.toString() +
                      _isExternal.toString()),
                  create: (context) {
                    final bloc =
                        MaterialIssueQueryBloc(isExternal: _isExternal);
                    if (_period != null && _materialGroup != null) {
                      bloc.add(
                        MaterialIssueQueryEvent.fetch(
                          isProduct: true,
                          startDate: _period?.startOfMonth,
                          endDate: _period?.endOfMonth,
                          materialGroup: _materialGroup,
                          pageOptions: PageOptions.emptyNoLimit()
                            ..copyWith(sortBy: 'Product.name,BatchNo.id'),
                        ),
                      );
                    }
                    return bloc;
                  },
                  child: RowFields(
                    children: [
                      _buildFieldProduct(),
                      _buildFieldProductionOrder(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        FDropDownSearchDepartment(
          onChanged: (department) {
            if (department != null) {
              _department = department;
            }
          },
        ),
        const SizedBox(height: 24),
        FTextFormField(
          controller: _remarkController,
          validator: requiredValidator.call,
          labelText: 'Remark',
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildFieldProduct() {
    return FDropDownSearchMaterialIssueProduct(
      key: ValueKey(_period.toString() + _materialGroup.toString()),
      isRequired: _transactionType.id != '84',
      onChanged: (product) {
        if (product != null) {
          _product = product;
          _productionOrder = null;
          setState(() {});
        }
      },
    );
  }

  Widget _buildFieldProductionOrder() {
    return FDropDownSearchMaterialIssueBatch(
      key: ValueKey(_product?.id),
      productId: _product?.id,
      isRequired: _transactionType.id != '84',
      label: 'batch'.tr(),
      onChanged: (productionOrder) {
        if (productionOrder != null) {
          _productionOrder = productionOrder;
        }
      },
    );
  }
}
