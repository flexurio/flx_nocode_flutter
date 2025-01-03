import 'package:flexurio_erp_core/constant/size.dart';
import 'package:flexurio_erp_core/src/app/bloc/theme/menu/menu_bloc.dart';
import 'package:flexurio_erp_core/src/app/bloc/theme/menu_collapse/menu_collapse.dart';
import 'package:flexurio_erp_core/src/app/view/widget/offline_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_identifier/screen_identifier.dart';

class MenuContent extends StatelessWidget {
  const MenuContent({
    required this.appName,
    super.key,
  });

  final String appName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<MenuCollapseBloc, bool>(
      builder: (context, state) {
        return ScreenIdentifierBuilder(
          builder: (context, screenIdentifier) {
            return AnimatedContainer(
              decoration: BoxDecoration(color: theme.cardColor),
              duration: const Duration(milliseconds: 200),
              padding: screenIdentifier.conditions(
                md: EdgeInsets.only(
                  left: state ? sideNavWidthCollapsed : sideNavWidth,
                  bottom: 24,
                  right: 24,
                  top: 80,
                ),
                sm: const EdgeInsets.only(top: 64),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        color: theme.scaffoldBackgroundColor,
                        child: Stack(
                          children: [
                            BlocBuilder<MenuBloc, MenuState>(
                              bloc: MenuBloc.instance,
                              builder: (context, state) {
                                return MaterialApp(
                                  key: ValueKey(state.label),
                                  title: '$appName - ${state.label}',
                                  debugShowCheckedModeBanner: false,
                                  theme: theme,
                                  home: Material(
                                    color: Colors.transparent,
                                    child: state.home,
                                  ),
                                );
                              },
                            ),
                            const Positioned(
                              top: 0,
                              right: 0,
                              left: 0,
                              child: OfflineIndicator(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
