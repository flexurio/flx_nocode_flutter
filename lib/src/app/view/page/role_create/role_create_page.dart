import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class RoleCreatePage extends StatefulWidget {
  const RoleCreatePage._(this.role);

  final Role? role;

  static Route<bool?> route({Role? role}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  RoleBloc(accessToken: UserRepositoryApp.instance.token!),),
        ],
        child: RoleCreatePage._(role),
      ),
    );
  }

  @override
  State<RoleCreatePage> createState() => _RoleCreatePageState();
}

class _RoleCreatePageState extends State<RoleCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  late DataAction _action;

  @override
  void initState() {
    _action = createOrEdit(widget.role);
    super.initState();
    if (_action.isEdit) {
      _nameController.text = widget.role!.name;
      _descriptionController.text = widget.role!.description;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late RoleEvent event;

      if (_action.isEdit) {
        event = RoleEvent.edit(
          name: _nameController.text,
          role: widget.role!,
          description: _descriptionController.text,
        );
      } else {
        event = RoleEvent.create(
          name: _nameController.text,
          description: _descriptionController.text,
        );
      }

      context.read<RoleBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RoleBloc, RoleState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(_action, Entity.role);
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
          entity: Entity.role,
          actions: [
            BlocBuilder<RoleBloc, RoleState>(
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
              labelText: 'Name',
              controller: _nameController,
              validator: requiredValidator.call,
              inputFormatters: inputLetterOnly,
              maxLength: 50,
            ),
            const Gap(12),
            FTextFormField(
              labelText: 'Description',
              controller: _descriptionController,
              validator: requiredValidator.call,
              maxLength: 100,
            ),
          ],
        ),
      ),
    );
  }
}
