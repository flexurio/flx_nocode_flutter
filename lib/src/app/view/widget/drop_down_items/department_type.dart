import 'package:flexurio_chiron_company/src/app/bloc/department_type_query/department_type_query_bloc.dart';
import 'package:flexurio_chiron_company/src/app/model/department_type.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchDepartmentType extends StatelessWidget
    implements DropDownObject<DepartmentType> {
  const FDropDownSearchDepartmentType({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.itemAsString,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final DepartmentType? initialValue;

  @override
  final void Function(DepartmentType?) onChanged;

  final String Function(DepartmentType?)? itemAsString;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(DepartmentType?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<DepartmentTypeQueryBloc, DepartmentTypeQueryState>(
      builder: (context, state) {
        return FDropDownSearch<DepartmentType>(
          enabled: enabled,
          labelText: label ?? Entity.departmentType.title,
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
            loaded: (departmentTypes) => departmentTypes,
          ),
          itemAsString: itemAsString ?? (departmentType) => departmentType.name,
        );
      },
    );
  }
}
