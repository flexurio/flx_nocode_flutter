import 'package:appointment/constant/menu/menu.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:easy_localization/easy_localization.dart';

class PermissionPanel extends StatelessWidget {
  const PermissionPanel({
    required this.role,
    required this.search,
    super.key,
  });

  final String search;
  final Role role;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    final permission = <Widget>[];
    for (final menu1 in menu) {
      final group2 = <Widget>[];
      for (final menu2 in menu1.menu) {
        final group3 = <Widget>[];
        for (final menu3 in menu2.menu) {
          final permissions = <Widget>[];
          for (final permission in menu3.permissions) {
            if (Permission.label(permission)
                .toLowerCase()
                .contains(search.toLowerCase())) {
              permissions.add(
                _CheckBoxChip.prepare(permission: permission, role: role),
              );
            }
          }

          if (permissions.isNotEmpty) {
            group3.add(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(menu3.label.tr()),
                  Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(8),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: permissions,
                    ),
                  ),
                ],
              ),
            );
          }
        }

        if (group3.isNotEmpty) {
          group2.add(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menu2.label.tr(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Gap(3),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: group3,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      }

      final group1 = Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menu1.label?.tr() ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const Gap(6),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: group2,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
      if (group2.isNotEmpty) {
        permission.add(group1);
      }
    }

    return Expanded(
      child: SingleChildScrollView(
        child: Column(children: permission),
      ),
    );
  }
}

class _CheckBoxChip extends StatelessWidget {
  const _CheckBoxChip._({
    required this.permission,
    required this.role,
  });

  final String permission;
  final Role role;

  static Widget prepare({
    required String permission,
    required Role role,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RolePermissionBloc(
            accessToken: UserRepositoryApp.instance.token!,
          ),
        ),
      ],
      child: _CheckBoxChip._(permission: permission, role: role),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    return BlocBuilder<RolePermissionQueryBloc, RolePermissionQueryState>(
      builder: (context, stateQuery) {
        final isChecked = stateQuery.maybeWhen(
          orElse: () => false,
          loaded: (permissions) {
            return permissions.contains(permission);
          },
        );

        return BlocBuilder<RolePermissionBloc, RolePermissionState>(
          builder: (context, state) {
            final isProgress = stateQuery.maybeWhen(
                  orElse: () => false,
                  loading: () => true,
                ) ||
                state.maybeWhen(
                  orElse: () => false,
                  loading: () => true,
                );

            return InkWell(
              onTap: () {
                context.read<RolePermissionBloc>().add(
                      !isChecked
                          ? RolePermissionEvent.create(
                              role: role,
                              permission: permission,
                            )
                          : RolePermissionEvent.delete(
                              role: role,
                              permission: permission,
                            ),
                    );
                context.read<RolePermissionBloc>().add(
                      !isChecked
                          ? RolePermissionEvent.create(
                              role: role,
                              permission: permission,
                            )
                          : RolePermissionEvent.delete(
                              role: role,
                              permission: permission,
                            ),
                    );
              },
              child: Container(
                width: 200,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                decoration: BoxDecoration(
                  color: isChecked
                      ? primaryColor.withOpacity(.08)
                      : theme.cardColor,
                  border: Border.all(
                    color: isChecked
                        ? primaryColor.withOpacity(.2)
                        : theme.modeCondition(
                            Colors.grey.shade300,
                            Colors.white12,
                          ),
                  ),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: MultiBlocListener(
                  listeners: [
                    BlocListener<RolePermissionBloc, RolePermissionState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          success: () {
                            context.read<RolePermissionQueryBloc>().add(
                                  RolePermissionQueryEvent.toggle(
                                    permission: permission,
                                  ),
                                );
                          },
                          orElse: () {},
                        );
                      },
                    ),
                  ],
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: isChecked
                            ? Permission.action(permission)
                                .color
                                .withOpacity(.2)
                            : theme.dividerColor,
                        child: isProgress
                            ? const CupertinoActivityIndicator()
                            : Icon(
                                Permission.action(permission).icon,
                                color: isChecked
                                    ? Permission.action(permission).color
                                    : Colors.grey,
                              ),
                      ),
                      const Gap(6),
                      Expanded(
                        child: Text(
                          Permission.label(permission),
                          style: TextStyle(
                            fontSize: 12,
                            color: isChecked ? primaryColor : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
