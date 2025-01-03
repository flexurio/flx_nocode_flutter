import 'package:appointment/src/app/view/widget/drop_down_items/material.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialIssueDetailCreatePage extends StatefulWidget {
  const MaterialIssueDetailCreatePage({
    required this.action,
    required this.materialIssue,
    this.materialIssueDetail,
    this.product,
    super.key,
    this.materialStock,
    required this.isExternal,
  });
  final bool isExternal;

  final DataAction action;
  final MaterialIssue materialIssue;
  final Product? product;
  final MaterialIssueDetail? materialIssueDetail;
  final MaterialStock? materialStock;

  static Widget prepare({
    required DataAction action,
    required MaterialIssue materialIssue,
    MaterialIssueDetail? materialIssueDetail,
    MaterialStock? materialStock,
    Product? product,
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialIssueDetailBloc(isExternal: isExternal),
        ),
        if (action.isCreate)
          BlocProvider(
            create: (context) => MaterialQueryBloc()
              ..add(
                MaterialQueryEvent.fetch(
                  materialGroup: materialIssue.materialGroup,
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          )
        else
          BlocProvider(
            create: (context) => MaterialQueryBloc(),
          ),
        BlocProvider(
          create: (context) => MaterialUnitQueryBloc()
            ..add(MaterialUnitQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
        BlocProvider(
          create: (context) => MaterialStockQueryBloc(isExternal: isExternal),
        ),
      ],
      child: MaterialIssueDetailCreatePage(
        action: action,
        materialIssue: materialIssue,
        materialStock: materialStock,
        materialIssueDetail: materialIssueDetail,
        product: product,
        isExternal: isExternal,
      ),
    );
  }

  @override
  State<MaterialIssueDetailCreatePage> createState() =>
      _MaterialIssueDetailCreatePageState();
}

class _MaterialIssueDetailCreatePageState
    extends State<MaterialIssueDetailCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  final _quantityRequiredController = TextEditingController();
  final _quantityStockController = TextEditingController();
  final _unitController = TextEditingController();
  late MaterialStock _materialStock;

  model.Material? _material;
  MaterialUnit? materialUnit;
  late MaterialStock materialStock;

  @override
  void initState() {
    super.initState();

    if (widget.action.isEdit) {
      _quantityRequiredController.text =
          widget.materialIssueDetail!.quantityRequired.format(5);
      _material = widget.materialIssueDetail!.material;
      materialUnit = widget.materialIssueDetail!.materialUnit;
      _unitController.text = widget.materialIssueDetail!.materialUnit.id;
      _quantityStockController.text =
          widget.materialIssueDetail!.weightedQuantity.toInt().toString();
      _quantityController.text =
          widget.materialIssueDetail!.quantity.toString();
      materialStock =
          MaterialStock.empty().copyWith(na: widget.materialIssueDetail!.na);

      context.read<MaterialStockQueryBloc>().add(
            MaterialStockQueryEvent.fetchByMaterialId(
              period: DateTime.now(),
              materialId: _material!.id,
              pageOptions: PageOptions.emptyNoLimit(
                ascending: true,
                sortBy: 'expired_date',
              ),
            ),
          );
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (widget.action.isCreate) {
        context.read<MaterialIssueDetailBloc>().add(
              MaterialIssueDetailEvent.create(
                na: _materialStock.na,
                quantity: stringDecimalToDouble(_quantityController.text),
                quantityRequired:
                    stringDecimalToDouble(_quantityRequiredController.text),
                material: _material!,
                materialIssue: widget.materialIssue,
                materialUnit: _unitController.text,
              ),
            );
      } else {
        context.read<MaterialIssueDetailBloc>().add(
              MaterialIssueDetailEvent.edit(
                materialIssueDetail: widget.materialIssueDetail!,
                materialIssue: widget.materialIssue,
                na: materialStock.na,
                quantity: stringDecimalToDouble(_quantityController.text),
                material: widget.materialIssueDetail!.material,
                materialUnit: widget.materialIssueDetail!.materialUnit.id,
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = EntityMaterialStock.materialIssueDetail;

    return BlocListener<MaterialIssueDetailBloc, MaterialIssueDetailState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: () {
            Toast(context).dataChanged(widget.action, entity);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          entity: entity,
          action: widget.action,
          formKey: _formKey,
          actions: [
            BlocBuilder<MaterialIssueDetailBloc, MaterialIssueDetailState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  action: widget.action,
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
                _buildFieldMaterial(),
                _buildFieldUnit(),
              ],
            ),
            const SizedBox(height: 24),
            if (widget.action.isCreate)
              RowFields(
                children: [
                  _buildFieldAnalysisNumber(),
                  FTextFormField(
                    labelText: 'quantity_stock'.tr(),
                    enabled: false,
                    controller: _quantityStockController,
                  ),
                ],
              ),
            if (widget.action.isEdit)
              RowFields(
                children: [
                  FTextFormFieldQuantityStock.prepare(
                    materialIssueDetail: widget.materialIssueDetail!,
                    material: widget.materialIssueDetail!.material,
                    quantityStockController: _quantityStockController,
                    isExternal: widget.isExternal,
                  ),
                  _buildFieldQuantityRequired(),
                ],
              ),
            const SizedBox(height: 24),
            RowFields(
              children: [
                if (widget.action.isEdit)
                  FDropDownSearchMaterialStockNa(
                    initialValue: materialStock,
                    materialStock: materialStock,
                    onChanged: (value) {
                      if (value != null) {
                        materialStock = value;
                        _quantityStockController.text =
                            materialStock.endingBalance.format(5);
                        setState(() {});
                      }
                    },
                  ),
                _buildFieldQuantity(),
                if (widget.action.isCreate) const SizedBox(width: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String? _validateQuantity(String? value) {
    if (value!.isEmpty) {
      return 'Please fill in the quantity value';
    }

    final quantityStockValue = _quantityStockController.text;

    if (widget.action.isCreate) {
      if (quantityStockValue != '') {
        final quantityStockValueInt = stringDecimalToDouble(quantityStockValue);
        final quantityValueInt = stringDecimalToDouble(quantityStockValue);

        if (quantityStockValueInt != 0) {
          if (quantityValueInt > quantityStockValueInt) {
            return 'Quantity More Than Quantity Stock';
          }
          return null;
        }
      }
    }

    if (widget.action.isEdit) {
      final quantityRequiredValue = _quantityRequiredController.text;

      if (quantityRequiredValue != '' || quantityStockValue != '') {
        final quantityRequiredValueInt =
            stringDecimalToDouble(quantityRequiredValue);
        final quantityStockValueInt = stringDecimalToDouble(quantityStockValue);
        final quantityValueInt = stringDecimalToDouble(value);

        if (quantityRequiredValueInt != 0 || quantityStockValueInt != 0) {
          if (quantityValueInt > quantityStockValueInt &&
              quantityValueInt > quantityRequiredValueInt) {
            return 'Quantity More Than Quantity Stock & Quantity Required';
          }
          if (quantityValueInt > quantityStockValueInt) {
            return 'Quantity More Than Quantity Stock';
          }
          if ((_material?.isLockQuantityMaterialIssue ?? true) &&
              quantityValueInt > quantityRequiredValueInt) {
            return 'Quantity More Than Quantity Required';
          }
          return null;
        }
      }
    }
    return null;
  }

  Widget _buildFieldQuantity() {
    return FTextFormField.decimal(
      labelText: 'quantity'.tr(),
      controller: _quantityController,
      validator: _validateQuantity,
    );
  }

  Widget _buildFieldQuantityRequired() {
    return FTextFormField.decimal(
      labelText: 'quantity_required'.tr(),
      enabled: false,
      controller: _quantityRequiredController,
    );
  }

  Widget _buildFieldAnalysisNumber() {
    return FDropDownSearchMaterialStockNa(
      onChanged: (value) {
        if (value != null) {
          _materialStock = value;
          _quantityStockController.text = value.endingBalance.format(5);
        }
      },
    );
  }

  Widget _buildFieldUnit() {
    return FTextFormField(
      labelText: 'Unit',
      enabled: false,
      controller: _unitController,
    );
  }

  Widget _buildFieldMaterial() {
    return FDropDownSearchMaterial(
      initialValue: _material,
      enabled: widget.action.isCreate,
      onChanged: (value) {
        if (value != null) {
          _material = value;
          _unitController.text = value.stockUnit.id;
          if (widget.action.isCreate)
            context.read<MaterialStockQueryBloc>().add(
                  MaterialStockQueryEvent.fetchByMaterialId(
                    period: DateTime.now(),
                    materialId: value.id,
                    pageOptions: PageOptions.emptyNoLimit(
                      ascending: true,
                      sortBy: 'expired_date',
                    ),
                  ),
                );
        }
      },
    );
  }
}
