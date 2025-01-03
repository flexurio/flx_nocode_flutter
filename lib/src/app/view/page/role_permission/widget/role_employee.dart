import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:appointment/src/app/view/page/role_permission/widget/employee_toggle.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RoleEmployee extends StatefulWidget {
  const RoleEmployee._({required this.role});

  static Widget prepare({required Role role}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RoleEmployeeQueryBloc(
            role: role,
            accessToken: UserRepositoryApp.instance.token!,
          )..add(const RoleEmployeeQueryEvent.fetch()),
        ),
      ],
      child: RoleEmployee._(role: role),
    );
  }

  final Role role;

  @override
  State<RoleEmployee> createState() => _RoleEmployeeState();
}

class _RoleEmployeeState extends State<RoleEmployee> {
  var _search = '';
  var _searching = false;
  final _focus = FocusNode();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focus.addListener(() {
      if (_focus.hasFocus) {
        setState(() {
          _searching = true;
        });
      }
    });
  }

  final Future<List<Employee>> _fetchUsers =
      EmployeeRepository.fetch(UserRepositoryApp.instance.token!);

  @override
  Widget build(BuildContext context) {
    return FCard(
      padding: const EdgeInsets.all(24),
      child: BlocBuilder<RoleEmployeeQueryBloc, RoleEmployeeQueryState>(
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state.maybeWhen(
              orElse: () => false,
              loading: () => true,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Employee on ${widget.role.name}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Gap(24),
                FTextFormField(
                  focusNode: _focus,
                  hintText: 'Add employee by name or nip',
                  suffixIcon: Visibility(
                    visible: _searching,
                    child: _ClearButton(() {
                      _controller.text = '';
                      _focus.unfocus();
                      setState(() {
                        _searching = false;
                      });
                    }),
                  ),
                  controller: _controller,
                  onChanged: (value) => setState(() => _search = value),
                ),
                const Gap(24),
                Text(
                  '${_focus.hasFocus ? 'All ' : ''}Employee',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: state.maybeWhen(
                    loaded: (roleUser) {
                      return FutureBuilder<List<Employee>>(
                        future: _fetchUsers,
                        builder: (context, snapshot) {
                          final employees = snapshot.data ?? [];
                          return ListView(
                            children: List.generate(employees.length, (index) {
                              final employee = employees[index];
                              final initial = roleUser.contains(
                                employee.nip,
                              );
                              return Visibility(
                                maintainState: true,
                                visible: employee.name
                                        .toLowerCase()
                                        .contains(_search) ||
                                    employee.nip
                                        .toLowerCase()
                                        .contains(_search),
                                child: EmployeeToggle.prepare(
                                  visibleIncludeOnly: !_searching,
                                  role: widget.role,
                                  employee: employee,
                                  initial: initial,
                                ),
                              );
                            }),
                          );
                        },
                      );
                    },
                    orElse: () => const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ClearButton extends StatelessWidget {
  const _ClearButton(this.onPressed);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: onPressed,
        child: CircleAvatar(
          foregroundColor: Colors.white,
          backgroundColor: theme.colorScheme.primary,
          radius: 12,
          child: const Icon(
            Icons.close,
            size: 16,
          ),
        ),
      ),
    );
  }
}
