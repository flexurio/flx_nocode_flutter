import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchMaterialReceive extends StatelessWidget
    implements DropDownObject<MaterialReceive> {
  const FDropDownSearchMaterialReceive({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final MaterialReceive? initialValue;

  @override
  final void Function(MaterialReceive?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(MaterialReceive?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<MaterialReceiveQueryBloc, MaterialReceiveQueryState>(
      builder: (context, state) {
        return FDropDownSearch<MaterialReceive>(
          enabled: enabled,
          labelText: label ?? EntityMaterialStock.materialReceive.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: () => Status.progress,
            orElse: () => Status.loaded,
          ),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (materialReceive) => materialReceive,
          ),
          itemAsString: (materialReceive) => materialReceive.id,
        );
      },
    );
  }
}
