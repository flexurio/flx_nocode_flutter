import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchMaterialReturn extends StatelessWidget
    implements DropDownObject<MaterialReturn> {
  const FDropDownSearchMaterialReturn({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final MaterialReturn? initialValue;

  @override
  final void Function(MaterialReturn?) onChanged;

  @override
  final String? label;

  @override
  final bool isRequired;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(MaterialReturn?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<MaterialReturnQueryBloc, MaterialReturnQueryState>(
      builder: (context, state) {
        return FDropDownSearch<MaterialReturn>(
          labelText: label ?? Entity.materialReturn.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          enabled: enabled,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: (_) => Status.progress,
            orElse: () => Status.loaded,
          ),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (materialReturn) => materialReturn.data,
          ),
          itemAsString: (materialReturn) => materialReturn.id,
        );
      },
    );
  }
}
