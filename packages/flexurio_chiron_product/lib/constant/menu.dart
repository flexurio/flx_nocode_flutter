import 'package:flexurio_chiron_product/src/app/model/permission.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation/product_formulation_page.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_group/product_group_page.dart';
import 'package:flexurio_chiron_product/src/app/view/page/products/product_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

final menu = <Menu1>[
  Menu1(
    label: 'PPIC',
    menu: [
      Menu2(
        label: 'Products',
        icon: FontAwesomeIcons.tablets,
        menu: [
          ...menu3Products,
        ],
      ),
    ],
  ),
  Menu1(
    label: 'research_and_development',
    menu: [
      Menu2(
        label: 'RND',
        icon: FontAwesomeIcons.flask,
        menu: menu3BillOfMaterials,
      ),
    ],
  )
];

final menu3Products = [
  Menu3(
    label: 'product',
    home: const ProductPage(isExternal: false),
    permission: PermissionProduct.productViewMenu(isExternal: false),
    permissions: [
      PermissionProduct.productViewMenu(isExternal: false),
      PermissionProduct.productCreate(isExternal: false),
      PermissionProduct.productDelete(isExternal: false),
      PermissionProduct.productEdit(isExternal: false),
      PermissionProduct.productPrint(isExternal: false),
      PermissionProduct.productNieViewMenu,
      PermissionProduct.productNieCreate,
      PermissionProduct.productNieDelete,
      PermissionProduct.productPriceCreate,
      PermissionProduct.productPriceDelete,
      PermissionProduct.productPriceViewMenu,
      PermissionProduct.productPrintReport,
      PermissionProduct.productPrintDocumentExternal,
    ],
  ),
  Menu3(
    label: 'product_external',
    home: const ProductPage(isExternal: true),
    permission: PermissionProduct.productViewMenu(isExternal: true),
    permissions: [
      PermissionProduct.productViewMenu(isExternal: true),
      PermissionProduct.productCreate(isExternal: true),
      PermissionProduct.productDelete(isExternal: true),
      PermissionProduct.productEdit(isExternal: true),
      PermissionProduct.productPrint(isExternal: true),
    ],
  ),
  Menu3(
    label: 'Group',
    home: const ProductGroupPage(),
    permission: PermissionProduct.productGroupViewMenu,
    permissions: [
      PermissionProduct.productGroupViewMenu,
      PermissionProduct.productGroupCreate,
      PermissionProduct.productGroupDelete,
    ],
  ),
];

final menu3BillOfMaterials = [
  Menu3(
    label: 'Bill of Material',
    home: RndFormulationPage.prepare(isExternal: false),
    permission: PermissionProduct.productFormulationViewMenu(isExternal: false),
    permissions: [
      PermissionProduct.productFormulationViewMenu(isExternal: false),
      PermissionProduct.productFormulationCreate(isExternal: false),
      PermissionProduct.productFormulationDelete(isExternal: false),
      PermissionProduct.productFormulationEdit(isExternal: false),
      PermissionProduct.productFormulationExportExcel(isExternal: false),
    ],
  ),
  Menu3(
    label: 'Bill of Material External',
    home: RndFormulationPage.prepare(isExternal: true),
    permission: PermissionProduct.productFormulationViewMenu(isExternal: true),
    permissions: [
      PermissionProduct.productFormulationViewMenu(isExternal: true),
      PermissionProduct.productFormulationCreate(isExternal: true),
      PermissionProduct.productFormulationDelete(isExternal: true),
      PermissionProduct.productFormulationEdit(isExternal: true),
      PermissionProduct.productFormulationExportExcel(isExternal: true),
    ],
  ),
];
