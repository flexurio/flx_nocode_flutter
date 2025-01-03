import 'package:flexurio_chiron_material/src/app/bloc/material_design_query/material_design_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchMaterialDesign extends StatelessWidget
    implements DropDownObject<MaterialDesign> {
  const FDropDownSearchMaterialDesign({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final MaterialDesign? initialValue;

  @override
  final void Function(MaterialDesign?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(MaterialDesign?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<MaterialDesignQueryBloc, MaterialDesignQueryState>(
      builder: (context, state) {
        return FDropDownSearch<MaterialDesign>(
          enabled: enabled,
          initialValue: initialValue,
          onChanged: onChanged,
          validator: validator,
          labelText: label ?? Entity.materialDesign.title,
          itemAsString: (materialDesign) => materialDesign.designCode,
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (materialGroups) => materialGroups.data,
          ),
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: (_) => Status.progress,
            orElse: () => Status.loaded,
          ),
        );
      },
    );
  }
}
