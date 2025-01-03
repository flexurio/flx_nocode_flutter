part of 'menu.dart';

final menuItDevelopment = Menu1(
  label: 'it_development',
  menu: [
    Menu2(
      label: 'Support',
      icon: FontAwesomeIcons.ticketAlt,
      menu: [
        Menu3(
          label: 'Ticket',
          home: const TicketPage(),
          permission: null,
          permissions: [
            Permission.ticketViewMenu,
            Permission.ticketCommentDelete,
            Permission.ticketCreate,
            Permission.ticketDelete,
          ],
        ),
        Menu3(
          label: 'Role',
          home: const RolePage(),
          permission: Permission.roleViewMenu,
          permissions: [
            Permission.roleViewMenu,
            Permission.roleCreate,
            Permission.roleDelete,
            Permission.roleEdit,
            Permission.rolePermissionEdit,
          ],
        ),
      ],
    ),
  ],
);
