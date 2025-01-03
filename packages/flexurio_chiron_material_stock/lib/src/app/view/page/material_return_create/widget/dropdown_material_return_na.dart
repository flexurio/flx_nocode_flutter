import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return_na_query/material_return_na_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return_na.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchMaterialReturnNa extends StatelessWidget
    implements DropDownObject<MaterialReturnNa> {
  const FDropDownSearchMaterialReturnNa({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final MaterialReturnNa? initialValue;

  @override
  final void Function(MaterialReturnNa?) onChanged;

  @override
  final String? label;

  @override
  final bool isRequired;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(MaterialReturnNa?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<MaterialReturnNaQueryBloc, MaterialReturnNaQueryState>(
      builder: (context, state) {
        return FDropDownSearch<MaterialReturnNa>(
          labelText: label ?? 'NA',
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
            loaded: (materialReturnDetail) => materialReturnDetail,
          ),
          itemAsString: (materialReturnDetail) => materialReturnDetail.na,
        );
      },
    );
  }
}
