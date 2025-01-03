class PermissionProduct {
  static String productViewMenu({required bool isExternal}) =>
      isExternal ? 'product_external_view_menu' : 'product_view_menu';
  static String productCreate({required bool isExternal}) =>
      isExternal ? 'product_external_create' : 'product_create';
  static String productDelete({required bool isExternal}) =>
      isExternal ? 'product_external_delete' : 'product_delete';
  static String productEdit({required bool isExternal}) =>
      isExternal ? 'product_external_edit' : 'product_edit';
  static String productPrint({required bool isExternal}) =>
      isExternal ? 'product_external_print' : 'product_print';
  static String productPrintReport = 'product_print_report';
  static String productPrintDocumentExternal = 'product_print_document';

  // --
  static String productFormulationViewMenu({required bool isExternal}) =>
      isExternal
          ? 'product_formulation_external_view_menu'
          : 'product_formulation_view_menu';
  static String productFormulationCreate({required bool isExternal}) =>
      isExternal
          ? 'product_formulation_external_create'
          : 'product_formulation_create';
  static String productFormulationDelete({required bool isExternal}) =>
      isExternal
          ? 'product_formulation_external_delete'
          : 'product_formulation_delete';
  static String productFormulationEdit({required bool isExternal}) => isExternal
      ? 'product_formulation_external_edit'
      : 'product_formulation_edit';
  static String productFormulationExportExcel({required bool isExternal}) =>
      isExternal
          ? 'product_formulation_external_export_excel'
          : 'product_formulation_export_excel';

  // --
  static String productGroupViewMenu = 'product_group_view_menu';
  static String productGroupCreate = 'product_group_create';
  static String productGroupDelete = 'product_group_delete';

  // Product NIE
  static String productNieViewMenu = 'product_nie_view_menu';
  static String productNieCreate = 'product_nie_create';
  static String productNieDelete = 'product_nie_delete';

  // Product Price
  static String productPriceCreate = 'product_price_create';
  static String productPriceDelete = 'product_price_delete';
  static String productPriceViewMenu = 'product_price_view_menu';
}
