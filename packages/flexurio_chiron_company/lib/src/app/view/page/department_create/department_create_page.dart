import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/department_group.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/department_type.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class DepartmentCreatePage extends StatefulWidget {
  const DepartmentCreatePage._(this.department);

  final Department? department;

  static Route<bool?> route({Department? department}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => DepartmentBloc()),
          BlocProvider(
            create: (context) => DepartmentGroupQueryBloc()
              ..add(const DepartmentGroupQueryEvent.fetch()),
          ),
          BlocProvider(
            create: (context) => DepartmentTypeQueryBloc()
              ..add(const DepartmentTypeQueryEvent.fetch()),
          ),
        ],
        child: DepartmentCreatePage._(department),
      ),
    );
  }

  @override
  State<DepartmentCreatePage> createState() => _DepartmentCreatePageState();
}

class _DepartmentCreatePageState extends State<DepartmentCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  late DataAction _action;
  DepartmentGroup? _departmentGroup;
  DepartmentType? _departmentType;

  @override
  void initState() {
    _action = createOrEdit(widget.department);
    super.initState();
    if (_action.isEdit) {
      _nameController.text = widget.department!.name;
      _idController.text = widget.department!.id;
      _departmentType = widget.department!.departmentType;
      _departmentGroup = widget.department!.departmentGroup;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late DepartmentEvent event;

      if (_action.isEdit) {
        event = DepartmentEvent.update(
          name: _nameController.text,
          department: widget.department!,
          group: _departmentGroup!,
          type: _departmentType!,
        );
      } else {
        event = DepartmentEvent.create(
          name: _nameController.text,
          id: _idController.text,
          group: _departmentGroup!,
          type: _departmentType!,
        );
      }

      context.read<DepartmentBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DepartmentBloc, DepartmentState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(_action, Entity.department);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          formKey: _formKey,
          action: _action,
          entity: Entity.department,
          actions: [
            BlocBuilder<DepartmentBloc, DepartmentState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                  action: _action,
                );
              },
            ),
          ],
          children: [
            FTextFormField(
              labelText: 'ID',
              enabled: _action.isCreate,
              controller: _idController,
              validator: requiredValidator.call,
              maxLength: 30,
            ),
            const Gap(12),
            FTextFormField(
              labelText: 'Name',
              controller: _nameController,
              validator: requiredValidator.call,
              inputFormatters: inputLetterOnly,
              maxLength: 30,
            ),
            const Gap(12),
            FDropDownSearchDepartmentGroup(
              initialValue: _departmentGroup,
              onChanged: (departmentGroup) {
                if (departmentGroup != null) {
                  _departmentGroup = departmentGroup;
                }
              },
            ),
            const Gap(12),
            FDropDownSearchDepartmentType(
              initialValue: _departmentType,
              onChanged: (departmentType) {
                if (departmentType != null) {
                  _departmentType = departmentType;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
