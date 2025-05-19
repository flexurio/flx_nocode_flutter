import 'dart:ui';

import 'package:flx_nocode_flutter/src/app/model/config.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';

final configFlavorAntonPaarDevelopment = FlavorConfig<AppConfig>(
  companyId: '04',
  companyName: 'Anton Paar',
  companyPhone: '+43 316 257 0',
  companyWebsite: 'www.anton-paar.com',
  companyAddress:
      'Kota Wisata Cibubur Jl. Raya Boulevard Cluster Beverly Hill G1 No 12, Ciangsana, Kec. Gn. Putri, Kabupaten Bogor, Jawa Barat 16968.',
  apiUrl: 'https://erp-anton-paar-api-dev.flexurio.com',
  colorSoft: const Color(0XFFCC0000).lighten(.5),
  color: const Color(0XFFCC0000),
  backgroundLoginPage: 'asset/image/background-3.jpg',
  applicationConfig: metiskaFarmaConfig(),
);

final configFlavorChironDemo = FlavorConfig<AppConfig>(
  companyId: '03',
  companyName: 'PT. Chiron',
  companyPhone: '1234567890',
  companyWebsite: 'www.example.com',
  companyAddress:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  apiUrl: 'https://dev.erp.api.farmasys.com',
  colorSoft: const Color(0XFF436EC1).lighten(.5),
  color: const Color(0XFF436EC1),
  backgroundLoginPage: 'asset/image/background-3.jpg',
  applicationConfig: metiskaFarmaConfig(),
);

final configFlavorMetiskaFarmaProduction = FlavorConfig(
  companyId: '01',
  companyName: 'PT. Metiska Farma',
  companyPhone: '(021) 7202351',
  companyWebsite: 'www.metiska.co.id',
  companyAddress:
      'Jl. Raya Kby. Lama No.557, RT.6/RW.1, Grogol Sel., Kec. Kby. Lama, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12220',
  apiUrl: 'https://erp-metiska-farma-api.flexurio.com',
  colorSoft: const Color(0XFF4D81F1).lighten(.3),
  color: const Color(0XFF4D81F1),
  backgroundLoginPage: 'asset/image/background-3.jpg',
  applicationConfig: metiskaFarmaConfig(),
);
final configFlavorMetiskaFarmaDevelopment = FlavorConfig(
  companyId: '01',
  companyName: 'PT. Metiska Farma',
  companyPhone: '(021) 7202351',
  companyWebsite: 'www.metiska.co.id',
  companyAddress:
      'Jl. Raya Kby. Lama No.557, RT.6/RW.1, Grogol Sel., Kec. Kby. Lama, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12220',
  apiUrl: 'https://dev.erp.api.farmasys.com',
  colorSoft: const Color(0XFF4D81F1).lighten(.3),
  color: const Color(0XFF4D81F1),
  backgroundLoginPage: 'asset/image/background-3.jpg',
  applicationConfig: metiskaFarmaConfig(),
);
final configFlavorTeguhsindoDevelopment = FlavorConfig(
  apiUrl: 'https://tl.api.dev.farmasys.com',
  companyId: '02',
  companyName: 'PT. Teguhsindo Lestaritama',
  companyPhone: '(021) 7202351',
  companyWebsite: 'www.metiska.co.id',
  companyAddress:
      'Jl. Raya Kby. Lama No.557, RT.6/RW.1, Grogol Sel., Kec. Kby. Lama, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12220',
  colorSoft: const Color(0XFF00A1E1).lighten(.5),
  color: const Color(0XFF00A1E1),
  backgroundLoginPage: 'asset/image/background-6.jpg',
  applicationConfig: metiskaFarmaConfig(),
);
final configFlavorTeguhsindoProduction = FlavorConfig(
  apiUrl: 'https://erp-teguhsindo-api.flexurio.com',
  companyId: '02',
  companyName: 'PT. Teguhsindo Lestaritama',
  companyPhone: '(021) 7202351',
  companyWebsite: 'www.metiska.co.id',
  companyAddress:
      'Jl. Raya Kby. Lama No.557, RT.6/RW.1, Grogol Sel., Kec. Kby. Lama, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12220',
  colorSoft: const Color(0XFF00A1E1).lighten(.5),
  color: const Color(0XFF00A1E1),
  backgroundLoginPage: 'asset/image/background-3.jpg',
  applicationConfig: metiskaFarmaConfig(),
);

AppConfig metiskaFarmaConfig() {
  return AppConfig(
    companyId: 'MF',
    companyExternals: ['MF', 'TL'],
    purchaseRequestCreateFilterMaterialGroup: ({
      required department,
      required materialGroups,
    }) {
      if (department.id != 'IT') {
        return materialGroups.where((e) => e.id != 'IT COMP').toList();
      }
      return materialGroups;
    },
    purchaseRequestCanCreatePurchaseOrder: ({required purchaseRequestDetail}) {
      return (purchaseRequestDetail.material?.isOrder ?? true) == false;
    },
  );
}
