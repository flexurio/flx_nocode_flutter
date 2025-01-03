import 'package:flexurio_chiron_material/src/app/bloc/material_design/material_design_bloc.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_detail_query/product_formulation_detail_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/product_formulation_from_detail.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class MaterialDesignCreatePage extends StatefulWidget {
  const MaterialDesignCreatePage._(
    this.materialDesign,
  );

  final MaterialDesign? materialDesign;

  static Route<bool?> route({
    MaterialDesign? materialDesign,
    required bool isExternal,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => MaterialDesignBloc(isExternal: isExternal)),
          BlocProvider(
            create: (context) => MaterialQueryBloc(isExternal: isExternal)
              ..add(
                MaterialQueryEvent.fetch(
                  materialGroup: MaterialGroup.id('KEMASAN'),
                  isActive: true,
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
          BlocProvider(
            create: (context) =>
                ProductFormulationDetailQueryBloc(isExternal: isExternal),
          ),
        ],
        child: MaterialDesignCreatePage._(materialDesign),
      ),
    );
  }

  @override
  State<MaterialDesignCreatePage> createState() =>
      _MaterialDesignCreatePageState();
}

class _MaterialDesignCreatePageState extends State<MaterialDesignCreatePage> {
  late DataAction _action;
  model.Material? _material;
  ProductFormulation? _productFormulation;

  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.materialDesign);

    if (_action.isEdit) {
      _idController.text = widget.materialDesign!.designCode;
      _descriptionController.text = widget.materialDesign!.description;
      _material = widget.materialDesign!.material;
      _productFormulation = widget.materialDesign!.formulation;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late MaterialDesignEvent event;

      if (_action.isCreate) {
        event = MaterialDesignEvent.create(
          material: _material!,
          id: _idController.text,
          outsource: _descriptionController.text,
          productFormulation: _productFormulation!,
        );
      } else {
        event = MaterialDesignEvent.edit(
          materialDesign: widget.materialDesign!,
          description: _descriptionController.text,
        );
      }

      context.read<MaterialDesignBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.materialDesign;
    return BlocListener<MaterialDesignBloc, MaterialDesignState>(
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          formKey: _formKey,
          action: _action,
          entity: entity,
          actions: [
            BlocBuilder<MaterialDesignBloc, MaterialDesignState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                  action: _action,
                );
              },
            ),
          ],
          children: [
            Column(
              children: [
                FTextFormField(
                  enabled: _action.isCreate,
                  labelText: 'ID',
                  controller: _idController,
                  validator: requiredValidator.call,
                  maxLength: 50,
                ),
                const Gap(24),
                RowFields(
                  children: [
                    _buildMaterialDropDown(),
                    _buildProductFormulationDropDown(),
                  ],
                ),
                const Gap(24),
                FTextFormField(
                  labelText: 'Description',
                  controller: _descriptionController,
                  validator: requiredValidator.call,
                  maxLength: 500,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialDropDown() {
    return BlocBuilder<MaterialQueryBloc, MaterialQueryState>(
      builder: (context, state) {
        return FDropDownSearch<model.Material>(
          enabled: _action.isCreate,
          validator: requiredObjectValidator.call,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: (_) => Status.progress,
            orElse: () => Status.loaded,
          ),
          labelText: 'Material',
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (material) => material.data,
          ),
          onChanged: (value) {
            if (value != null) _material = value;
            context
                .read<ProductFormulationDetailQueryBloc>()
                .add(ProductFormulationDetailQueryEvent.fetch(material: value));
            setState(() {});
          },
          itemAsString: (material) => material.name,
          initialValue: widget.materialDesign?.material,
        );
      },
    );
  }

  Widget _buildProductFormulationDropDown() {
    return FDropDownSearchProductFormulationFromDetail(
      key: ValueKey(_material),
      enabled: _action.isCreate,
      onChanged: (value) {
        if (value != null) _productFormulation = value;
      },
      initialValue: _productFormulation,
    );
  }
}
