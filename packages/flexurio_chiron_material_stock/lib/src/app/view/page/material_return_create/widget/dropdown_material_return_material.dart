import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return_material_query/material_return_material_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return_material.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchMaterialReturnMaterial extends StatelessWidget
    implements DropDownObject<MaterialReturnMaterial> {
  const FDropDownSearchMaterialReturnMaterial({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
    this.small = false,
  });

  @override
  final MaterialReturnMaterial? initialValue;

  @override
  final void Function(MaterialReturnMaterial?) onChanged;

  @override
  final String? label;

  @override
  final bool isRequired;

  @override
  final bool enabled;

  final bool small;

  @override
  Widget build(BuildContext context) {
    String? Function(MaterialReturnMaterial?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<MaterialReturnMaterialQueryBloc,
        MaterialReturnMaterialQueryState>(
      builder: (context, state) {
        if (small) {
          return DropDownSmall<MaterialReturnMaterial>(
            labelText: label ?? Entity.material.title,
            onChanged: onChanged,
            initialValue: initialValue,
            items: state.maybeWhen(
              orElse: () => [],
              loaded: (material) => material,
            ),
            itemAsString: (material) => material.materialName,
          );
        }
        return FDropDownSearch<MaterialReturnMaterial>(
          labelText: label ?? Entity.material.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          enabled: enabled,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: () => Status.progress,
            orElse: () => Status.loaded,
          ),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (material) =>
                material.distinct((e) => e.materialId + '-' + e.materialName),
          ),
          itemAsString: (material) =>
              '${material.materialId} - ${material.materialName}',
        );
      },
    );
  }
}
