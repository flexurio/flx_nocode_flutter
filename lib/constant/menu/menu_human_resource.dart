part of 'menu.dart';

final menuHumanResource = Menu1(
  label: 'human_resource',
  menu: [
    Menu2(
      label: 'Presences',
      icon: FontAwesomeIcons.chartBar,
      menu: [
        Menu3(
          label: 'Monthly Presence',
          home: MonthlyPresenceReportPage.prepare(),
          permission: Permission.presenceMonthlyReportViewMenu,
          permissions: [
            Permission.presenceMonthlyReportViewMenu,
          ],
        ),
        Menu3(
          label: 'Monthly Presence Per Employee',
          home: MonthlyPresenceReportPerEmployeePage.prepare(),
          permission: Permission.presenceMonthlyReportPerEmployeeViewMenu,
          permissions: [
            Permission.presenceMonthlyReportPerEmployeeViewMenu,
            Permission.presenceMonthlyReportPerEmployeeExportExcel,
            Permission.presenceMonthlyReportPerEmployeeExportPdf,
          ],
        ),
      ],
    ),
    Menu2(
      label: 'Structure',
      icon: FontAwesomeIcons.chess,
      menu: [
        Menu3(
          label: 'Office',
          home: const OfficePage(),
          permission: Permission.officeViewMenu,
          permissions: [
            Permission.officeViewMenu,
            Permission.officeCreate,
            Permission.officeDelete,
            Permission.officeEdit,
            Permission.officeEmployeeCreate,
          ],
        ),
        Menu3(
          label: 'Department',
          home: const DepartmentPage(),
          permission: Permission.departmentViewMenu,
          permissions: [
            Permission.departmentViewMenu,
            Permission.departmentCreate,
            Permission.departmentDelete,
            Permission.departmentEdit,
            Permission.departmentEmployeeEdit,
          ],
        ),
      ],
    ),
  ],
);
