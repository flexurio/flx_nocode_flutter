import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthenticationChecker extends StatelessWidget {
  const AuthenticationChecker({
    required this.home, 
    super.key,
  });

  final Widget home;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticated: (_, __, ___) => context.go('/home'),
          orElse: () => context.go('/login'),
        );
      },
      bloc: AuthenticationBloc.instance,
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return state.maybeWhen(
            authenticated: (_, __, ___) => home,
            orElse: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}

class AuthenticationBuilder extends StatelessWidget {
  const AuthenticationBuilder({
    required this.authenticated,
    required this.unAuthenticated,
    super.key,
  });
  final Widget Function() authenticated;
  final Widget unAuthenticated;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      bloc: AuthenticationBloc.instance,
      builder: (context, state) {
        return state.maybeWhen(
          authenticated: (_, __, ___) => authenticated(),
          orElse: () => unAuthenticated,
        );
      },
    );
  }
}
