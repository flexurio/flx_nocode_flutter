import 'package:appointment/constant/example_product_formulation_scale.dart';
import 'package:appointment/constant/example_product_formulation_type.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_formulation/product_formulation_bloc.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_detail/product_formulation_detail_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation_detail.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation_detail/widget/active_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation_detail/widget/product_formulation_non_active_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation_detail/widget/product_formulation_row.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class ProductFormulationDetailPage extends StatefulWidget {
  const ProductFormulationDetailPage._(
      this.productFormulation, this.isExternal);

  final ProductFormulation productFormulation;
  final bool isExternal;

  static Route<bool?> route({
    required ProductFormulation productFormulation,
    required bool isExternal,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  ProductFormulationBloc(isExternal: isExternal)),
          BlocProvider(
            create: (context) => MaterialUnitQueryBloc()
              ..add(MaterialUnitQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              )),
          ),
          BlocProvider(
            create: (context) => MaterialQueryBloc()
              ..add(
                MaterialQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
        ],
        child: ProductFormulationDetailPage._(productFormulation, isExternal),
      ),
    );
  }

  @override
  State<ProductFormulationDetailPage> createState() =>
      _ProductFormulationDetailPageState();
}

class _ProductFormulationDetailPageState
    extends State<ProductFormulationDetailPage> {
  late DataAction _action;
  final _formKey = GlobalKey<FormState>();
  final _productController = TextEditingController();
  final _quantityController = TextEditingController();
  final _typeController = TextEditingController();
  final _unitController = TextEditingController();
  final _scaleController = TextEditingController();

  final _requiredObjectValidator = RequiredObjectValidator<dynamic>(
    errorText: pleaseFillOutThisField.tr(),
  );

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.productFormulation);
    if (_action.isEdit) {
      _scaleController.text =
          widget.productFormulation.scale.productFormulationScale;
      _quantityController.text = widget.productFormulation.quantity.toString();
      _unitController.text = widget.productFormulation.unit;
      _typeController.text =
          widget.productFormulation.type.productFormulationType;
      _productController.text = widget.productFormulation.product.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    final productFormulationUnit = ['KG', 'LITER'];
    return BlocListener<ProductFormulationBloc, ProductFormulationState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () => Navigator.pop(context, true),
          orElse: () {},
        );
      },
      child: FCard(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(18),
        child: SingleFormPanel(
          size: SingleFormPanelSize.large,
          formKey: _formKey,
          actions: const [],
          action: DataAction.viewDetail,
          entity: Entity.billOfMaterial,
          children: [
            Column(
              children: [
                const Gap(24),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: FDropDownSearch<ProductFormulationScale>(
                          validator: _requiredObjectValidator.call,
                          labelText: 'Scale',
                          items: exampleProductFormulationScales,
                          onChanged: (scale) {
                            _scaleController.text =
                                scale!.productFormulationScale;
                          },
                          initialValue: widget.productFormulation.scale,
                          itemAsString: (value) =>
                              value.productFormulationScale,
                          enabled: false,
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: FTextFormField(
                                labelText: 'Quantity',
                                controller: _quantityController,
                                validator: requiredValidator.call,
                                maxLength: 50,
                                enabled: false,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: FDropDownSearch<String>(
                                validator: _requiredObjectValidator.call,
                                labelText: 'Unit',
                                items: productFormulationUnit,
                                onChanged: (productFormulationUnit) {
                                  if (productFormulationUnit != null) {
                                    _unitController.text =
                                        productFormulationUnit;
                                  }
                                },
                                itemAsString: (productFormulationUnit) =>
                                    productFormulationUnit,
                                initialValue: widget.productFormulation.unit,
                                enabled: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: FDropDownSearch<ProductFormulationType>(
                          validator: _requiredObjectValidator.call,
                          labelText: 'Type',
                          items: exampleProductFormulationTypes,
                          onChanged: (value) {
                            _typeController.text =
                                value!.productFormulationType;
                          },
                          initialValue: widget.productFormulation.type,
                          itemAsString: (value) => value.productFormulationType,
                          enabled: false,
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: FTextFormField(
                          labelText: 'Product',
                          controller: _productController,
                          validator: requiredValidator.call,
                          maxLength: 50,
                          enabled: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 45),
            BlocBuilder<ProductFormulationDetailBloc,
                List<ProductFormulationDetailTemporary>>(
              builder: (context, initialState) {
                return Column(
                  children: [
                    const SizedBox(height: 35),
                    if (initialState.isNotEmpty)
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: const Row(
                              children: [
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    'Material',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 50),
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    'Quantity',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Divider(),
                          const SizedBox(height: 30),
                        ],
                      ),
                    Column(
                      children: List.generate(initialState.length, (index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: RndFormulationRow(
                              index: index,
                              productFormulationDetailTemporary:
                                  initialState[index],
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 30),
                    if (initialState.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 120,
                            child: Button(
                              permission: null,
                              color: Colors.amber,
                              onPressed: () {},
                              action: DataAction.edit,
                            ),
                          ),
                          if (widget.productFormulation.isActive == false)
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: ProductFormulationActiveButton.prepare(
                                productFormulation: widget.productFormulation,
                                isExternal: widget.isExternal,
                              ),
                            ),
                          if (widget.productFormulation.isActive == true)
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: ProductFormulationNonActiveButton.prepare(
                                id: widget.productFormulation.id,
                                isExternal: widget.isExternal,
                              ),
                            ),
                        ],
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
