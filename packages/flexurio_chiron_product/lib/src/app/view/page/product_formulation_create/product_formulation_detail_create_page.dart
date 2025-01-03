import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_detail/product_formulation_detail_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation_detail.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class PurchaseRequestDetailCreatePage extends StatefulWidget {
  const PurchaseRequestDetailCreatePage._({
    required this.temporaryBloc,
    this.productFormulationType,
    this.productFormulationDetailTemporary,
  });

  static Widget prepare({
    required ProductFormulationDetailBloc temporaryBloc,
    ProductFormulationType? productFormulationType,
    ProductFormulationDetailTemporary? productFormulationDetailTemporary,
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialQueryBloc(
            isExternal: isExternal,
          )
            ..add(
              MaterialQueryEvent.fetchByMaterialGroup(
                id: productFormulationType!.label,
              ),
            ),
        ),
      ],
      child: PurchaseRequestDetailCreatePage._(
        productFormulationType: productFormulationType,
        temporaryBloc: temporaryBloc,
        productFormulationDetailTemporary: productFormulationDetailTemporary,
      ),
    );
  }

  final ProductFormulationType? productFormulationType;
  final ProductFormulationDetailBloc temporaryBloc;
  final ProductFormulationDetailTemporary? productFormulationDetailTemporary;

  @override
  State<PurchaseRequestDetailCreatePage> createState() =>
      _MaterialRequestDetailCreateState();
}

class _MaterialRequestDetailCreateState
    extends State<PurchaseRequestDetailCreatePage> {
  final _formKey = GlobalKey<FormState>();

  final _quantityController = TextEditingController();
  final _materialUnitController = TextEditingController();

  model.Material? _material;

  final _requiredObjectValidator = RequiredObjectValidator<dynamic>(
    errorText: pleaseFillOutThisField.tr(),
  );

  @override
  void initState() {
    super.initState();
    if (widget.productFormulationDetailTemporary != null) {
      _materialUnitController.text =
          widget.productFormulationDetailTemporary!.material!.materialUnit.id;
      _material = widget.productFormulationDetailTemporary!.material;
      _quantityController.text =
          widget.productFormulationDetailTemporary!.quantity.toString();
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late ProductFormulationDetailEvent event;
      if (widget.productFormulationDetailTemporary != null) {
        event = ProductFormulationDetailEvent.update(
          ProductFormulationDetailTemporary(
            id: widget.productFormulationDetailTemporary!.id,
            quantity: stringDecimalToDouble(_quantityController.text),
            material: _material,
          ),
        );
      } else {
        event = ProductFormulationDetailEvent.create(
          material: _material!,
          quantity: stringDecimalToDouble(_quantityController.text),
        );
      }
      widget.temporaryBloc.add(event);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final action = widget.productFormulationDetailTemporary != null
        ? DataAction.update
        : DataAction.create;

    return SingleFormPanel(
      actions: [
        BlocBuilder<ProductFormulationDetailBloc,
            List<ProductFormulationDetailTemporary>>(
          bloc: widget.temporaryBloc,
          builder: (context, state) {
            return Button(
              onPressed: _submit,
              action: action,
              permission: null,
            );
          },
        ),
      ],
      formKey: _formKey,
      action: action,
      entity: Entity.billOfMaterial,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<MaterialQueryBloc, MaterialQueryState>(
              builder: (context, state) {
                return FDropDownSearch<model.Material>(
                  labelText: 'Material',
                  validator: _requiredObjectValidator.call,
                  status: state.maybeWhen(
                    error: (_) => Status.error,
                    loading: (_) => Status.progress,
                    orElse: () => Status.loaded,
                  ),
                  items: state.maybeWhen(
                    orElse: () => [],
                    loaded: (material) => material.data,
                  ),
                  onChanged: (material) {
                    if (material != null) {
                      _material = material;
                      _materialUnitController.text = material.materialUnit.id;
                      setState(() {});
                    }
                  },
                  initialValue:
                      widget.productFormulationDetailTemporary?.material,
                  itemAsString: (material) => material.name,
                );
              },
            ),
            const SizedBox(height: 24),
            FTextFormField(
              validator: requiredValidator.call,
              labelText: 'Quantity',
              suffixIcon: SizedBox(
                width: 35,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _materialUnitController.text.isEmpty
                        ? 'Unit'
                        : _materialUnitController.text,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              controller: _quantityController,
              inputFormatters: [
                DecimalInputFormatter(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
