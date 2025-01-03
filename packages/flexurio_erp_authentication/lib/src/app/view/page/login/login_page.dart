import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_authentication/src/app/util/on_login_success.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_identifier/screen_identifier.dart';

class LoginPage extends StatefulWidget {
  const LoginPage._(this.onLoginSuccess);

  final OnLoginSuccess onLoginSuccess;

  static Widget prepare({required OnLoginSuccess onLoginSuccess}) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => LoginBloc())],
      child: LoginPage._(onLoginSuccess),
    );
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _pageController = PageController();
  var _authId = '';

  void _switchPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenIdentifierBuilder(
      builder: (context, screenIdentifier) {
        final contentPadding = screenIdentifier.conditions(
          sm: const EdgeInsets.only(
            right: paddingHorizontalPage,
            left: paddingHorizontalPage,
          ),
          md: const EdgeInsets.only(right: 150, left: 150),
          lg: const EdgeInsets.only(right: 450, left: 150),
        );
        return Background(
          asset: AssetBackground.displayLogin,
          child: Center(
            child: ContainerGlass(
              width:
                  screenIdentifier.conditions(sm: true, md: false) ? null : 900,
              height:
                  screenIdentifier.conditions(sm: true, md: false) ? null : 600,
              child: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    children: [
                      AnimatedContainer(
                        padding: contentPadding,
                        duration: const Duration(milliseconds: 350),
                        child: LoginForm(
                          onSuccess: (authId) {
                            setState(() => _authId = authId);
                            _switchPage(1);
                          },
                        ),
                      ),
                      Padding(
                        padding: contentPadding,
                        child: VerifyCodeForm.prepare(
                          authId: _authId,
                          onBackPressed: () => _switchPage(0),
                          onLoginSuccess: widget.onLoginSuccess,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 600,
                    bottom: 0,
                    top: 0,
                    right: 0,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: screenIdentifier.conditions(md: false, lg: true)
                          ? const ContainerGlass(
                              width: 300,
                              elevation: 0,
                              opacity: .6,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 24),
                                    child: LogoNamed(),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
