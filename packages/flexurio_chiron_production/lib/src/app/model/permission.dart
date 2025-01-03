class PermissionProduction {
  // --
  static String productionLineViewMenu = 'production_line_view_menu';
  static String productionLineCreate = 'production_line_create';
  static String productionLineDelete = 'production_line_delete';
  static String productionLineEdit = 'production_line_edit';

  // --
  static String productionMachineViewMenu = 'production_machine_view_menu';
  static String productionMachineCreate = 'production_machine_create';
  static String productionMachineDelete = 'production_machine_delete';
  static String productionMachineEdit = 'production_machine_edit';

  // --
  static String productionOrderViewMenu({required bool isExternal}) =>
      isExternal
          ? 'production_order_external_view_menu'
          : 'production_order_view_menu';
  static String productionOrderCreate({required bool isExternal}) => isExternal
      ? 'production_order_external_create'
      : 'production_order_create';
  static String productionOrderDelete({required bool isExternal}) => isExternal
      ? 'production_order_external_delete'
      : 'production_order_delete';
  static String productionOrderEdit({required bool isExternal}) =>
      isExternal ? 'production_order_external_edit' : 'production_order_edit';
  static String productionOrderRework({required bool isExternal}) => isExternal
      ? 'production_order_external_rework'
      : 'production_order_rework';

  // --
  static String productionServiceOrderViewMenu =
      'production_service_order_view_menu';
  static String productionServiceOrderCreate =
      'production_service_order_create';
  static String productionServiceOrderDelete =
      'production_service_order_delete';
  static String productionServiceOrderEdit = 'production_service_order_edit';
  static String productionServiceOrderRework =
      'production_service_order_rework';

  // --
  static String productionStageViewMenu = 'production_stage_view_menu';
  static String productionStageCreate = 'production_stage_create';
  static String productionStageDelete = 'production_stage_delete';
  static String productionStageEdit = 'production_stage_edit';
  static String productionSubStageCreate = 'production_sub_stage_create';
  static String productionSubStageDelete = 'production_sub_stage_delete';
  static String productionSubStageEdit = 'production_sub_stage_edit';
  static String productionSubStageActivate = 'production_sub_stage_activate';
  static String productionSubStageDeactivate =
      'production_sub_stage_deactivate';

  // --
  static String productionStageProcessViewMenu =
      'production_stage_process_view_menu';
  static String productionStageProcessCreate =
      'production_stage_process_create';
  static String productionStageProcessDelete =
      'production_stage_process_delete';
  static String productionStageProcessEdit = 'production_stage_process_edit';
  static String productionMonitoringExportExcel =
      'production_monitoring_export_excel';

  static String scheduleViewMenu({required bool isExternal}) =>
      isExternal ? 'schedule_external_view_menu' : 'schedule_view_menu';
  static String scheduleCreate({required bool isExternal}) =>
      isExternal ? 'schedule_external_create' : 'schedule_create';
  static String scheduleDelete({required bool isExternal}) =>
      isExternal ? 'schedule_external_delete' : 'schedule_delete';
  static String scheduleEdit({required bool isExternal}) =>
      isExternal ? 'schedule_external_edit' : 'schedule_edit';
  static String scheduleClose({required bool isExternal}) =>
      isExternal ? 'schedule_external_close' : 'schedule_close';
  static String scheduleDetailCreate({required bool isExternal}) =>
      isExternal ? 'schedule_external_detail_create' : 'schedule_detail_create';
  static String scheduleDetailEdit({required bool isExternal}) =>
      isExternal ? 'schedule_external_detail_edit' : 'schedule_detail_edit';
  static String scheduleDetailDelete({required bool isExternal}) =>
      isExternal ? 'schedule_external_detail_delete' : 'schedule_detail_delete';
  static String scheduleDetailValidate({required bool isExternal}) => isExternal
      ? 'schedule_external_detail_validate'
      : 'schedule_detail_validate';
  static String scheduleExportExcel({required bool isExternal}) =>
      isExternal ? 'schedule_external_export_excel' : 'schedule_export_excel';
  static String reportManHourProductionExportExcel({required bool isExternal}) =>
      isExternal ? 'report_man_hour_production_external_export_excel' : 'report_man_hour_production_export_excel';    
}
