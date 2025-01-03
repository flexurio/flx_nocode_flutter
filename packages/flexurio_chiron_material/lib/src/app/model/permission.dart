class PermissionMaterial {
// Material
  static String materialViewMenu({required bool isExternal}) =>
      isExternal ? 'material_external_view_menu' : 'material_view_menu';
  static String materialCreate({required bool isExternal}) =>
      isExternal ? 'material_external_create' : 'material_create';
  static String materialDelete({required bool isExternal}) =>
      isExternal ? 'material_external_delete' : 'material_delete';
  static String materialEdit({required bool isExternal}) =>
      isExternal ? 'material_external_edit' : 'material_edit';
  static String materialExportPdf({required bool isExternal}) =>
      isExternal ? 'material_external_export_pdf' : 'material_export_pdf';
  static String materialExportExcel({required bool isExternal}) =>
      isExternal ? 'material_external_export_excel' : 'material_export_excel';
  static String materialActivateStock({required bool isExternal}) => isExternal
      ? 'material_external_activate_stock'
      : 'material_activate_stock';
  static String materialActivateOrder({required bool isExternal}) => isExternal
      ? 'material_external_activate_order'
      : 'material_activate_order';
  static String recapMaterialPriceSupplierExportExcel =
      'recap_material_price_supplier_export_excel';

  // Material Design
  static String materialDesignViewMenu({required bool isExternal}) => isExternal
      ? 'material_design_external_view_menu'
      : 'material_design_view_menu';
  static String materialDesignCreate({required bool isExternal}) =>
      isExternal ? 'material_design_external_create' : 'material_design_create';
  static String materialDesignDelete({required bool isExternal}) =>
      isExternal ? 'material_design_external_delete' : 'material_design_delete';

  static String materialDesignEdit({required bool isExternal}) =>
      isExternal ? 'material_design_external_edit' : 'material_design_edit';

  // Material Type
  static String materialTypeViewMenu = 'material_type_view_menu';
  static String materialTypeCreate = 'material_type_create';
  static String materialTypeDelete = 'material_type_delete';

  // Material Unit
  static String materialUnitViewMenu = 'material_unit_view_menu';
  static String materialUnitCreate = 'material_unit_create';
  static String materialUnitDelete = 'material_unit_delete';
  static String materialUnitEdit = 'material_unit_edit';

  static String materialHalalCertificateExportExcel =
      'material_halal_certificate_export_excel';
  static String materialLeadtimeExportExcel = 'material_leadtime_export_excel';
  static String materialReceiveDetailExportExcel =
      'material_receive_detail_export_excel ';
}
