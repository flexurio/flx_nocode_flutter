import 'package:flexurio_chiron_vendor/src/app/model/material_approved_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 12);

Future<Page> pdfMaterialApprovedVendor(
  List<MaterialApprovedVendor> materialApprovedVendor,
) async {
  final font = await PdfGoogleFonts.nunitoExtraLight();
  return MultiPage(
    pageFormat: PdfPageFormat.a4,
    build: (Context context) {
      return [
        Text(
          'Material Approved Supplier Report',
          style: TextStyle(
            font: font,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'PT. Metiska Farma',
          style: TextStyle(font: font),
        ),
        for (final materials in materialApprovedVendor)
          DefaultTextStyle(
            style: TextStyle(font: font),
            child: _materialsHeader(
              data: [materials],
            ),
          ),
      ];
    },
  );
}

Flex _materialsHeader({
  required List<MaterialApprovedVendor> data,
}) {
  final groupData = groupBy(
    data,
    (materials) => '${materials.vendor.name} ${materials.supplier.name}',
  );

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: groupData.entries.map((entry) {
      final materials = entry.value;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: _materialBody(
          data: materials,
        ),
      );
    }).toList(),
  );
}

Flex _materialBody({
  required List<MaterialApprovedVendor> data,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 30),
      for (final material in data)
        Padding(
          padding: paddingRow,
          child: Text(
            material.material.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      Divider(
        height: 3,
        thickness: 3,
        color: PdfColor.fromHex('#7fd101'),
      ),
      for (final material in data)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  material.vendor.name,
                  style: const TextStyle(
                    fontSize: 10,
                    color: PdfColors.green700,
                  ),
                ),
              ),
              SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  material.supplier.name,
                  style: const TextStyle(
                    fontSize: 10,
                    color: PdfColors.green700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ...List.generate(
        data.length,
        (index) => Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(height: 1, thickness: 1, color: PdfColors.grey300),
              SizedBox(height: 5),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Storage Procedure : ${data[index].storageProcedure}',
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Divider(height: 1, thickness: 1, color: PdfColors.grey300),
              SizedBox(height: 5),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Category : ${data[index].category.label}',
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Divider(height: 1, thickness: 1, color: PdfColors.grey300),
              SizedBox(height: 5),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Description : ${data[index].description}',
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Divider(height: 1, thickness: 1, color: PdfColors.grey300),
              SizedBox(height: 5),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Type : ${data[index].type.label}',
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Divider(height: 1, thickness: 1, color: PdfColors.grey300),
              SizedBox(height: 5),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Certificate Document : ${data[index].sertificateDocument}',
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Divider(height: 1, thickness: 1, color: PdfColors.grey300),
              SizedBox(height: 5),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Halal No. Certificate : ${data[index].halalNoCertificate}',
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Divider(height: 1, thickness: 1, color: PdfColors.grey300),
              SizedBox(height: 5),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Halal Institution : ${data[index].halalInstitution}',
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Divider(height: 1, thickness: 1, color: PdfColors.grey300),
              SizedBox(height: 5),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Halal Certificate Expired : ${data[index].halalCertificateExpired?.yMMMMd ?? ''}',
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Divider(height: 1, thickness: 1, color: PdfColors.grey300),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    ],
  );
}
