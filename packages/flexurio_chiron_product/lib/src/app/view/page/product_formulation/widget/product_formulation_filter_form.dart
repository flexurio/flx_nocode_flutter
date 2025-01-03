import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_detail_query/product_formulation_detail_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductFormulationMaterialFilterForm extends StatefulWidget {
  const ProductFormulationMaterialFilterForm({
    required this.productFormulationDetailQueryBloc,
    required this.materialQueryBloc,
    required this.onFilter,
    super.key,
    this.closeWhenSubmitted = false,
    this.fixedSize = false,
  });

  final ProductFormulationDetailQueryBloc productFormulationDetailQueryBloc;
  final MaterialQueryBloc materialQueryBloc;
  final bool closeWhenSubmitted;
  final void Function() onFilter;
  final bool fixedSize;

  @override
  State<ProductFormulationMaterialFilterForm> createState() =>
      _ProductFormulationMaterialFilterFormState();
}

class _ProductFormulationMaterialFilterFormState
    extends State<ProductFormulationMaterialFilterForm> {
  final _formKey = GlobalKey<FormState>();
  model.Material? _material;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (_material != null) {
        widget.productFormulationDetailQueryBloc.add(
          ProductFormulationDetailQueryEvent.fetch(
            material: _material,
          ),
        );
        widget.onFilter();
        if (widget.closeWhenSubmitted) {
          Navigator.pop(context, true);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocBuilder<MaterialQueryBloc, MaterialQueryState>(
        bloc: widget.materialQueryBloc,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Filter',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              BlocBuilder<MaterialQueryBloc, MaterialQueryState>(
                bloc: widget.materialQueryBloc,
                builder: (context, state) {
                  return SizedBox(
                    width: widget.fixedSize ? 350 : null,
                    child: FDropDownSearch<model.Material>(
                      validator: requiredObjectValidator.call,
                      status: state.maybeWhen(
                        error: (_) => Status.error,
                        loading: (_) => Status.progress,
                        orElse: () => Status.loaded,
                      ),
                      labelText: 'Material',
                      items: state.maybeWhen(
                        orElse: () => [],
                        loaded: (material) => material.data
                            .where(
                              (e) =>
                                  ['BAKU'].contains(e.materialGroup.id) ||
                                  ['BANTU'].contains(e.materialGroup.id) ||
                                  ['KEMASAN'].contains(e.materialGroup.id),
                            )
                            .toList(),
                      ),
                      onChanged: (material) {
                        if (material != null) {
                          _material = material;
                        }
                      },
                      itemAsString: (material) =>
                          '${material.id} - ${material.name}',
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<MaterialQueryBloc, MaterialQueryState>(
                bloc: widget.materialQueryBloc,
                builder: (context, state) {
                  return Button(
                    action: DataAction.applyFilter,
                    permission: null,
                    onPressed: state.maybeWhen(
                      orElse: () => _submit,
                      loading: (_) => null,
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
