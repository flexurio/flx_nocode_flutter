import 'package:appointment/constant/example_product_formulation_scale.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request/material_request_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_query/material_request_detail_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_temporary/material_request_detail_temporary_bloc.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductFormulationCreatePage extends StatefulWidget {
  const ProductFormulationCreatePage._({
    required this.productFormulation,
    this.detail,
    required this.isExternal,
  });
  final ProductFormulation? productFormulation;
  final bool? detail;
  final bool isExternal;

  static Route<bool> route({
    ProductFormulation? productFormulation,
    bool? detail,
    required bool isExternal,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MaterialRequestBloc()),
          BlocProvider(
            create: (context) => MaterialRequestDetailTemporaryBloc(),
          ),
          BlocProvider(create: (context) => MaterialRequestDetailQueryBloc()),
          BlocProvider(
            create: (context) => MaterialGroupQueryBloc()
              ..add(MaterialGroupQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              )),
          ),
          BlocProvider(
              create: (context) =>
                  ProductFormulationBloc(isExternal: isExternal)),
          if (productFormulation == null)
            BlocProvider(
                create: (context) =>
                    ProductFormulationDetailBloc(isExternal: isExternal))
          else
            BlocProvider(
              create: (context) =>
                  ProductFormulationDetailBloc(isExternal: isExternal)
                    ..add(
                      ProductFormulationDetailEvent.fetch(
                        id: productFormulation.id,
                        product: productFormulation.product,
                        scale: productFormulation.scale,
                      ),
                    ),
            ),
          BlocProvider(
            create: (context) => MaterialUnitQueryBloc()
              ..add(MaterialUnitQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              )),
          ),
          BlocProvider(
            create: (context) => MaterialQueryBloc(
              isExternal: isExternal,
            )..add(
                MaterialQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => ProductQueryBloc(isExternal: isExternal)
              ..add(
                ProductQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
        ],
        child: ProductFormulationCreatePage._(
          productFormulation: productFormulation,
          detail: detail,
          isExternal: isExternal,
        ),
      ),
    );
  }

  @override
  State<ProductFormulationCreatePage> createState() =>
      ProductFormulationCreatePageState();
}

class ProductFormulationCreatePageState
    extends State<ProductFormulationCreatePage> {
  late DataAction _action;

  final _formKey = GlobalKey<FormState>();

  ProductFormulationType? _materialGroup;
  late ProductFormulationScale _scale;
  late String _unit;
  late Product _product;
  final _quantityController = TextEditingController();
  final _remarkController = TextEditingController();
  final _nameController = TextEditingController();

  final _requiredObjectValidator = RequiredObjectValidator<dynamic>(
    errorText: pleaseFillOutThisField.tr(),
  );

  List<ProductFormulationDetailTemporary> nilaiAwal = [];

  final _quantityValidator = MultiValidator([
    RequiredValidator(errorText: pleaseFillOutThisField.tr()),
    NonZeroPositiveNumberValidatorDecimal(errorText: errorQuantityValidator),
  ]);

  @override
  void initState() {
    super.initState();

    _action = widget.detail == false
        ? DataAction.viewDetail
        : createOrEdit(widget.productFormulation);
    if (_action.isEdit || widget.detail == false) {
      _scale = widget.productFormulation!.scale;
      _unit = widget.productFormulation!.unit;
      _product = widget.productFormulation!.product;
      _quantityController.text = widget.productFormulation!.quantity.toString();
      _materialGroup = widget.productFormulation!.type;
      _remarkController.text = widget.productFormulation!.description ?? '';
      _nameController.text = widget.productFormulation!.name ?? '';
    }
  }

  void submit({
    required List<ProductFormulationDetailTemporary> nilaiAwal,
    required List<ProductFormulationDetailTemporary> productFormulationDetail,
  }) {
    if (_formKey.currentState!.validate()) {
      late ProductFormulationEvent event;

      if (_action.isEdit) {
        event = ProductFormulationEvent.submit(
          widget.productFormulation!.id,
          _product.id,
          _materialGroup!.productFormulationType,
          stringDecimalToDouble(_quantityController.text),
          _scale.productFormulationScale,
          _unit,
          nilaiAwal,
          productFormulationDetail,
          _nameController.text,
          _remarkController.text,
        );
      } else {
        event = ProductFormulationEvent.create(
          _product.id,
          _materialGroup!.productFormulationType,
          stringDecimalToDouble(_quantityController.text),
          _scale.productFormulationScale,
          _unit,
          productFormulationDetail,
          _remarkController.text,
          _nameController.text,
        );
      }

      context.read<ProductFormulationBloc>().add(event);
    }
  }

  BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>
      _buildMaterialGroup() {
    return BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: 200,
          child: FDropDownSearch<ProductFormulationType>(
            enabled: widget.detail == false
                ? widget.detail!
                : widget.productFormulation == null || _action.isCreate,
            validator: _requiredObjectValidator.call,
            labelText: 'Material Group',
            items: [
              ProductFormulationType.baku,
              ProductFormulationType.bantu,
              ProductFormulationType.kemasan,
              ProductFormulationType.materialRnD,
            ],
            onChanged: (value) {
              if (_action.isCreate) {
                if (_materialGroup != value) {
                  context.read<ProductFormulationDetailBloc>().add(
                        const ProductFormulationDetailEvent.clear(),
                      );
                  setState(() => _materialGroup = value);
                }
              } else {
                if (_materialGroup != value) {
                  setState(() => _materialGroup = value);
                }
              }
            },
            initialValue: widget.productFormulation?.type,
            itemAsString: (value) => value.productFormulationType,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.billOfMaterial;

    return MultiBlocListener(
      listeners: [
        BlocListener<ProductFormulationBloc, ProductFormulationState>(
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(_action, entity);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
        ),
      ],
      child: ContentWithRightPanel(
        rightPanel: _buildRightPanel(entity),
        child: ProductFormulationDetailTable(
          isExternal: widget.isExternal,
          header: Column(
            children: [
              BackButtonWithTitle(
                title: '${Entity.billOfMaterial.title} Detail',
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _buildMaterialGroup(),
                  const Spacer(),
                  if (_action == DataAction.viewDetail)
                    ProductFormulationDetailExportPdfButton.prepare(
                      productFormulation: widget.productFormulation!,
                      isExternal: widget.isExternal,
                    ),
                  const SizedBox(width: 10),
                  AddButton(
                    materialGroup: _materialGroup,
                    detail: widget.detail,
                    productFormulation: widget.productFormulation,
                    isExternal: widget.isExternal,
                  ),
                ],
              ),
            ],
          ),
          productFormulationType: _materialGroup,
          action: _action,
          hideAction: widget.detail == false ? true : false,
        ),
      ),
    );
  }

  SingleFormPanel _buildRightPanel(Entity entity) {
    final productFormulationUnit = ['KG', 'LITER'];

    return SingleFormPanel(
      actions: [
        BlocBuilder<ProductFormulationDetailBloc,
            List<ProductFormulationDetailTemporary>>(
          builder: (context, productFormulationDetail) {
            final initialState =
                context.read<ProductFormulationDetailBloc>().initialState;
            return widget.detail == false
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.productFormulation!.isActive == false)
                        ProductFormulationActiveButton.prepare(
                          productFormulation: widget.productFormulation!,
                          isExternal: widget.isExternal,
                        ),
                      if (widget.productFormulation!.isActive == true)
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: ProductFormulationNonActiveButton.prepare(
                            id: widget.productFormulation!.id,
                            isExternal: widget.isExternal,
                          ),
                        ),
                    ],
                  )
                : Expanded(
                    child: Button(
                      onPressed: () {
                        submit(
                          nilaiAwal: initialState,
                          productFormulationDetail: productFormulationDetail,
                        );
                      },
                      action: _action,
                      permission: null,
                    ),
                  );
          },
        ),
      ],
      formKey: _formKey,
      visibleBackButton: false,
      action: _action,
      entity: entity,
      children: [
        if (_action.isEdit || widget.detail == false)
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Text(widget.productFormulation!.id.toString()),
          ),
        FTextFormField(
          controller: _nameController,
          labelText: 'Name',
          enabled: widget.detail == false
              ? widget.detail!
              : widget.productFormulation == null
                  ? _action.isCreate
                  : _action.isEdit,
        ),
        const SizedBox(height: 24),
        FDropDownSearch<ProductFormulationScale>(
          enabled: widget.detail == false
              ? widget.detail!
              : widget.productFormulation == null
                  ? _action.isCreate
                  : _action.isEdit,
          validator: _requiredObjectValidator.call,
          labelText: 'Scale',
          items: exampleProductFormulationScales,
          onChanged: (scale) {
            if (scale != null) {
              _scale = scale;
            }
          },
          initialValue: widget.productFormulation?.scale,
          itemAsString: (value) => value.productFormulationScale,
        ),
        const SizedBox(height: 24),
        FTextFormField(
          enabled: widget.detail == false
              ? widget.detail!
              : widget.productFormulation == null
                  ? _action.isCreate
                  : _action.isEdit,
          labelText: 'Quantity',
          controller: _quantityController,
          validator: _quantityValidator.call,
          maxLength: 50,
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp(r'^[1-9]\d*(\.\d*)?$'),
            ),
          ],
        ),
        const SizedBox(height: 24),
        FDropDownSearch<String>(
          enabled: widget.detail == false
              ? widget.detail!
              : widget.productFormulation == null
                  ? _action.isCreate
                  : _action.isEdit,
          validator: _requiredObjectValidator.call,
          labelText: 'Unit',
          items: productFormulationUnit,
          onChanged: (productFormulationUnit) {
            if (productFormulationUnit != null) {
              _unit = productFormulationUnit;
            }
          },
          itemAsString: (value) => value,
          initialValue: widget.productFormulation?.unit,
        ),
        const SizedBox(height: 24),
        BlocBuilder<ProductQueryBloc, ProductQueryState>(
          builder: (context, state) {
            return FDropDownSearch<Product>(
              enabled: widget.detail == false
                  ? widget.detail!
                  : widget.productFormulation == null
                      ? _action.isCreate
                      : _action.isEdit,
              validator: _requiredObjectValidator.call,
              status: state.maybeWhen(
                error: (_) => Status.error,
                loading: (_) => Status.progress,
                orElse: () => Status.loaded,
              ),
              labelText: 'Product',
              items: state.maybeWhen(
                orElse: () => [],
                loaded: (product) => product.data,
              ),
              onChanged: (product) {
                if (product != null) {
                  _product = product;
                }
              },
              initialValue: widget.productFormulation?.product,
              itemAsString: (product) => product.name,
            );
          },
        ),
        const SizedBox(height: 24),
        FTextFormField(
          controller: _remarkController,
          labelText: 'Remark',
          maxLines: 3,
          enabled: widget.detail == false
              ? widget.detail!
              : widget.productFormulation == null
                  ? _action.isCreate
                  : _action.isEdit,
        ),
      ],
    );
  }
}
