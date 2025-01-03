import 'package:flexurio_chiron_material/src/app/bloc/material_unit_query/material_unit_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchMaterialUnit extends StatefulWidget {
  const FDropDownSearchMaterialUnit({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  final MaterialUnit? initialValue;
  final void Function(MaterialUnit? value) onChanged;
  final String? label;
  final bool isRequired;
  final bool enabled;

  @override
  State<FDropDownSearchMaterialUnit> createState() =>
      _FDropDownSearchMaterialUnitState();
}

class _FDropDownSearchMaterialUnitState
    extends State<FDropDownSearchMaterialUnit> {
  String? Function(MaterialUnit?)? validator;

  @override
  void initState() {
    super.initState();
    if (widget.isRequired) {
      validator = requiredObjectValidator.call;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialUnitQueryBloc, MaterialUnitQueryState>(
      builder: (context, state) {
        return FDropDownSearch<MaterialUnit>(
          labelText: widget.label ?? Entity.materialUnit.title,
          onChanged: widget.onChanged,
          initialValue: widget.initialValue,
          validator: validator,
          enabled: widget.enabled,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: (_) => Status.progress,
            orElse: () => Status.loaded,
          ),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (materialUnits) => materialUnits.data,
          ),
          itemAsString: (materialUnit) => materialUnit.id,
        );
      },
    );
  }
}
