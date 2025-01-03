import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    required this.onSuccess,
    super.key,
  });

  final void Function(String authId) onSuccess;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(
            LoginEvent.submit(
              _nipController.text,
              _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (authId) => widget.onSuccess(authId),
          orElse: () {},
        );
      },
      child: Form(
        key: _formKey,
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Employee Login',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(height: 30),
                GlassTextFormField(
                  labelText: 'NIP',
                  controller: _nipController,
                  validator: requiredValidator.call,
                  errorText: state.maybeMap(
                    error: (value) => value.nip,
                    orElse: () => null,
                  ),
                ),
                const Gap(12),
                GlassTextFormField(
                  labelText: 'Password',
                  controller: _passwordController,
                  validator: requiredValidator.call,
                  obscureText: true,
                  errorText: state.maybeMap(
                    error: (value) => value.password,
                    orElse: () => null,
                  ),
                  onEditingComplete: state.maybeWhen(
                    loading: () => null,
                    orElse: () => _submit,
                  ),
                ),
                const SizedBox(height: 30),
                Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                  action: DataAction.login,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
