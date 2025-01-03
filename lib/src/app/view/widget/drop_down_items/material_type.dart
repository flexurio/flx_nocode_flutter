import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_type_query/material_type_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_type.dart'
    as model;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchMaterialType extends StatelessWidget
    implements DropDownObject<model.MaterialType> {
  const FDropDownSearchMaterialType({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.label,
    this.enabled = true,
  });

  @override
  final model.MaterialType? initialValue;

  @override
  final void Function(model.MaterialType?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(model.MaterialType?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<MaterialTypeQueryBloc, MaterialTypeQueryState>(
      builder: (context, state) {
        return FDropDownSearch<model.MaterialType>(
          enabled: enabled,
          labelText: label ?? Entity.materialType.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          itemAsString: (materialType) => materialType.id,
          status: state.maybeWhen(
            orElse: () => Status.loaded,
            loading: (_) => Status.progress,
            error: (_) => Status.error,
          ),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (materialTypes) => materialTypes.data,
          ),
        );
      },
    );
  }
}
