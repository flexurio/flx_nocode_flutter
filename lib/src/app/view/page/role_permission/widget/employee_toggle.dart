import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class EmployeeToggle extends StatefulWidget {
  const EmployeeToggle._({
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
    required Role role,
    required bool visibleIncludeOnly,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RoleEmployeeBloc(
            role: role,
            accessToken: UserRepositoryApp.instance.token!,
          ),
        ),
      ],
      child: EmployeeToggle._(
        key: ValueKey(employee.nip),
        employee: employee,
        initial: initial,
        visibleIncludeOnly: visibleIncludeOnly,
      ),
    );
  }

  @override
  State<EmployeeToggle> createState() => _EmployeeToggleState();
}

class _EmployeeToggleState extends State<EmployeeToggle> {
  late bool _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initial;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<RoleEmployeeBloc, RoleEmployeeState>(
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
              BlocBuilder<RoleEmployeeBloc, RoleEmployeeState>(
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
                          context.read<RoleEmployeeBloc>().add(
                                _selected
                                    ? RoleEmployeeEvent.create(
                                        widget.employee.nip,
                                      )
                                    : RoleEmployeeEvent.delete(
                                        widget.employee.nip,
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
