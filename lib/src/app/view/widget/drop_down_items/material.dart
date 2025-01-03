import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchMaterial extends StatelessWidget
    implements DropDownObject<Material> {
  const FDropDownSearchMaterial({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
    this.items,
  });

  @override
  final Material? initialValue;

  @override
  final void Function(Material?) onChanged;

  @override
  final String? label;

  @override
  final bool isRequired;

  @override
  final bool enabled;

  final List<Material>? items;

  @override
  Widget build(BuildContext context) {
    String? Function(Material?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<MaterialQueryBloc, MaterialQueryState>(
      builder: (context, state) {
        return FDropDownSearch<Material>(
          labelText: label ?? Entity.material.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          enabled: enabled,
          status: items != null
              ? Status.loaded
              : state.maybeWhen(
                  error: (_) => Status.error,
                  loading: (_) => Status.progress,
                  orElse: () => Status.loaded,
                ),
          items: items ??
              state.maybeWhen(
                orElse: () => [],
                loaded: (material) => material.data,
              ),
          itemAsString: (material) => '[${material.id}] ${material.name}',
        );
      },
    );
  }
}
