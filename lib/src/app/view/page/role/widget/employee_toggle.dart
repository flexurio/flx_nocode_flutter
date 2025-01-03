import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class UserDepartmentToggle extends StatefulWidget {
  const UserDepartmentToggle._({
    required this.employee,
    required this.initial,
    required this.visibleIncludeOnly,
    super.key,
  });

  final Employee employee;
  final bool initial;
  final bool visibleIncludeOnly;

  static Widget prepare({
    required Employee employee,
    required bool initial,
    required Department department,
    required bool visibleIncludeOnly,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DepartmentEmployeeBloc(department)),
      ],
      child: UserDepartmentToggle._(
        key: ValueKey(employee.nip),
        employee: employee,
        initial: initial,
        visibleIncludeOnly: visibleIncludeOnly,
      ),
    );
  }

  @override
  State<UserDepartmentToggle> createState() => _UserDepartmentToggleState();
}

class _UserDepartmentToggleState extends State<UserDepartmentToggle> {
  late bool _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initial;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<DepartmentEmployeeBloc, DepartmentEmployeeState>(
      listener: (context, state) {
        state.maybeMap(
          error: (value) {
            setState(() {
              _selected = !_selected;
            });
          },
          orElse: () {},
        );
      },
      child: Visibility(
        visible: !widget.visibleIncludeOnly || (_selected || widget.initial),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.employee.name,
                  maxLines: 1,
                ),
              ),
              Text(
                widget.employee.nip,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const Gap(12),
              BlocBuilder<DepartmentEmployeeBloc, DepartmentEmployeeState>(
                builder: (context, state) {
                  return Opacity(
                    opacity: state.maybeWhen(
                      loading: () => .5,
                      orElse: () => 1,
                    ),
                    child: AbsorbPointer(
                      absorbing: state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      ),
                      child: CupertinoSwitch(
                        activeColor: theme.colorScheme.primary,
                        value: _selected,
                        onChanged: (value) {
                          setState(() {
                            _selected = value;
                          });
                          context.read<DepartmentEmployeeBloc>().add(
                                _selected
                                    ? DepartmentEmployeeEvent.create(
                                        widget.employee,
                                      )
                                    : DepartmentEmployeeEvent.delete(
                                        widget.employee,
                                      ),
                              );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
