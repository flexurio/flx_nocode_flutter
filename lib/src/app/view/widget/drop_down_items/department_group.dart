import 'package:flexurio_chiron_company/src/app/bloc/department_group_query/department_group_query_bloc.dart';
import 'package:flexurio_chiron_company/src/app/model/department_group.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchDepartmentGroup extends StatelessWidget
    implements DropDownObject<DepartmentGroup> {
  const FDropDownSearchDepartmentGroup({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.itemAsString,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final DepartmentGroup? initialValue;

  @override
  final void Function(DepartmentGroup?) onChanged;

  final String Function(DepartmentGroup?)? itemAsString;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(DepartmentGroup?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<DepartmentGroupQueryBloc, DepartmentGroupQueryState>(
      builder: (context, state) {
        return FDropDownSearch<DepartmentGroup>(
          enabled: enabled,
          labelText: label ?? Entity.departmentGroup.title,
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
            loaded: (departmentGroups) => departmentGroups,
          ),
          itemAsString:
              itemAsString ?? (departmentGroup) => departmentGroup.name,
        );
      },
    );
  }
}
