import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_core/src/app/bloc/theme/menu/menu_bloc.dart';
import 'package:flexurio_erp_core/src/app/bloc/theme/menu_collapse/menu_collapse.dart';
import 'package:flexurio_erp_core/src/app/view/page/menu/menu_side_nav.dart';
import 'package:flexurio_erp_core/src/app/view/page/menu/widget/menu_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:screen_identifier/screen_identifier.dart';

class MenuPage extends StatefulWidget {
  const MenuPage._(
    this.menu,
    this.accountPermissions,
    this.userName,
    this.userSubtitle,
    this.onLogout,
    this.appName,
    this.onChangePassword,
    this.searchData,
  );

  final List<Widget> Function(BuildContext context, String query) searchData;
  final String appName;
  final List<Menu1> menu;
  final List<String> accountPermissions;
  final String userName;
  final String userSubtitle;
  final void Function() onLogout;
  final void Function(BuildContext context) onChangePassword;

  static Widget prepare({
    required String appName,
    required List<Menu1> menu,
    required List<String> accountPermissions,
    required String accountName,
    required String accountSubtitle,
    required void Function() onLogout,
    required void Function(BuildContext context) onChangePassword,
    required List<Widget> Function(BuildContext context, String query)
        searchData,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MenuBloc()),
        BlocProvider(create: (_) => MenuCollapseBloc()),
      ],
      child: MenuPage._(
        menu,
        accountPermissions,
        accountName,
        accountSubtitle,
        onLogout,
        appName,
        onChangePassword,
        searchData,
      ),
    );
  }

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildContent(ScreenIdentifier screenIdentifier) {
    return Stack(
      children: [
        MenuContent(appName: widget.appName),
        _buildTopBar(),
        _buildSideNav(screenIdentifier),
        const Align(
          alignment: Alignment.bottomRight,
          child: VersionInfo(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(
          LogicalKeyboardKey.shift,
          LogicalKeyboardKey.alt,
          LogicalKeyboardKey.keyP,
        ): SearchIntent(),
        LogicalKeySet(
          LogicalKeyboardKey.shift,
          LogicalKeyboardKey.alt,
          LogicalKeyboardKey.keyT,
        ): GoToTicketIntent(),
      },
      child: Actions(
        actions: {
          SearchIntent: CallbackAction(
            onInvoke: (i) {
              showSearchDialog(
                context: context,
                menu: widget.menu,
                accountPermissions: widget.accountPermissions,
                searchData: widget.searchData,
              );
              return null;
            },
          ),
        },
        child: BlocBuilder<MenuCollapseBloc, bool>(
          builder: (context, collapsed) {
            return ScreenIdentifierBuilder(
              builder: (context, screenIdentifier) {
                context.read<MenuCollapseBloc>().add(
                      collapsed ||
                          screenIdentifier.conditions(
                            sm: false,
                            md: true,
                            lg: false,
                          ),
                    );
                return Scaffold(
                  key: _scaffoldKey,
                  drawer: MenuSideNav(
                    noCollapse: true,
                    menu: widget.menu,
                    accountPermission: widget.accountPermissions,
                  ),
                  body: _Boxed(
                    enabled: false,
                    child: _buildContent(screenIdentifier),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildSideNav(ScreenIdentifier screenIdentifier) {
    return BlocListener<MenuBloc, MenuState>(
      bloc: MenuBloc.instance,
      listener: (context, state) {
        if (state.triggerCloseDrawer) {
          _scaffoldKey.currentState?.closeDrawer();
        }
      },
      child: Visibility(
        visible: screenIdentifier.conditions(
          sm: false,
          md: true,
        ),
        child: MenuSideNav(
          menu: widget.menu,
          accountPermission: widget.accountPermissions,
          drawerTriggered: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
    );
  }

  TopBar _buildTopBar() {
    return TopBar(
      searchData: widget.searchData,
      menu: widget.menu,
      accountName: widget.userName,
      accountSubtitle: widget.userSubtitle,
      accountPermission: widget.accountPermissions,
      onLogout: widget.onLogout,
      onChangePassword: widget.onChangePassword,
      drawerTriggered: () {
        _scaffoldKey.currentState?.openDrawer();
      },
    );
  }
}

class _Boxed extends StatelessWidget {
  const _Boxed({
    required this.enabled,
    required this.child,
  });

  final bool enabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 40,
              ),
            ],
            borderRadius: BorderRadius.circular(24),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: child,
          ),
        ),
      ),
    );
  }
}

class VersionInfo extends StatelessWidget {
  const VersionInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Opacity(
        opacity: 0.3,
        child: FutureBuilder(
          builder: (context, snapshot) {
            return Text(
              snapshot.data?.version ?? '',
              style: const TextStyle(fontSize: 12),
            );
          },
          future: PackageInfo.fromPlatform(),
        ),
      ),
    );
  }
}

class GoToTicketIntent extends Intent {}
