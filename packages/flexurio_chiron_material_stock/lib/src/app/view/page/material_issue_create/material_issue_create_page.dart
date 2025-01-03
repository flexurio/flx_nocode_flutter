import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_type_query/transaction_type_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/department.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_group.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/production_order.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/transaction_type.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:appointment/src/app/resource/user_repository.dart';

class MaterialIssueCreatePage extends StatefulWidget {
  const MaterialIssueCreatePage({
    required this.createAdditional,
    this.materialIssue,
    super.key,
  });

  final bool createAdditional;
  final MaterialIssue? materialIssue;

  static Route<bool?> route({
    required bool createAdditional,
    required bool isExternal,
    MaterialIssue? materialIssue,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MaterialIssueBloc(isExternal: isExternal),
          ),
          if (createAdditional == true)
            BlocProvider(
              create: (context) {
                return TransactionTypeQueryBloc()
                  ..add(
                    TransactionTypeQueryEvent.fetch(
                      pageOptions: PageOptions.emptyNoLimit(),
                      type: 'MATERIAL ISSUE',
                      flag: 'Menu',
                      value: UserRepositoryApp.instance.department!.id == 'IC'
                          ? 'MICreateAdditional'
                          : 'MICreateNonPPIC',
                    ),
                  );
              },
            ),
          if (createAdditional == false)
            BlocProvider(
              create: (context) => TransactionTypeQueryBloc()
                ..add(
                  TransactionTypeQueryEvent.fetch(
                    pageOptions: PageOptions.emptyNoLimit(),
                    type: 'MATERIAL ISSUE',
                    codes: createAdditional
                        ? ['AD', 'AJ', 'CI', 'TR', 'MM']
                        : null,
                    flag: 'Menu',
                    value: 'MICreate',
                  ),
                ),
            ),
          BlocProvider(
            create: (context) => MaterialIssueQueryBloc(isExternal: isExternal)
              ..add(
                MaterialIssueQueryEvent.fetch(
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
            create: (context) => MaterialGroupQueryBloc()
              ..add(MaterialGroupQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              )),
          ),
        ],
        child: MaterialIssueCreatePage(
          createAdditional: createAdditional,
          materialIssue: materialIssue,
        ),
      ),
    );
  }

  @override
  State<MaterialIssueCreatePage> createState() =>
      _MaterialIssueCreatePageState();
}

class _MaterialIssueCreatePageState extends State<MaterialIssueCreatePage> {
  final _remarksController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _expiredDateController = TextEditingController();
  var _isExternal = false;

  late TransactionType? _transactionType;
  ProductionOrder? _productionOrder;
  Product? _product;
  late Department _department;
  late MaterialGroup _materialGroup;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (_isExternal) {
        context.read<MaterialIssueBloc>().add(
              MaterialIssueEvent.createNonMi(
                department: _department,
                materialGroup: _materialGroup,
                product: _product!,
                productionOrder: _productionOrder!,
                remarks: _remarksController.text,
                transactionType: _transactionType!,
              ),
            );
      } else if (!widget.createAdditional) {
        context.read<MaterialIssueBloc>().add(
              MaterialIssueEvent.create(
                department: _department,
                materialGroup: _materialGroup,
                product: _product!,
                productionOrder: _productionOrder!,
                remarks: _remarksController.text,
                transactionType: _transactionType!,
              ),
            );
      } else {
        context.read<MaterialIssueBloc>().add(
              MaterialIssueEvent.createNonMi(
                department: _department,
                materialGroup: _materialGroup,
                remarks: _remarksController.text,
                transactionType: _transactionType!,
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = EntityMaterialStock.materialIssue;
    final action = widget.createAdditional == true
        ? DataAction.createAdditional
        : DataAction.create;

    return BlocListener<MaterialIssueBloc, MaterialIssueState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => Toast(context).fail(error),
          success: () {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          formKey: _formKey,
          action: action,
          entity: entity,
          size: SingleFormPanelSize.large,
          actions: [
            BlocBuilder<MaterialIssueBloc, MaterialIssueState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  action: action,
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
                _buildFieldTransactionType(),
                _buildFieldDepartment(),
              ],
            ),
            if (widget.createAdditional == false)
              MultiBlocProvider(
                key: ValueKey(_isExternal),
                providers: [
                  BlocProvider(
                    create: (context) => ProductQueryBloc(
                      isExternal: _isExternal,
                    )..add(
                        ProductQueryEvent.fetch(
                          pageOptions: PageOptions.emptyNoLimit(),
                          active: true,
                          isPhaseOut: false,
                        ),
                      ),
                  ),
                  BlocProvider(
                    key: ValueKey(_product),
                    create: (context) =>
                        ProductionOrderQueryBloc(isExternal: _isExternal)
                          ..add(
                            ProductionOrderQueryEvent.fetch(
                              product: _product == null
                                  ? Product.empty().copyWith(id: 'none')
                                  : _product,
                              pageOptions: PageOptions.emptyNoLimit(),
                            ),
                          ),
                  ),
                ],
                child: Builder(builder: (context) {
                  return Column(
                    children: [
                      const SizedBox(height: 24),
                      RowFields(
                        children: [
                          FDropDownSearchProduct(
                            initialValue: _product,
                            onChanged: (product) {
                              if (product != null) {
                                _product = product;
                                _productionOrder = null;
                                setState(() {});
                              }
                            },
                          ),
                          FDropDownSearchProductionOrder(
                            key: ValueKey(_product),
                            label: 'Batch',
                            onChanged: (value) {
                              if (value != null) {
                                _productionOrder = value;
                                _expiredDateController.text =
                                    value.expirationDate.yMMMMd;
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            const SizedBox(height: 24),
            RowFields(
              children: [
                _buildFieldMaterialGroup(),
                if (widget.createAdditional == false)
                  FieldDatePicker(
                    enabled: false,
                    labelText: 'Expired Date',
                    controller: _expiredDateController,
                  ),
              ],
            ),
            const SizedBox(height: 24),
            FTextFormField(
              labelText: 'Remarks',
              controller: _remarksController,
              validator: requiredValidator.call,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldTransactionType() {
    return FDropDownSearchTransactionType(
      onChanged: (transactionType) {
        if (transactionType != null) {
          _transactionType = transactionType;
          _product = null;
          _productionOrder = null;
          _isExternal = ['PR3', 'PR9', 'PR11'].contains(
            _transactionType!.id,
          );
          setState(() {});
        }
      },
    );
  }

  Widget _buildFieldDepartment() {
    return FDropDownSearchDepartment(
      onChanged: (department) {
        if (department != null) {
          _department = department;
        }
      },
    );
  }

  Widget _buildFieldMaterialGroup() {
    return FDropDownSearchMaterialGroup(
      onChanged: (materialGroup) {
        if (materialGroup != null) {
          _materialGroup = materialGroup;
        }
      },
    );
  }
}
