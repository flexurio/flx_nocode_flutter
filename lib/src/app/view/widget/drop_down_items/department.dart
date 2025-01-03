import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchDepartment extends StatelessWidget
    implements DropDownObject<Department> {
  const FDropDownSearchDepartment({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.itemAsString,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final Department? initialValue;

  @override
  final void Function(Department?) onChanged;

  final String Function(Department?)? itemAsString;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(Department?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<DepartmentQueryBloc, DepartmentQueryState>(
      builder: (context, state) {
        return FDropDownSearch<Department>(
          enabled: enabled,
          labelText: label ?? Entity.department.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: (_) => Status.progress,
            orElse: () => Status.loaded,
          ),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (departments) => departments.data,
          ),
          itemAsString: itemAsString ?? (department) => department.name,
        );
      },
    );
  }
}
