import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchMaterialGroup extends StatelessWidget
    implements DropDownObject<MaterialGroup> {
  const FDropDownSearchMaterialGroup({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.label,
    this.enabled = true,
    this.small = false,
    this.format,
  });

  @override
  final MaterialGroup? initialValue;

  @override
  final void Function(MaterialGroup?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  final bool small;

  final List<String>? format;

  @override
  Widget build(BuildContext context) {
    String? Function(MaterialGroup?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>(
      builder: (context, state) {
        if (small) {
          return DropDownSmall<MaterialGroup>(
            key: ValueKey(initialValue),
            initialValue: initialValue,
            labelText: label ?? Entity.materialGroup.title,
            itemAsString: (materialGroup) => materialGroup.id,
            items: state.maybeWhen(
              orElse: () => [],
              loaded: (materialGroups) {
                if (format != null) {
                  return materialGroups.data
                      .where(
                        (group) => format!.contains(group.id),
                      )
                      .toList();
                } else {
                  return materialGroups.data;
                }
              },
            ),
            onChanged: onChanged,
          );
        }

        return FDropDownSearch<MaterialGroup>(
          enabled: enabled,
          labelText: label ?? Entity.materialGroup.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          itemAsString: (materialGroup) => materialGroup.id,
          status: state.maybeWhen(
            orElse: () => Status.loaded,
            loading: (_) => Status.progress,
            error: (_) => Status.error,
          ),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (materialGroups) => materialGroups.data,
          ),
        );
      },
    );
  }
}
