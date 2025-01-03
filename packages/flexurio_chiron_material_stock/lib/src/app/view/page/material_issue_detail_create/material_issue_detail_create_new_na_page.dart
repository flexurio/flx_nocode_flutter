import 'package:appointment/src/app/view/widget/drop_down_items/material.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_unit_query/material_unit_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialIssueDetailCreateNewNaPage extends StatefulWidget {
  const MaterialIssueDetailCreateNewNaPage({
    required this.action,
    required this.materialIssue,
    this.materialIssueDetail,
    this.product,
    super.key,
    this.materialStock,
  });

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
        BlocProvider(
          create: (context) => MaterialQueryBloc(),
        ),
        BlocProvider(
          create: (context) => MaterialUnitQueryBloc()
            ..add( MaterialUnitQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
        BlocProvider(
          create: (context) => MaterialStockQueryBloc(isExternal: isExternal),
        ),
      ],
      child: MaterialIssueDetailCreateNewNaPage(
        action: action,
        materialIssue: materialIssue,
        materialStock: materialStock,
        materialIssueDetail: materialIssueDetail,
        product: product,
      ),
    );
  }

  @override
  State<MaterialIssueDetailCreateNewNaPage> createState() =>
      _MaterialIssueDetailCreateNewNaPageState();
}

class _MaterialIssueDetailCreateNewNaPageState
    extends State<MaterialIssueDetailCreateNewNaPage> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  final _quantityRequiredController = TextEditingController();
  final _unitController = TextEditingController();
  late MaterialStock _materialStock;

  model.Material? _material;
  MaterialUnit? materialUnit;
  late MaterialStock materialStock;

  @override
  void initState() {
    super.initState();
    _material = widget.materialIssueDetail!.material;
    _unitController.text = widget.materialIssueDetail!.materialUnit.id;
    _quantityRequiredController.text =
        (widget.materialIssueDetail!.quantityRequired -
                widget.materialIssueDetail!.quantity)
            .format(5);

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

  void _submit() {
    if (_formKey.currentState!.validate()) {
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
    }
  }

  String? _validateQuantity(String? value) {
    if (value!.isEmpty) {
      return 'Please fill in the quantity value';
    }
    if (_quantityRequiredController.text != '') {
      if (stringDecimalToDouble(_quantityRequiredController.text) != 0) {
        if ((_material?.isLockQuantityMaterialIssue ?? true) &&
            stringDecimalToDouble(_quantityController.text) >
                stringDecimalToDouble(_quantityRequiredController.text)) {
          return 'Quantity More Than Quantity Required';
        }
      }
    }
    return null;
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
                FDropDownSearchMaterial(
                  initialValue: _material,
                  enabled: false,
                  onChanged: (value) {},
                ),
                FTextFormField(
                  labelText: 'Unit',
                  enabled: false,
                  controller: _unitController,
                ),
              ],
            ),
            const SizedBox(height: 24),
            RowFields(
              children: [
                _buildFieldAnalysisNumber(),
                _buildFieldQuantityRequired(),
              ],
            ),
            const SizedBox(height: 24),
            RowFields(
              children: [
                _buildFieldQuantity(),
                SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldQuantity() {
    return FTextFormField.decimal(
      labelText: 'Quantity',
      controller: _quantityController,
      validator: _validateQuantity,
    );
  }

  Widget _buildFieldQuantityRequired() {
    return FTextFormField.decimal(
      labelText: 'Quantity Required',
      enabled: false,
      controller: _quantityRequiredController,
    );
  }

  Widget _buildFieldAnalysisNumber() {
    return FDropDownSearchMaterialStockNa(
      onChanged: (value) {
        if (value != null) {
          _materialStock = MaterialStock.empty().copyWith(na: value.na);
        }
      },
    );
  }
}
