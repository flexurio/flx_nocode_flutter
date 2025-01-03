import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

final menu = [
  Menu1(
    label: 'production',
    menu: [
      Menu2(
        label: 'Schedule',
        icon: FontAwesomeIcons.solidClock,
        menu: [
          Menu3(
            label: 'Production Order',
            home: const ProductionOrderPage(isExternal: false),
            permission:
                PermissionProduction.productionOrderViewMenu(isExternal: false),
            permissions: [
              PermissionProduction.productionOrderViewMenu(isExternal: false),
              PermissionProduction.productionOrderCreate(isExternal: false),
              PermissionProduction.productionOrderDelete(isExternal: false),
              PermissionProduction.productionOrderEdit(isExternal: false),
              PermissionProduction.productionOrderRework(isExternal: false),
            ],
          ),
          Menu3(
            label: 'Production Order External',
            home: const ProductionOrderPage(isExternal: true),
            permission:
                PermissionProduction.productionOrderViewMenu(isExternal: true),
            permissions: [
              PermissionProduction.productionOrderViewMenu(isExternal: true),
              PermissionProduction.productionOrderCreate(isExternal: true),
              PermissionProduction.productionOrderDelete(isExternal: true),
              PermissionProduction.productionOrderEdit(isExternal: true),
              PermissionProduction.productionOrderRework(isExternal: true),
            ],
          ),
          Menu3(
            label: 'Service Order',
            home: const ProductionServiceOrderPage(),
            permission: PermissionProduction.productionServiceOrderViewMenu,
            permissions: [
              PermissionProduction.productionServiceOrderViewMenu,
              PermissionProduction.productionServiceOrderCreate,
              PermissionProduction.productionServiceOrderDelete,
              PermissionProduction.productionServiceOrderEdit,
              PermissionProduction.productionServiceOrderRework,
            ],
          ),
          Menu3(
            label: 'Work Hour',
            home: const WorkHourShiftPage(),
            permission: Permission.workHourShiftViewMenu,
            permissions: [
              Permission.workHourShiftViewMenu,
              Permission.workHourShiftCreate,
              Permission.workHourShiftDelete,
              Permission.workHourShiftEdit,
            ],
          ),
          Menu3(
            label: 'schedule',
            home: const SchedulePage(isExternal: false),
            permission:
                PermissionProduction.scheduleViewMenu(isExternal: false),
            permissions: [
              PermissionProduction.scheduleViewMenu(isExternal: false),
              PermissionProduction.scheduleCreate(isExternal: false),
              PermissionProduction.scheduleDelete(isExternal: false),
              PermissionProduction.scheduleEdit(isExternal: false),
              PermissionProduction.scheduleClose(isExternal: false),
              PermissionProduction.scheduleDetailCreate(isExternal: false),
              PermissionProduction.scheduleDetailEdit(isExternal: false),
              PermissionProduction.scheduleDetailValidate(isExternal: false),
              PermissionProduction.scheduleDetailDelete(isExternal: false),
              PermissionProduction.scheduleExportExcel(isExternal: false),
              PermissionProduction.productionMonitoringExportExcel,
            ],
          ),
          Menu3(
            label: 'schedule_external',
            home: const SchedulePage(isExternal: true),
            permission: PermissionProduction.scheduleViewMenu(isExternal: true),
            permissions: [
              PermissionProduction.scheduleViewMenu(isExternal: true),
              PermissionProduction.scheduleCreate(isExternal: true),
              PermissionProduction.scheduleDelete(isExternal: true),
              PermissionProduction.scheduleEdit(isExternal: true),
              PermissionProduction.scheduleClose(isExternal: true),
              PermissionProduction.scheduleDetailCreate(isExternal: true),
              PermissionProduction.scheduleDetailEdit(isExternal: true),
              PermissionProduction.scheduleDetailValidate(isExternal: true),
              PermissionProduction.scheduleDetailDelete(isExternal: true),
              PermissionProduction.scheduleExportExcel(isExternal: true),
            ],
          ),
        ],
      ),
      Menu2(
        label: 'Manufacturing',
        icon: FontAwesomeIcons.industry,
        menu: [
          Menu3(
            label: 'Line',
            home: const ProductionLinePage(),
            permission: PermissionProduction.productionLineViewMenu,
            permissions: [
              PermissionProduction.productionLineViewMenu,
              PermissionProduction.productionLineCreate,
              PermissionProduction.productionLineDelete,
              PermissionProduction.productionLineEdit,
            ],
          ),
          Menu3(
            label: 'machine',
            home: const ProductionMachinePage(),
            permission: PermissionProduction.productionMachineViewMenu,
            permissions: [
              PermissionProduction.productionMachineViewMenu,
              PermissionProduction.productionMachineCreate,
              PermissionProduction.productionMachineDelete,
              PermissionProduction.productionMachineEdit,
            ],
          ),
          Menu3(
            label: 'Stage',
            home: const ProductionStagePage(),
            permission: PermissionProduction.productionStageViewMenu,
            permissions: [
              PermissionProduction.productionStageViewMenu,
              PermissionProduction.productionStageCreate,
              PermissionProduction.productionStageDelete,
              PermissionProduction.productionStageEdit,
              PermissionProduction.productionSubStageCreate,
              PermissionProduction.productionSubStageDelete,
              PermissionProduction.productionSubStageEdit,
              PermissionProduction.productionSubStageActivate,
              PermissionProduction.productionSubStageDeactivate,
            ],
          ),
          Menu3(
            label: 'Stage Process',
            home: const ProductionStageProcessPage(),
            permission: PermissionProduction.productionStageProcessViewMenu,
            permissions: [
              PermissionProduction.productionStageProcessViewMenu,
              PermissionProduction.productionStageProcessCreate,
              PermissionProduction.productionStageProcessDelete,
              PermissionProduction.productionStageProcessEdit,
            ],
          ),
        ],
      ),
    ],
  ),
];
