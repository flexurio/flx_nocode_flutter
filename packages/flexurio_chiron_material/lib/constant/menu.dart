import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_design/material_design_page.dart';

final menu = [
  Menu1(
    label: 'PPIC',
    menu: [
      Menu2(
        label: 'Materials',
        icon: FontAwesomeIcons.layerGroup,
        menu: menu3Materials,
      ),
    ],
  ),
  Menu1(
    label: 'research_and_development',
    menu: [
      Menu2(
        label: 'RND',
        icon: FontAwesomeIcons.flask,
        menu: menu3MaterialDesigns,
      ),
    ],
  ),
];

final menu3MaterialDesigns = [
  Menu3(
    label: 'Material Design',
    home: MaterialDesignPage(isExternal: false),
    permission: PermissionMaterial.materialDesignViewMenu(isExternal: false),
    permissions: [
      PermissionMaterial.materialDesignViewMenu(isExternal: false),
      PermissionMaterial.materialDesignCreate(isExternal: false),
      PermissionMaterial.materialDesignDelete(isExternal: false),
      PermissionMaterial.materialDesignEdit(isExternal: false),
    ],
  ),
  Menu3(
    label: 'Material Design External',
    home: MaterialDesignPage(isExternal: true),
    permission: PermissionMaterial.materialDesignViewMenu(isExternal: true),
    permissions: [
      PermissionMaterial.materialDesignViewMenu(isExternal: true),
      PermissionMaterial.materialDesignCreate(isExternal: true),
      PermissionMaterial.materialDesignDelete(isExternal: true),
      PermissionMaterial.materialDesignEdit(isExternal: true),
    ],
  ),
];

final menu3Materials = [
  Menu3(
    label: 'type',
    home: const MaterialTypePage(),
    permission: PermissionMaterial.materialTypeViewMenu,
    permissions: [
      PermissionMaterial.materialTypeViewMenu,
      PermissionMaterial.materialTypeCreate,
      PermissionMaterial.materialTypeDelete,
    ],
  ),
  Menu3(
    label: 'Material',
    home: MaterialPage.prepare(isExternal: false),
    permission: PermissionMaterial.materialViewMenu(isExternal: false),
    permissions: [
      PermissionMaterial.materialViewMenu(isExternal: false),
      PermissionMaterial.materialCreate(isExternal: false),
      PermissionMaterial.materialEdit(isExternal: false),
      PermissionMaterial.materialDelete(isExternal: false),
      Permission.materialLeadTimeEdit,
      Permission.materialApproveVendorListViewMenu,
      Permission.materialApproveVendorListCreate,
      Permission.materialApproveVendorListDelete,
      Permission.materialApproveVendorListEdit,
      Permission.materialApproveVendorListEditHalalCertificate,
      PermissionMaterial.materialExportExcel(isExternal: false),
      PermissionMaterial.materialExportPdf(isExternal: false),
      PermissionMaterial.materialActivateOrder(isExternal: false),
      PermissionMaterial.materialActivateStock(isExternal: false),
      PermissionMaterial.materialHalalCertificateExportExcel,
      PermissionMaterial.materialLeadtimeExportExcel,
    ],
  ),
  Menu3(
    label: 'Material External',
    home: MaterialPage.prepare(isExternal: true),
    permission: PermissionMaterial.materialViewMenu(isExternal: true),
    permissions: [
      PermissionMaterial.materialViewMenu(isExternal: true),
      PermissionMaterial.materialCreate(isExternal: true),
      PermissionMaterial.materialEdit(isExternal: true),
      PermissionMaterial.materialDelete(isExternal: true),
      PermissionMaterial.materialExportExcel(isExternal: true),
      PermissionMaterial.materialExportPdf(isExternal: true),
      PermissionMaterial.materialActivateOrder(isExternal: true),
      PermissionMaterial.materialActivateStock(isExternal: true),
    ],
  ),
  Menu3(
    label: 'Unit',
    home: const MaterialUnitPage(),
    permission: PermissionMaterial.materialUnitViewMenu,
    permissions: [
      PermissionMaterial.materialUnitViewMenu,
      PermissionMaterial.materialUnitCreate,
      PermissionMaterial.materialUnitEdit,
      PermissionMaterial.materialUnitDelete,
      Permission.unitConvertViewMenu,
      Permission.unitConvertCreate,
      Permission.unitConvertEdit,
      Permission.unitConvertDelete,
    ],
  ),
  Menu3(
    label: 'group',
    home: const MaterialGroupPage(),
    permission: Permission.materialGroupViewMenu,
    permissions: [
      Permission.materialGroupViewMenu,
      Permission.materialGroupCreate,
      Permission.materialGroupEdit,
      Permission.materialGroupDelete,
    ],
  ),
];
