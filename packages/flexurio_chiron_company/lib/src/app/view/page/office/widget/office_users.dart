import 'package:flexurio_chiron_company/src/app/bloc/office_employee_query/office_employee_query_bloc.dart';
import 'package:flexurio_chiron_company/src/app/model/office.dart';
import 'package:flexurio_chiron_company/src/app/view/page/office/widget/office_employee_toggle.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class OfficeUsers extends StatefulWidget {
  const OfficeUsers._({required this.office});

  static Widget prepare({required Office office}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => OfficeEmployeeQueryBloc(office.id)
            ..add(const OfficeEmployeeQueryEvent.get()),
        ),
      ],
      child: OfficeUsers._(office: office),
    );
  }

  final Office office;

  @override
  State<OfficeUsers> createState() => _OfficeUsersState();
}

class _OfficeUsersState extends State<OfficeUsers> {
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfficeEmployeeQueryBloc, OfficeEmployeeQueryState>(
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
                'Employee on ${widget.office.name}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
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
                  loaded: (employees, officeEmployees) {
                    return ListView(
                      children: List.generate(employees.length, (index) {
                        final employee = employees[index];
                        final initial = officeEmployees.contains(
                          employee.nip,
                        );
                        return Visibility(
                          maintainState: true,
                          visible:
                              employee.name.toLowerCase().contains(_search) ||
                                  employee.nip.toLowerCase().contains(_search),
                          child: UserOfficeToggle.prepare(
                            visibleIncludeOnly: !_searching,
                            officeId: widget.office.id,
                            employee: employee,
                            initial: initial,
                          ),
                        );
                      }),
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
