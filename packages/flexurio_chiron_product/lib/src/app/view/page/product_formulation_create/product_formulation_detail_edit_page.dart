import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_detail/product_formulation_detail_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation_detail.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class MaterialRequestDetailEditPage extends StatefulWidget {
  const MaterialRequestDetailEditPage._({
    required this.temporaryBloc,
    required this.productFormulationDetailTemporary,
  });

  static Widget prepare({
    required ProductFormulationDetailTemporary
        productFormulationDetailTemporary,
    required ProductFormulationDetailBloc temporaryBloc,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialQueryBloc()
            ..add(
              MaterialQueryEvent.fetchByMaterialGroup(
                id: productFormulationDetailTemporary
                    .material!.materialGroup.id,
              ),
            ),
        ),
      ],
      child: MaterialRequestDetailEditPage._(
        productFormulationDetailTemporary: productFormulationDetailTemporary,
        temporaryBloc: temporaryBloc,
      ),
    );
  }

  final ProductFormulationDetailTemporary productFormulationDetailTemporary;
  final ProductFormulationDetailBloc temporaryBloc;

  @override
  State<MaterialRequestDetailEditPage> createState() =>
      _MaterialRequestDetailCreateState();
}

class _MaterialRequestDetailCreateState
    extends State<MaterialRequestDetailEditPage> {
  final _formKey = GlobalKey<FormState>();

  final _quantityController = TextEditingController();
  model.Material? _material;
  final _requiredObjectValidator = RequiredObjectValidator<dynamic>(
    errorText: pleaseFillOutThisField.tr(),
  );

  @override
  void initState() {
    super.initState();
    _material = widget.productFormulationDetailTemporary.material;
    _quantityController.text =
        widget.productFormulationDetailTemporary.quantity.format();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final event = ProductFormulationDetailEvent.update(
        ProductFormulationDetailTemporary(
          id: widget.productFormulationDetailTemporary.id,
          quantity: stringDecimalToDouble(_quantityController.text),
          material: _material,
        ),
      );
      widget.temporaryBloc.add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.update;

    return SingleFormPanel(
      actions: [
        BlocBuilder<ProductFormulationDetailBloc,
            List<ProductFormulationDetailTemporary>>(
          bloc: widget.temporaryBloc,
          builder: (context, state) {
            return Button(
              onPressed: () {
                _submit();
                Navigator.pop(context);
              },
              action: action,
              permission: null,
            );
          },
        ),
      ],
      formKey: _formKey,
      action: action,
      entity: Entity.material,
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
                    }
                  },
                  initialValue:
                      widget.productFormulationDetailTemporary.material,
                  itemAsString: (material) => material.name,
                );
              },
            ),
            const SizedBox(height: 24),
            FTextFormField(
              validator: requiredValidator.call,
              labelText: 'Quantity',
              suffixIcon: SizedBox(
                width: 25,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Unit',
                    style: TextStyle(
                      color: Colors.grey.shade300,
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
